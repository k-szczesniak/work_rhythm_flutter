import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/providers/repository_providers.dart';
import '../../domain/entities/learning_goal.dart';
import '../../domain/entities/learning_session.dart';
import '../../presentation/viewmodels/timer_viewmodel.dart';

part 'learning_viewmodel.freezed.dart';

@freezed
class LearningState with _$LearningState {

    const factory LearningState({
        @Default([]) List<LearningGoal> goals,
        LearningSession? activeSession,
        LearningGoal? activeGoal,
        @Default(0) int currentSessionSeconds,
        @Default(false) bool isLoading,
        String? error,
    }) = _LearningState;
}

final learningViewmodelProvider =
        AsyncNotifierProvider<LearningViewmodel, LearningState>(
    LearningViewmodel.new,
);

class LearningViewmodel extends AsyncNotifier<LearningState> {

    @override
    Future<LearningState> build() async {
        return _loadState();
    }

    // -------------------------------------------------------------------------
    // Public actions
    // -------------------------------------------------------------------------

    Future<void> createGoal({
        required String name,
        required int targetMinutes,
        DateTime? deadline,
        String? description,
    }) async {
        state = const AsyncLoading();
        state = await AsyncValue.guard(() async {
            await ref.read(createLearningGoalProvider).call(
                name: name,
                targetMinutes: targetMinutes,
                deadline: deadline,
                description: description,
            );
            return _loadState();
        });
    }

    Future<void> startSession(int goalId) async {
        state = const AsyncLoading();
        state = await AsyncValue.guard(() async {
            // Pause work timer if running.
            final timerState = ref.read(timerViewmodelProvider).valueOrNull;
            if (timerState != null && timerState.mode == TimerMode.running) {
                await ref.read(timerViewmodelProvider.notifier).pause();
            }

            final session = await ref
                    .read(startLearningSessionProvider)
                    .call(goalId);
            final goals = await _fetchGoals();
            final activeGoal = goals.firstWhere(
                (g) => g.id == goalId,
                orElse: () => goals.first,
            );

            return LearningState(
                goals: goals,
                activeSession: session,
                activeGoal: activeGoal,
                currentSessionSeconds: 0,
            );
        });
    }

    Future<void> stopSession() async {
        final currentSession = state.valueOrNull?.activeSession;
        if (currentSession == null) {
            return;
        }

        state = const AsyncLoading();
        state = await AsyncValue.guard(() async {
            await ref
                    .read(stopLearningSessionProvider)
                    .call(currentSession.id);
            return _loadState();
        });
    }

    void tick() {
        final current = state.valueOrNull;
        if (current == null || current.activeSession == null) {
            return;
        }
        state = AsyncData(
            current.copyWith(
                currentSessionSeconds: current.currentSessionSeconds + 1,
            ),
        );
    }

    Future<void> refresh() async {
        state = const AsyncLoading();
        state = await AsyncValue.guard(_loadState);
    }

    // -------------------------------------------------------------------------
    // Private helpers
    // -------------------------------------------------------------------------

    Future<LearningState> _loadState() async {
        final goals = await _fetchGoals();
        final activeSession =
                await ref.read(learningRepositoryProvider).getActiveSession();

        LearningGoal? activeGoal;
        if (activeSession != null) {
            try {
                activeGoal = goals.firstWhere(
                    (g) => g.id == activeSession.goalId,
                );
            } catch (_) {
                activeGoal = null;
            }
        }

        return LearningState(
            goals: goals,
            activeSession: activeSession,
            activeGoal: activeGoal,
        );
    }

    Future<List<LearningGoal>> _fetchGoals() async {
        final repo = ref.read(learningRepositoryProvider);
        final rawGoals = await repo.getActiveGoals();

        // Enrich each goal with completedMinutes from the repository.
        final enriched = await Future.wait(
            rawGoals.map((goal) async {
                final completed =
                        await repo.getCompletedMinutesForGoal(goal.id);
                return goal.copyWith(completedMinutes: completed);
            }),
        );

        return enriched;
    }
}
