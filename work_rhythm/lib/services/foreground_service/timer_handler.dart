import 'package:flutter_foreground_task/flutter_foreground_task.dart';

// Top-level entry point registered with FlutterForegroundTask — must be top-level.
@pragma('vm:entry-point')
void startTimerHandler() {
    FlutterForegroundTask.setTaskHandler(TimerHandler());
}

class TimerHandler extends TaskHandler {

    int _sessionId = 0;

    int _targetSeconds = 28800;

    int _grossSeconds = 0;

    int _netSeconds = 0;

    bool _isPaused = false;

    bool _isStopped = false;

    String _status = 'running';

    @override
    Future<void> onStart(DateTime timestamp, TaskStarter starter) async {
        _sessionId = (await FlutterForegroundTask.getData<int>(key: 'session_id')) ?? 0;
        _targetSeconds = (await FlutterForegroundTask.getData<int>(key: 'target_seconds')) ?? 28800;
    }

    @override
    void onRepeatEvent(DateTime timestamp) {
        if (_isStopped || _isPaused) {
            return;
        }
        _grossSeconds++;
        _netSeconds++;
        _sendTickToUi();
        _updateNotification();
    }

    @override
    Future<void> onDestroy(DateTime timestamp) async {
        _sendTickToUi();
    }

    @override
    void onReceiveData(Object data) {
        if (data is! Map) {
            return;
        }
        final command = data['command'] as String?;
        switch (command) {
            case 'pause':
                _isPaused = true;
                _status = 'paused';
                _sendTickToUi();
                _updateNotification();
                break;
            case 'resume':
                _isPaused = false;
                _status = 'running';
                _sendTickToUi();
                _updateNotification();
                break;
            case 'stop':
                _isStopped = true;
                _status = 'stopped';
                _sendTickToUi();
                FlutterForegroundTask.stopService();
                break;
            case 'distraction':
                final duration = (data['duration_seconds'] as num?)?.toInt() ?? 0;
                _netSeconds = (_netSeconds - duration).clamp(0, _netSeconds);
                _sendTickToUi();
                _updateNotification();
                break;
        }
    }

    @override
    void onNotificationButtonPressed(String id) {
        switch (id) {
            case 'btn_pause':
                if (_isPaused) {
                    onReceiveData({'command': 'resume'});
                } else {
                    onReceiveData({'command': 'pause'});
                }
                break;
            case 'btn_distraction':
                // Signal UI to open distraction bottom sheet
                FlutterForegroundTask.sendDataToMain({
                    'type': 'open_distraction_sheet',
                    'session_id': _sessionId,
                });
                break;
        }
    }

    void _sendTickToUi() {
        final isGoalReached = _netSeconds >= _targetSeconds;
        final overtimeSeconds = isGoalReached ? _netSeconds - _targetSeconds : 0;
        FlutterForegroundTask.sendDataToMain({
            'type': 'tick',
            'status': _status,
            'session_id': _sessionId,
            'gross_seconds': _grossSeconds,
            'net_seconds': _netSeconds,
            'target_seconds': _targetSeconds,
            'goal_reached': isGoalReached,
            'has_overtime': isGoalReached,
            'overtime_seconds': overtimeSeconds,
        });
    }

    void _updateNotification() {
        final h = _netSeconds ~/ 3600;
        final m = (_netSeconds % 3600) ~/ 60;
        final s = _netSeconds % 60;
        final timeStr = '${h.toString().padLeft(2, '0')}:'
            '${m.toString().padLeft(2, '0')}:'
            '${s.toString().padLeft(2, '0')}';
        final statusLabel = _isPaused ? '⏸ ' : '';
        FlutterForegroundTask.updateService(
            notificationTitle: 'Work Rhythm',
            notificationText: '$statusLabel$timeStr netto',
        );
    }
}
