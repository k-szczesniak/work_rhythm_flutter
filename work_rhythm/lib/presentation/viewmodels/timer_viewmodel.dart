import 'dart:async';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/providers/repository_providers.dart';
import '../../domain/entities/distraction_entry.dart';
import '../../domain/entities/work_session.dart';
import '../../services/foreground_service/foreground_service_manager.dart';

part 'timer_viewmodel.freezed.dart';

enum TimerMode { idle, running, paused, stopped }

@freezed
class TimerState with _$TimerState {

    const factory TimerState({
        @Default(TimerMode.idle) TimerMode mode,
        int? activeSessionId,
        @Default(0) int grossSeconds,
        @Default(0) int netSeconds,
        @Default(28800) int targetSeconds,
        @Default(false) bool goalReached,
        @Default(false) bool hasOvertime,
        @Default(0) int overtimeSeconds,
        DateTime? sessionStart,
        @Default(false) bool openDistractionSheet,
    }) = _TimerState;

    const TimerState._();

    double get progress => targetSeconds > 0 ? netSeconds / targetSeconds : 0.0;

    String get formattedNetTime {
        final h = netSeconds ~/ 3600;
        final m = (netSeconds % 3600) ~/ 60;
        final s = netSeconds % 60;
        return '${h.toString().padLeft(2, '0')}:'
            '${m.toString().padLeft(2, '0')}:'
            '${s.toString().padLeft(2, '0')}';
    }

    String get formattedGrossTime {
        final h = grossSeconds ~/ 3600;
        final m = (grossSeconds % 3600) ~/ 60;
        final s = grossSeconds % 60;
        return '${h.toString().padLeft(2, '0')}:'
            '${m.toString().padLeft(2, '0')}:'
            '${s.toString().padLeft(2, '0')}';
    }

    /// Estimated end time based on current net progress toward target.
    DateTime? get estimatedEndTime {
        if (mode != TimerMode.running || netSeconds == 0) {
            return null;
        }
        final remaining = (targetSeconds - netSeconds).clamp(0, targetSeconds);
        return DateTime.now().add(Duration(seconds: remaining));
    }
}

class TimerViewmodel extends AsyncNotifier<TimerState> {

    Timer? _localTimer;

    void _onForegroundData(Object data) {
        if (data is! Map) {
            return;
        }
        final type = data['type'] as String?;
        switch (type) {
            case 'tick':
                _applyTick(data);
                break;
            case 'open_distraction_sheet':
                _openDistractionSheet();
                break;
        }
    }

    @override
    Future<TimerState> build() async {
        final configRepo = ref.read(configRepositoryProvider);
        final targetHours = await configRepo.getTargetHours();
        final targetSeconds = targetHours * 3600;

        // Restore active session from DB if any (e.g. after app restart)
        final sessionRepo = ref.read(workSessionRepositoryProvider);
        final active = await sessionRepo.getActiveSession();

        TimerState initial;
        if (active != null) {
            initial = TimerState(
                mode: active.status == WorkSessionStatus.running
                        ? TimerMode.running
                        : TimerMode.paused,
                activeSessionId: active.id,
                grossSeconds: active.grossSeconds,
                netSeconds: active.netSeconds,
                targetSeconds: targetSeconds,
                sessionStart: active.startTime,
                goalReached: active.netSeconds >= targetSeconds,
                hasOvertime: active.netSeconds >= targetSeconds,
                overtimeSeconds: active.netSeconds >= targetSeconds
                        ? active.netSeconds - targetSeconds
                        : 0,
            );
        } else {
            initial = TimerState(targetSeconds: targetSeconds);
        }

        _subscribeForegroundData();
        _startLocalTimer();

        ref.onDispose(() {
            _localTimer?.cancel();
            ForegroundServiceManager.removeTaskDataCallback(_onForegroundData);
        });

        return initial;
    }

    // ---------- public API ----------

    Future<void> start() async {
        final current = state.valueOrNull;
        if (current == null || current.mode == TimerMode.running) {
            return;
        }

        final startUseCase = ref.read(startWorkSessionProvider);
        final session = await startUseCase();

        final configRepo = ref.read(configRepositoryProvider);
        final targetHours = await configRepo.getTargetHours();

        await ForegroundServiceManager.startService(
            sessionId: session.id,
            targetSeconds: targetHours * 3600,
        );

        state = AsyncData(TimerState(
            mode: TimerMode.running,
            activeSessionId: session.id,
            targetSeconds: targetHours * 3600,
            sessionStart: session.startTime,
        ));
    }

