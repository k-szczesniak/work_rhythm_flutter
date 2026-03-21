// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'work_session_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WorkSessionModelImpl _$$WorkSessionModelImplFromJson(
        Map<String, dynamic> json) =>
    _$WorkSessionModelImpl(
      id: (json['id'] as num).toInt(),
      startTime: DateTime.parse(json['startTime'] as String),
      endTime: json['endTime'] == null
          ? null
          : DateTime.parse(json['endTime'] as String),
      status: json['status'] as String,
      grossSeconds: (json['grossSeconds'] as num).toInt(),
      netSeconds: (json['netSeconds'] as num).toInt(),
    );

Map<String, dynamic> _$$WorkSessionModelImplToJson(
        _$WorkSessionModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'startTime': instance.startTime.toIso8601String(),
      'endTime': instance.endTime?.toIso8601String(),
      'status': instance.status,
      'grossSeconds': instance.grossSeconds,
      'netSeconds': instance.netSeconds,
    };
