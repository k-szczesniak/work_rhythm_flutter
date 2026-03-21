import 'package:freezed_annotation/freezed_annotation.dart';

part 'work_session_model.freezed.dart';
part 'work_session_model.g.dart';

@freezed
class WorkSessionModel with _$WorkSessionModel {

    const factory WorkSessionModel({
        required int id,
        required DateTime startTime,
        DateTime? endTime,
        required String status,
        required int grossSeconds,
        required int netSeconds,
    }) = _WorkSessionModel;

    factory WorkSessionModel.fromJson(Map<String, dynamic> json) =>
            _$WorkSessionModelFromJson(json);
}
