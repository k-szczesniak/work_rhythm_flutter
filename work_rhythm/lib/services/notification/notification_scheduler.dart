import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/providers/repository_providers.dart';
import '../../presentation/viewmodels/timer_viewmodel.dart';
import 'notification_service.dart';

final notificationSchedulerProvider =
        Provider<NotificationScheduler>((ref) {
    return NotificationScheduler(ref);
});

/// Monitors [TimerState] changes and triggers the appropriate notifications.
///
/// Call [start] once after app initialisation to begin listening.
/// The scheduler owns the following automation rules:
/// - Persistent timer updated every minute of net time change.
/// - Goal-achieved notification fired exactly once when [TimerState.goalReached] flips to true.
/// - Overtime warning fired once when overtime starts, then repeated every 30 min.
/// - Activity reminder fired when the timer has been running for more than
///   [_activityReminderMinutes] minutes without a distraction or pause.
class NotificationScheduler {

    NotificationScheduler(this._ref);

    static const int _overtimeRepeatIntervalMinutes = 30;

    final Ref _ref;

    bool _goalNotificationSent = false;

    int _lastOvertimeNotificationMinute = -1;

    int _lastNetMinuteNotified = -1;

    DateTime? _lastActivityResetTime;

    int _activityReminderMinutes = 90;

    void start() {
        _lastActivityResetTime = DateTime.now();
        _loadConfig();

        _ref.listen<AsyncValue<TimerState>>(
            timerViewmodelProvider,
            (previous, next) {
                final state = next.valueOrNull;
                if (state == null) {
                    return;
                }
                _handleStateChange(previous?.valueOrNull, state);
            },
        );
    }

    // -------------------------------------------------------------------------
    // State change handler
    // -------------------------------------------------------------------------

    void _handleStateChange(TimerState? previous, TimerState current) {
        _handleTimerModeChange(previous, current);
        _handlePersistentNotification(current);
        _handleGoalAchieved(current);
        _handleOvertimeWarning(current);
        _handleActivityReminder(previous, current);
    }

    void _handleTimerModeChange(TimerState? previous, TimerState current) {
        if (previous == null) {
            return;
        }
        final wasRunning = previous.mode == TimerMode.running;
        final isRunning = current.mode == TimerMode.running;

        if (!wasRunning && isRunning) {
            // Timer started or resumed — reset activity clock.
            _lastActivityResetTime = DateTime.now();
        }

        if (wasRunning && !isRunning) {
            // Timer paused or stopped — cancel persistent notification.
            if (current.mode == TimerMode.stopped) {
                _goalNotificationSent = false;
                _lastOvertimeNotificationMinute = -1;
                _lastNetMinuteNotified = -1;
                _ref.read(notificationServiceProvider).cancelPersistentTimer();
            }
        }
    }

    void _handlePersistentNotification(TimerState state) {
        if (state.mode != TimerMode.running && state.mode != TimerMode.paused) {
            return;
        }

        final currentMinute = state.netSeconds ~/ 60;
        if (currentMinute == _lastNetMinuteNotified) {
            return;
        }
        _lastNetMinuteNotified = currentMinute;

        _ref.read(notificationServiceProvider).showPersistentTimer(
            state.formattedNetTime,
            state.progress,
        );
    }

    void _handleGoalAchieved(TimerState state) {
        if (!state.goalReached || _goalNotificationSent) {
            return;
        }
        _goalNotificationSent = true;

        final targetHours = state.targetSeconds ~/ 3600;
        _ref.read(notificationServiceProvider).showGoalAchieved(targetHours);
    }

    void _handleOvertimeWarning(TimerState state) {
        if (!state.hasOvertime || state.mode != TimerMode.running) {
            return;
        }

        final overtimeMinutes = state.overtimeSeconds ~/ 60;

        // Fire immediately when overtime starts (overtimeMinutes == 0 initially).
        if (_lastOvertimeNotificationMinute == -1) {
            _lastOvertimeNotificationMinute = overtimeMinutes;
            _ref
                    .read(notificationServiceProvider)
                    .showOvertimeWarning(overtimeMinutes);
            return;
        }

        final minutesSinceLast = overtimeMinutes - _lastOvertimeNotificationMinute;
        if (minutesSinceLast >= _overtimeRepeatIntervalMinutes) {
            _lastOvertimeNotificationMinute = overtimeMinutes;
            _ref
                    .read(notificationServiceProvider)
                    .showOvertimeWarning(overtimeMinutes);
        }
    }

    void _handleActivityReminder(TimerState? previous, TimerState current) {
        if (current.mode != TimerMode.running) {
            return;
        }

        // Reset clock on any distraction (net seconds decreased) or pause/resume.
        final prevNet = previous?.netSeconds ?? current.netSeconds;
        if (current.netSeconds < prevNet) {
            _lastActivityResetTime = DateTime.now();
            return;
        }

        final resetTime = _lastActivityResetTime;
        if (resetTime == null) {
            return;
        }

        final elapsedMinutes =
                DateTime.now().difference(resetTime).inMinutes;
        if (elapsedMinutes >= _activityReminderMinutes) {
            _lastActivityResetTime = DateTime.now();
            _ref.read(notificationServiceProvider).showActivityReminder();
        }
    }

    // -------------------------------------------------------------------------
    // Config loading
    // -------------------------------------------------------------------------

    Future<void> _loadConfig() async {
        final configRepo = _ref.read(configRepositoryProvider);
        _activityReminderMinutes =
                await configRepo.getActivityReminderMinutes();
    }
}
