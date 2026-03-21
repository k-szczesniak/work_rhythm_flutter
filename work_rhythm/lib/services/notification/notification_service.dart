import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/constants/notification_channels.dart';

final notificationServiceProvider = Provider<NotificationService>((ref) {
    return NotificationService();
});

/// Wraps [FlutterLocalNotificationsPlugin] and exposes the 5 notification types
/// required by the Work Rhythm specification.
class NotificationService {

    static const int _persistentTimerId = 1;

    static const int _achievementId = 2;

    static const int _overtimeWarningId = 3;

    static const int _activityReminderId = 4;

    static const int _learningReminderId = 5;

    final FlutterLocalNotificationsPlugin _plugin =
            FlutterLocalNotificationsPlugin();

    /// Initialises the plugin and creates Android notification channels.
    /// Must be called once at app startup before showing any notification.
    Future<void> init() async {
        const initSettingsAndroid =
                AndroidInitializationSettings('@mipmap/ic_launcher');

        const initSettingsLinux = LinuxInitializationSettings(
            defaultActionName: 'Open',
        );

        const initSettings = InitializationSettings(
            android: initSettingsAndroid,
            linux: initSettingsLinux,
        );

        await _plugin.initialize(initSettings);
        await _createChannels();
    }

    // -------------------------------------------------------------------------
    // Public API
    // -------------------------------------------------------------------------

    /// Shows the persistent (ongoing) timer notification.
    ///
    /// [netTime] — formatted elapsed net time, e.g. "05:23:14".
    /// [progress] — value 0.0–1.0 used in body text.
    Future<void> showPersistentTimer(String netTime, double progress) async {
        final percent = (progress * 100).clamp(0, 100).round();
        const details = NotificationDetails(
            android: AndroidNotificationDetails(
                NotificationChannels.persistentTimerId,
                'Work Rhythm — Timer',
                channelDescription: 'Aktywny licznik czasu pracy',
                importance: Importance.min,
                priority: Priority.min,
                ongoing: true,
                autoCancel: false,
                onlyAlertOnce: true,
                actions: [
                    AndroidNotificationAction('btn_pause', 'Pauza'),
                    AndroidNotificationAction('btn_distraction', 'Rozproszony'),
                ],
            ),
        );

        await _plugin.show(
            _persistentTimerId,
            'Work Rhythm — $netTime',
            'Czas netto: $netTime ($percent% celu)',
            details,
        );
    }

    /// Cancels the persistent timer notification.
    Future<void> cancelPersistentTimer() async {
        await _plugin.cancel(_persistentTimerId);
    }

    /// One-shot notification fired when the daily goal is reached.
    Future<void> showGoalAchieved(int targetHours) async {
        const details = NotificationDetails(
            android: AndroidNotificationDetails(
                NotificationChannels.achievementId,
                'Work Rhythm — Osiągnięcia',
                channelDescription: 'Powiadomienie o osiągnięciu celu',
                importance: Importance.high,
                priority: Priority.high,
            ),
        );

        await _plugin.show(
            _achievementId,
            '✅ Cel dnia przepracowany!',
            'Świetnie! Przepracowałeś ${targetHours}h netto.',
            details,
        );
    }

    /// Repeating overtime warning shown every 30 min while in overtime.
    Future<void> showOvertimeWarning(int overtimeMinutes) async {
        const details = NotificationDetails(
            android: AndroidNotificationDetails(
                NotificationChannels.overtimeId,
                'Work Rhythm — Nadgodziny',
                channelDescription: 'Ostrzeżenie o nadgodzinach',
                importance: Importance.defaultImportance,
                priority: Priority.defaultPriority,
            ),
        );

        await _plugin.show(
            _overtimeWarningId,
            '⚠️ Nadgodziny',
            'Pracujesz już +${overtimeMinutes}min ponad plan',
            details,
        );
    }

    /// Reminder to move after a period of inactivity (default: 90 min).
    Future<void> showActivityReminder() async {
        const details = NotificationDetails(
            android: AndroidNotificationDetails(
                NotificationChannels.activityId,
                'Work Rhythm — Aktywność',
                channelDescription: 'Przypomnienie o aktywności fizycznej',
                importance: Importance.defaultImportance,
                priority: Priority.defaultPriority,
            ),
        );

        await _plugin.show(
            _activityReminderId,
            '🏃 Pora na ruch!',
            'Nie ruszyłeś się od 90 minut. Weź krótką przerwę.',
            details,
        );
    }

    /// Learning reminder for a specific goal.
    Future<void> showLearningReminder(
        String goalName,
        int remainingMinutes,
    ) async {
        const details = NotificationDetails(
            android: AndroidNotificationDetails(
                NotificationChannels.learningId,
                'Work Rhythm — Nauka',
                channelDescription: 'Przypomnienie o nauce',
                importance: Importance.defaultImportance,
                priority: Priority.defaultPriority,
            ),
        );

        await _plugin.show(
            _learningReminderId,
            '📚 Pamiętaj o nauce',
            'Cel "$goalName" — zostało ${remainingMinutes}min do celu tygodniowego',
            details,
        );
    }

    // -------------------------------------------------------------------------
    // Private helpers
    // -------------------------------------------------------------------------

    Future<void> _createChannels() async {
        final androidPlugin = _plugin
                .resolvePlatformSpecificImplementation<
                    AndroidFlutterLocalNotificationsPlugin>();

        if (androidPlugin == null) {
            return;
        }

        final channels = [
            const AndroidNotificationChannel(
                NotificationChannels.persistentTimerId,
                'Work Rhythm — Timer',
                description: 'Aktywny licznik czasu pracy',
                importance: Importance.min,
            ),
            const AndroidNotificationChannel(
                NotificationChannels.achievementId,
                'Work Rhythm — Osiągnięcia',
                description: 'Powiadomienie o osiągnięciu celu',
                importance: Importance.high,
            ),
            const AndroidNotificationChannel(
                NotificationChannels.overtimeId,
                'Work Rhythm — Nadgodziny',
                description: 'Ostrzeżenie o nadgodzinach',
                importance: Importance.defaultImportance,
            ),
            const AndroidNotificationChannel(
                NotificationChannels.activityId,
                'Work Rhythm — Aktywność',
                description: 'Przypomnienie o aktywności fizycznej',
                importance: Importance.defaultImportance,
            ),
            const AndroidNotificationChannel(
                NotificationChannels.learningId,
                'Work Rhythm — Nauka',
                description: 'Przypomnienie o nauce',
                importance: Importance.defaultImportance,
            ),
        ];

        for (final channel in channels) {
            await androidPlugin.createNotificationChannel(channel);
        }
    }
}
