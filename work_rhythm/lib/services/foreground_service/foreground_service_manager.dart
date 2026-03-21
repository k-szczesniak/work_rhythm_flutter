import 'package:flutter_foreground_task/flutter_foreground_task.dart';

import 'timer_handler.dart';

class ForegroundServiceManager {

    ForegroundServiceManager._();

    static Future<void> init() async {
        FlutterForegroundTask.init(
            androidNotificationOptions: AndroidNotificationOptions(
                channelId: 'work_rhythm_persistent',
                channelName: 'Work Rhythm — Timer',
                channelDescription: 'Aktywny licznik czasu pracy',
                channelImportance: NotificationChannelImportance.MIN,
                priority: NotificationPriority.MIN,
            ),
            iosNotificationOptions: const IOSNotificationOptions(
                showNotification: true,
                playSound: false,
            ),
            foregroundTaskOptions: ForegroundTaskOptions(
                eventAction: ForegroundTaskEventAction.repeat(1000),
                autoRunOnBoot: true,
                allowWakeLock: true,
                allowWifiLock: true,
            ),
        );

        // Initialize the communication port so the UI can receive ticks.
        FlutterForegroundTask.initCommunicationPort();
    }

    static Future<ServiceRequestResult> startService({
        required int sessionId,
        required int targetSeconds,
    }) async {
        // Persist initial data so the TaskHandler can read them in onStart.
        await FlutterForegroundTask.saveData(key: 'session_id', value: sessionId);
        await FlutterForegroundTask.saveData(key: 'target_seconds', value: targetSeconds);

        if (await FlutterForegroundTask.isRunningService) {
            return FlutterForegroundTask.restartService();
        }

        return FlutterForegroundTask.startService(
            serviceId: 100,
            notificationTitle: 'Work Rhythm',
            notificationText: '00:00:00 netto',
            notificationButtons: [
                const NotificationButton(id: 'btn_pause', text: 'Pauza'),
                const NotificationButton(id: 'btn_distraction', text: 'Rozproszony'),
            ],
            callback: startTimerHandler,
        );
    }

    static Future<ServiceRequestResult> stopService() {
        return FlutterForegroundTask.stopService();
    }

    static void sendCommand(String command, [Map<String, dynamic> data = const {}]) {
        final payload = <String, dynamic>{'command': command, ...data};
        FlutterForegroundTask.sendDataToTask(payload);
    }

    static void pause() => sendCommand('pause');

    static void resume() => sendCommand('resume');

    static void stop() => sendCommand('stop');

    static void addDistraction(String category, int durationSeconds) {
        sendCommand('distraction', {
            'category': category,
            'duration_seconds': durationSeconds,
        });
    }

    static void addTaskDataCallback(DataCallback callback) {
        FlutterForegroundTask.addTaskDataCallback(callback);
    }

    static void removeTaskDataCallback(DataCallback callback) {
        FlutterForegroundTask.removeTaskDataCallback(callback);
    }
}
