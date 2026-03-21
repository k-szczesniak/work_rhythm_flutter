// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'learning_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LearningGoalModel _$LearningGoalModelFromJson(Map<String, dynamic> json) {
  return _LearningGoalModel.fromJson(json);
}

/// @nodoc
mixin _$LearningGoalModel {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int get targetMinutes => throw _privateConstructorUsedError;
  DateTime? get deadline => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  bool get isActive => throw _privateConstructorUsedError;

  /// Serializes this LearningGoalModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LearningGoalModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LearningGoalModelCopyWith<LearningGoalModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LearningGoalModelCopyWith<$Res> {
  factory $LearningGoalModelCopyWith(
          LearningGoalModel value, $Res Function(LearningGoalModel) then) =
      _$LearningGoalModelCopyWithImpl<$Res, LearningGoalModel>;
  @useResult
  $Res call(
      {int id,
      String name,
      int targetMinutes,
      DateTime? deadline,
      String? description,
      DateTime createdAt,
      bool isActive});
}

/// @nodoc
class _$LearningGoalModelCopyWithImpl<$Res, $Val extends LearningGoalModel>
    implements $LearningGoalModelCopyWith<$Res> {
  _$LearningGoalModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LearningGoalModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? targetMinutes = null,
    Object? deadline = freezed,
    Object? description = freezed,
    Object? createdAt = null,
    Object? isActive = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      targetMinutes: null == targetMinutes
          ? _value.targetMinutes
          : targetMinutes // ignore: cast_nullable_to_non_nullable
              as int,
      deadline: freezed == deadline
          ? _value.deadline
          : deadline // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LearningGoalModelImplCopyWith<$Res>
    implements $LearningGoalModelCopyWith<$Res> {
  factory _$$LearningGoalModelImplCopyWith(_$LearningGoalModelImpl value,
          $Res Function(_$LearningGoalModelImpl) then) =
      __$$LearningGoalModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      int targetMinutes,
      DateTime? deadline,
      String? description,
      DateTime createdAt,
      bool isActive});
}

/// @nodoc
class __$$LearningGoalModelImplCopyWithImpl<$Res>
    extends _$LearningGoalModelCopyWithImpl<$Res, _$LearningGoalModelImpl>
    implements _$$LearningGoalModelImplCopyWith<$Res> {
  __$$LearningGoalModelImplCopyWithImpl(_$LearningGoalModelImpl _value,
      $Res Function(_$LearningGoalModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of LearningGoalModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? targetMinutes = null,
    Object? deadline = freezed,
    Object? description = freezed,
    Object? createdAt = null,
    Object? isActive = null,
  }) {
    return _then(_$LearningGoalModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      targetMinutes: null == targetMinutes
          ? _value.targetMinutes
          : targetMinutes // ignore: cast_nullable_to_non_nullable
              as int,
      deadline: freezed == deadline
          ? _value.deadline
          : deadline // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LearningGoalModelImpl implements _LearningGoalModel {
  const _$LearningGoalModelImpl(
      {required this.id,
      required this.name,
      required this.targetMinutes,
      this.deadline,
      this.description,
      required this.createdAt,
      required this.isActive});

  factory _$LearningGoalModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$LearningGoalModelImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final int targetMinutes;
  @override
  final DateTime? deadline;
  @override
  final String? description;
  @override
  final DateTime createdAt;
  @override
  final bool isActive;

  @override
  String toString() {
    return 'LearningGoalModel(id: $id, name: $name, targetMinutes: $targetMinutes, deadline: $deadline, description: $description, createdAt: $createdAt, isActive: $isActive)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LearningGoalModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.targetMinutes, targetMinutes) ||
                other.targetMinutes == targetMinutes) &&
            (identical(other.deadline, deadline) ||
                other.deadline == deadline) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, targetMinutes,
      deadline, description, createdAt, isActive);

  /// Create a copy of LearningGoalModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LearningGoalModelImplCopyWith<_$LearningGoalModelImpl> get copyWith =>
      __$$LearningGoalModelImplCopyWithImpl<_$LearningGoalModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LearningGoalModelImplToJson(
      this,
    );
  }
}

abstract class _LearningGoalModel implements LearningGoalModel {
  const factory _LearningGoalModel(
      {required final int id,
      required final String name,
      required final int targetMinutes,
      final DateTime? deadline,
      final String? description,
      required final DateTime createdAt,
      required final bool isActive}) = _$LearningGoalModelImpl;

  factory _LearningGoalModel.fromJson(Map<String, dynamic> json) =
      _$LearningGoalModelImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  int get targetMinutes;
  @override
  DateTime? get deadline;
  @override
  String? get description;
  @override
  DateTime get createdAt;
  @override
  bool get isActive;