    Future<void> pause() async {
        final current = state.valueOrNull;
        if (current == null || current.mode != TimerMode.running) {
            return;
        }
        ForegroundServiceManager.pause();
        state = AsyncData(current.copyWith(mode: TimerMode.paused));
    }

    Future<void> resume() async {
        final current = state.valueOrNull;
        if (current == null || current.mode != TimerMode.paused) {
            return;
        }
        ForegroundServiceManager.resume();
        state = AsyncData(current.copyWith(mode: TimerMode.running));
    }

    Future<void> stop() async {
        final current = state.valueOrNull;
        if (current == null || current.activeSessionId == null) {
            return;
        }
        ForegroundServiceManager.stop();

        final stopUseCase = ref.read(stopWorkSessionProvider);
        await stopUseCase(current.activeSessionId!);

        final configRepo = ref.read(configRepositoryProvider);
        final targetHours = await configRepo.getTargetHours();

        state = AsyncData(TimerState(
            mode: TimerMode.stopped,
            targetSeconds: targetHours * 3600,
        ));
    }

    Future<void> addDistraction({
        required DistractionCategory category,
        required int durationSeconds,
    }) async {
        final current = state.valueOrNull;
        if (current == null || current.activeSessionId == null) {
            return;
        }

        ForegroundServiceManager.addDistraction(
            category.name.toUpperCase(),
            durationSeconds,
        );

        final addUseCase = ref.read(addDistractionProvider);
        await addUseCase(
            sessionId: current.activeSessionId!,
            category: category,
            durationSeconds: durationSeconds,
        );
    }

    void acknowledgeDistractionSheet() {
        final current = state.valueOrNull;
        if (current == null) {
            return;
        }
        state = AsyncData(current.copyWith(openDistractionSheet: false));
    }

    // ---------- private ----------

    /// Drives the UI clock every second on platforms where foreground service
    /// does not deliver ticks (iOS simulator, desktop).
    /// On Android the foreground service overwrites gross/netSeconds with
    /// absolute values via [_applyTick], so double-counting is not possible.
    void _startLocalTimer() {
        _localTimer?.cancel();
        _localTimer = Timer.periodic(const Duration(seconds: 1), (_) {
            final current = state.valueOrNull;
            if (current == null || current.mode != TimerMode.running) {
                return;
            }
            final newGross = current.grossSeconds + 1;
            final newNet = current.netSeconds + 1;
            final newGoalReached = newNet >= current.targetSeconds;
            final newOvertime =
                    newGoalReached ? newNet - current.targetSeconds : 0;
            state = AsyncData(current.copyWith(
                grossSeconds: newGross,
                netSeconds: newNet,
                goalReached: newGoalReached,
                hasOvertime: newGoalReached,
                overtimeSeconds: newOvertime,
            ));
        });
    }

    void _subscribeForegroundData() {
        ForegroundServiceManager.addTaskDataCallback(_onForegroundData);
    }

    void _applyTick(Map<dynamic, dynamic> data) {
        final current = state.valueOrNull;
        if (current == null) {
            return;
        }

        final rawStatus = data['status'] as String? ?? 'running';
        final mode = _parseModeFromString(rawStatus);

        state = AsyncData(current.copyWith(
            mode: mode,
            grossSeconds: (data['gross_seconds'] as num?)?.toInt() ?? current.grossSeconds,
            netSeconds: (data['net_seconds'] as num?)?.toInt() ?? current.netSeconds,
            goalReached: data['goal_reached'] as bool? ?? current.goalReached,
            hasOvertime: data['has_overtime'] as bool? ?? current.hasOvertime,
            overtimeSeconds: (data['overtime_seconds'] as num?)?.toInt() ?? current.overtimeSeconds,
        ));
    }

    void _openDistractionSheet() {
        final current = state.valueOrNull;
        if (current == null) {
            return;
        }
        state = AsyncData(current.copyWith(openDistractionSheet: true));
    }

    TimerMode _parseModeFromString(String value) {
        switch (value) {
            case 'running':
                return TimerMode.running;
            case 'paused':
                return TimerMode.paused;
            case 'stopped':
                return TimerMode.stopped;
            default:
                return TimerMode.idle;
        }
    }
}

final timerViewmodelProvider =
        AsyncNotifierProvider<TimerViewmodel, TimerState>(TimerViewmodel.new);
