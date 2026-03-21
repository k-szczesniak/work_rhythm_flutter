import 'package:freezed_annotation/freezed_annotation.dart';

part 'distraction_model.freezed.dart';
part 'distraction_model.g.dart';

@freezed
class DistractionModel with _$DistractionModel {

    const factory DistractionModel({
        required int id,
        required int sessionId,
        required String category,
        required int durationSeconds,
        required DateTime timestamp,
    }) = _DistractionModel;

    factory DistractionModel.fromJson(Map<String, dynamic> json) =>
            _$DistractionModelFromJson(json);
}