  /// Create a copy of LearningGoalModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LearningGoalModelImplCopyWith<_$LearningGoalModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LearningSessionModel _$LearningSessionModelFromJson(Map<String, dynamic> json) {
  return _LearningSessionModel.fromJson(json);
}

/// @nodoc
mixin _$LearningSessionModel {
  int get id => throw _privateConstructorUsedError;
  int get goalId => throw _privateConstructorUsedError;
  DateTime get startTime => throw _privateConstructorUsedError;
  DateTime? get endTime => throw _privateConstructorUsedError;
  int get durationSeconds => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;

  /// Serializes this LearningSessionModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LearningSessionModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LearningSessionModelCopyWith<LearningSessionModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LearningSessionModelCopyWith<$Res> {
  factory $LearningSessionModelCopyWith(LearningSessionModel value,
          $Res Function(LearningSessionModel) then) =
      _$LearningSessionModelCopyWithImpl<$Res, LearningSessionModel>;
  @useResult
  $Res call(
      {int id,
      int goalId,
      DateTime startTime,
      DateTime? endTime,
      int durationSeconds,
      String status});
}

/// @nodoc
class _$LearningSessionModelCopyWithImpl<$Res,
        $Val extends LearningSessionModel>
    implements $LearningSessionModelCopyWith<$Res> {
  _$LearningSessionModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LearningSessionModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? goalId = null,
    Object? startTime = null,
    Object? endTime = freezed,
    Object? durationSeconds = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      goalId: null == goalId
          ? _value.goalId
          : goalId // ignore: cast_nullable_to_non_nullable
              as int,
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endTime: freezed == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      durationSeconds: null == durationSeconds
          ? _value.durationSeconds
          : durationSeconds // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LearningSessionModelImplCopyWith<$Res>
    implements $LearningSessionModelCopyWith<$Res> {
  factory _$$LearningSessionModelImplCopyWith(_$LearningSessionModelImpl value,
          $Res Function(_$LearningSessionModelImpl) then) =
      __$$LearningSessionModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      int goalId,
      DateTime startTime,
      DateTime? endTime,
      int durationSeconds,
      String status});
}

/// @nodoc
class __$$LearningSessionModelImplCopyWithImpl<$Res>
    extends _$LearningSessionModelCopyWithImpl<$Res, _$LearningSessionModelImpl>
    implements _$$LearningSessionModelImplCopyWith<$Res> {
  __$$LearningSessionModelImplCopyWithImpl(_$LearningSessionModelImpl _value,
      $Res Function(_$LearningSessionModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of LearningSessionModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? goalId = null,
    Object? startTime = null,
    Object? endTime = freezed,
    Object? durationSeconds = null,
    Object? status = null,
  }) {
    return _then(_$LearningSessionModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      goalId: null == goalId
          ? _value.goalId
          : goalId // ignore: cast_nullable_to_non_nullable
              as int,
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endTime: freezed == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      durationSeconds: null == durationSeconds
          ? _value.durationSeconds
          : durationSeconds // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LearningSessionModelImpl implements _LearningSessionModel {
  const _$LearningSessionModelImpl(
      {required this.id,
      required this.goalId,
      required this.startTime,
      this.endTime,
      required this.durationSeconds,
      required this.status});

  factory _$LearningSessionModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$LearningSessionModelImplFromJson(json);

  @override
  final int id;
  @override
  final int goalId;
  @override
  final DateTime startTime;
  @override
  final DateTime? endTime;
  @override
  final int durationSeconds;
  @override
  final String status;

  @override
  String toString() {
    return 'LearningSessionModel(id: $id, goalId: $goalId, startTime: $startTime, endTime: $endTime, durationSeconds: $durationSeconds, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LearningSessionModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.goalId, goalId) || other.goalId == goalId) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            (identical(other.durationSeconds, durationSeconds) ||
                other.durationSeconds == durationSeconds) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, goalId, startTime, endTime, durationSeconds, status);

  /// Create a copy of LearningSessionModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LearningSessionModelImplCopyWith<_$LearningSessionModelImpl>
      get copyWith =>
          __$$LearningSessionModelImplCopyWithImpl<_$LearningSessionModelImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LearningSessionModelImplToJson(
      this,
    );
  }
}

abstract class _LearningSessionModel implements LearningSessionModel {
  const factory _LearningSessionModel(
      {required final int id,
      required final int goalId,
      required final DateTime startTime,
      final DateTime? endTime,
      required final int durationSeconds,
      required final String status}) = _$LearningSessionModelImpl;

  factory _LearningSessionModel.fromJson(Map<String, dynamic> json) =
      _$LearningSessionModelImpl.fromJson;

  @override
  int get id;
  @override
  int get goalId;
  @override
  DateTime get startTime;
  @override
  DateTime? get endTime;
  @override
  int get durationSeconds;
  @override
  String get status;

  /// Create a copy of LearningSessionModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LearningSessionModelImplCopyWith<_$LearningSessionModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
