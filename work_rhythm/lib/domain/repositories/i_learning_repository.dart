import '../entities/learning_goal.dart';
import '../entities/learning_session.dart';

abstract class ILearningRepository {

    Future<List<LearningGoal>> getActiveGoals();

    Future<LearningGoal> createGoal({
        required String name,
        required int targetMinutes,
        DateTime? deadline,
        String? description,
    });

    Future<LearningSession> startSession(int goalId);

    Future<LearningSession> stopSession(int sessionId);

    Future<LearningSession?> getActiveSession();

    Future<int> getCompletedMinutesForGoal(int goalId);
}
