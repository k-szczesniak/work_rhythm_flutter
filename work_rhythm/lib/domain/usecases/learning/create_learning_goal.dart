import '../../entities/learning_goal.dart';
import '../../repositories/i_learning_repository.dart';

class CreateLearningGoal {

    CreateLearningGoal(this._repository);

    final ILearningRepository _repository;

    Future<LearningGoal> call({
        required String name,
        required int targetMinutes,
        DateTime? deadline,
        String? description,
    }) {
        if (name.trim().isEmpty) {
            throw ArgumentError('Goal name cannot be empty');
        }
        if (targetMinutes <= 0) {
            throw ArgumentError('Target minutes must be positive');
        }
        return _repository.createGoal(
            name: name.trim(),
            targetMinutes: targetMinutes,
            deadline: deadline,
            description: description,
        );
    }
}
