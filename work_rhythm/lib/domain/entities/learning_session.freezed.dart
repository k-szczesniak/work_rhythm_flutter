// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'learning_session.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LearningSession {
  int get id => throw _privateConstructorUsedError;
  int get goalId => throw _privateConstructorUsedError;
  DateTime get startTime => throw _privateConstructorUsedError;
  DateTime? get endTime => throw _privateConstructorUsedError;
  int get durationSeconds => throw _privateConstructorUsedError;
  LearningSessionStatus get status => throw _privateConstructorUsedError;

  /// Create a copy of LearningSession
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LearningSessionCopyWith<LearningSession> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LearningSessionCopyWith<$Res> {
  factory $LearningSessionCopyWith(
          LearningSession value, $Res Function(LearningSession) then) =
      _$LearningSessionCopyWithImpl<$Res, LearningSession>;
  @useResult
  $Res call(
      {int id,
      int goalId,
      DateTime startTime,
      DateTime? endTime,
      int durationSeconds,
      LearningSessionStatus status});
}

/// @nodoc
class _$LearningSessionCopyWithImpl<$Res, $Val extends LearningSession>
    implements $LearningSessionCopyWith<$Res> {
  _$LearningSessionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LearningSession
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
              as LearningSessionStatus,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LearningSessionImplCopyWith<$Res>
    implements $LearningSessionCopyWith<$Res> {
  factory _$$LearningSessionImplCopyWith(_$LearningSessionImpl value,
          $Res Function(_$LearningSessionImpl) then) =
      __$$LearningSessionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      int goalId,
      DateTime startTime,
      DateTime? endTime,
      int durationSeconds,
      LearningSessionStatus status});
}

/// @nodoc
class __$$LearningSessionImplCopyWithImpl<$Res>
    extends _$LearningSessionCopyWithImpl<$Res, _$LearningSessionImpl>
    implements _$$LearningSessionImplCopyWith<$Res> {
  __$$LearningSessionImplCopyWithImpl(
      _$LearningSessionImpl _value, $Res Function(_$LearningSessionImpl) _then)
      : super(_value, _then);

  /// Create a copy of LearningSession
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
    return _then(_$LearningSessionImpl(
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
              as LearningSessionStatus,
    ));
  }
}

/// @nodoc

class _$LearningSessionImpl extends _LearningSession {
  const _$LearningSessionImpl(
      {required this.id,
      required this.goalId,
      required this.startTime,
      this.endTime,
      required this.durationSeconds,
      required this.status})
      : super._();

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
  final LearningSessionStatus status;

  @override
  String toString() {
    return 'LearningSession(id: $id, goalId: $goalId, startTime: $startTime, endTime: $endTime, durationSeconds: $durationSeconds, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LearningSessionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.goalId, goalId) || other.goalId == goalId) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            (identical(other.durationSeconds, durationSeconds) ||
                other.durationSeconds == durationSeconds) &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, id, goalId, startTime, endTime, durationSeconds, status);

  /// Create a copy of LearningSession
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LearningSessionImplCopyWith<_$LearningSessionImpl> get copyWith =>
      __$$LearningSessionImplCopyWithImpl<_$LearningSessionImpl>(
          this, _$identity);
}

abstract class _LearningSession extends LearningSession {
  const factory _LearningSession(
      {required final int id,
      required final int goalId,
      required final DateTime startTime,
      final DateTime? endTime,
      required final int durationSeconds,
      required final LearningSessionStatus status}) = _$LearningSessionImpl;
  const _LearningSession._() : super._();

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
  LearningSessionStatus get status;

  /// Create a copy of LearningSession
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LearningSessionImplCopyWith<_$LearningSessionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
