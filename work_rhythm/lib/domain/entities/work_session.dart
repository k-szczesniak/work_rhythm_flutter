import 'package:freezed_annotation/freezed_annotation.dart';

part 'work_session.freezed.dart';

enum WorkSessionStatus { running, paused, stopped }

@freezed
class WorkSession with _$WorkSession {

    const factory WorkSession({
        required int id,
        required DateTime startTime,
        DateTime? endTime,
        required WorkSessionStatus status,
        required int grossSeconds,
        required int netSeconds,
    }) = _WorkSession;

    const WorkSession._();

    Duration get grossDuration => Duration(seconds: grossSeconds);

    Duration get netDuration => Duration(seconds: netSeconds);

    double progressToGoal(int targetHours) => netSeconds / (targetHours * 3600);
}
