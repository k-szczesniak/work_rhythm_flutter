import '../../entities/work_session.dart';
import '../../repositories/i_work_session_repository.dart';

class StopWorkSession {

    StopWorkSession(this._repository);

    final IWorkSessionRepository _repository;

    Future<WorkSession> call(int sessionId) async {
        final sessions = await _repository.getSessionsForDate(DateTime.now());
        final session = sessions.where((s) => s.id == sessionId).firstOrNull;
        if (session == null) {
            throw StateError('Session $sessionId not found');
        }
        if (session.status == WorkSessionStatus.stopped) {
            throw StateError('Session $sessionId is already stopped');
        }
        return _repository.stopSession(sessionId);
    }
}
