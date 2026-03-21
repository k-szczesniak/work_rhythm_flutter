import 'package:freezed_annotation/freezed_annotation.dart';

part 'learning_goal.freezed.dart';

@freezed
class LearningGoal with _$LearningGoal {

    const factory LearningGoal({
        required int id,
        required String name,
        required int targetMinutes,
        DateTime? deadline,
        String? description,
        required DateTime createdAt,
        required bool isActive,
        @Default(0) int completedMinutes,
    }) = _LearningGoal;

    const LearningGoal._();

    double get progressPercent =>
            targetMinutes > 0 ? completedMinutes / targetMinutes : 0.0;

    Duration get remaining => Duration(
        minutes: (targetMinutes - completedMinutes).clamp(0, targetMinutes),
    );
}
