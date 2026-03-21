// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'distraction_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DistractionModelImpl _$$DistractionModelImplFromJson(
        Map<String, dynamic> json) =>
    _$DistractionModelImpl(
      id: (json['id'] as num).toInt(),
      sessionId: (json['sessionId'] as num).toInt(),
      category: json['category'] as String,
      durationSeconds: (json['durationSeconds'] as num).toInt(),
      timestamp: DateTime.parse(json['timestamp'] as String),
    );

Map<String, dynamic> _$$DistractionModelImplToJson(
        _$DistractionModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'sessionId': instance.sessionId,
      'category': instance.category,
      'durationSeconds': instance.durationSeconds,
      'timestamp': instance.timestamp.toIso8601String(),
    };
