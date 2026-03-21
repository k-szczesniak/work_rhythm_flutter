import 'package:freezed_annotation/freezed_annotation.dart';

part 'learning_model.freezed.dart';
part 'learning_model.g.dart';

@freezed
class LearningGoalModel with _$LearningGoalModel {

    const factory LearningGoalModel({
        required int id,
        required String name,
        required int targetMinutes,
        DateTime? deadline,
        String? description,
        required DateTime createdAt,
        required bool isActive,
    }) = _LearningGoalModel;

    factory LearningGoalModel.fromJson(Map<String, dynamic> json) =>
            _$LearningGoalModelFromJson(json);
}

@freezed
class LearningSessionModel with _$LearningSessionModel {

    const factory LearningSessionModel({
        required int id,
        required int goalId,
        required DateTime startTime,
        DateTime? endTime,
        required int durationSeconds,
        required String status,
    }) = _LearningSessionModel;

    factory LearningSessionModel.fromJson(Map<String, dynamic> json) =>
            _$LearningSessionModelFromJson(json);
}
