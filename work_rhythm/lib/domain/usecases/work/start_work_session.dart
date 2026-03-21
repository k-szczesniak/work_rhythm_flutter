import '../../entities/work_session.dart';
import '../../repositories/i_work_session_repository.dart';

class StartWorkSession {

    StartWorkSession(this._repository);

    final IWorkSessionRepository _repository;

    Future<WorkSession> call() async {
        final active = await _repository.getActiveSession();
        if (active != null) {
            throw StateError('A work session is already active (id: ${active.id})');
        }
        return _repository.startSession();
    }
}
