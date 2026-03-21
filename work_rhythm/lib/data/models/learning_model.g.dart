// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'learning_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LearningGoalModelImpl _$$LearningGoalModelImplFromJson(
        Map<String, dynamic> json) =>
    _$LearningGoalModelImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      targetMinutes: (json['targetMinutes'] as num).toInt(),
      deadline: json['deadline'] == null
          ? null
          : DateTime.parse(json['deadline'] as String),
      description: json['description'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
      isActive: json['isActive'] as bool,
    );

Map<String, dynamic> _$$LearningGoalModelImplToJson(
        _$LearningGoalModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'targetMinutes': instance.targetMinutes,
      'deadline': instance.deadline?.toIso8601String(),
      'description': instance.description,
      'createdAt': instance.createdAt.toIso8601String(),
      'isActive': instance.isActive,
    };

_$LearningSessionModelImpl _$$LearningSessionModelImplFromJson(
        Map<String, dynamic> json) =>
    _$LearningSessionModelImpl(
      id: (json['id'] as num).toInt(),
      goalId: (json['goalId'] as num).toInt(),
      startTime: DateTime.parse(json['startTime'] as String),
      endTime: json['endTime'] == null
          ? null
          : DateTime.parse(json['endTime'] as String),
      durationSeconds: (json['durationSeconds'] as num).toInt(),
      status: json['status'] as String,
    );

Map<String, dynamic> _$$LearningSessionModelImplToJson(
        _$LearningSessionModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'goalId': instance.goalId,
      'startTime': instance.startTime.toIso8601String(),
      'endTime': instance.endTime?.toIso8601String(),
      'durationSeconds': instance.durationSeconds,
      'status': instance.status,
    };
