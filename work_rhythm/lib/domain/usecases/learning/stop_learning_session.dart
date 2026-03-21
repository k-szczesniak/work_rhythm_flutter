import '../../entities/learning_session.dart';
import '../../repositories/i_learning_repository.dart';

class StopLearningSession {

    StopLearningSession(this._repository);

    final ILearningRepository _repository;

    Future<LearningSession> call(int sessionId) {
        return _repository.stopSession(sessionId);
    }
}
