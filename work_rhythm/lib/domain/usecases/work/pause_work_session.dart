import '../../entities/work_session.dart';
import '../../repositories/i_work_session_repository.dart';

class PauseWorkSession {

    PauseWorkSession(this._repository);

    final IWorkSessionRepository _repository;

    Future<WorkSession> call(int sessionId) async {
        final session = await _repository.getActiveSession();
        if (session == null || session.id != sessionId) {
            throw StateError('No active session found with id $sessionId');
        }
        if (session.status != WorkSessionStatus.running) {
            throw StateError('Session $sessionId is not running');
        }
        return _repository.pauseSession(sessionId);
    }
}
