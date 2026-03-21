import 'package:freezed_annotation/freezed_annotation.dart';

part 'learning_session.freezed.dart';

enum LearningSessionStatus { running, stopped }

@freezed
class LearningSession with _$LearningSession {

    const factory LearningSession({
        required int id,
        required int goalId,
        required DateTime startTime,
        DateTime? endTime,
        required int durationSeconds,
        required LearningSessionStatus status,
    }) = _LearningSession;

    const LearningSession._();

    Duration get duration => Duration(seconds: durationSeconds);
}
