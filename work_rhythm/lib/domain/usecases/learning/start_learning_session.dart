import '../../entities/learning_session.dart';
import '../../repositories/i_learning_repository.dart';
import '../../repositories/i_work_session_repository.dart';

class StartLearningSession {

    StartLearningSession(
        this._learningRepository,
        this._workSessionRepository,
    );

    final ILearningRepository _learningRepository;

    final IWorkSessionRepository _workSessionRepository;

    Future<LearningSession> call(int goalId) async {
        final activeLearn = await _learningRepository.getActiveSession();
        if (activeLearn != null) {
            throw StateError('A learning session is already active');
        }

        // Pause the work timer if it is running
        final activeWork = await _workSessionRepository.getActiveSession();
        if (activeWork != null) {
            await _workSessionRepository.pauseSession(activeWork.id);
        }

        return _learningRepository.startSession(goalId);
    }
}
