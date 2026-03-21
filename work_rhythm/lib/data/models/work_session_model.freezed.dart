// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'work_session_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

WorkSessionModel _$WorkSessionModelFromJson(Map<String, dynamic> json) {
  return _WorkSessionModel.fromJson(json);
}

/// @nodoc
mixin _$WorkSessionModel {
  int get id => throw _privateConstructorUsedError;
  DateTime get startTime => throw _privateConstructorUsedError;
  DateTime? get endTime => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  int get grossSeconds => throw _privateConstructorUsedError;
  int get netSeconds => throw _privateConstructorUsedError;

  /// Serializes this WorkSessionModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WorkSessionModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WorkSessionModelCopyWith<WorkSessionModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkSessionModelCopyWith<$Res> {
  factory $WorkSessionModelCopyWith(
          WorkSessionModel value, $Res Function(WorkSessionModel) then) =
      _$WorkSessionModelCopyWithImpl<$Res, WorkSessionModel>;
  @useResult
  $Res call(
      {int id,
      DateTime startTime,
      DateTime? endTime,
      String status,
      int grossSeconds,
      int netSeconds});
}

/// @nodoc
class _$WorkSessionModelCopyWithImpl<$Res, $Val extends WorkSessionModel>
    implements $WorkSessionModelCopyWith<$Res> {
  _$WorkSessionModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WorkSessionModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? startTime = null,
    Object? endTime = freezed,
    Object? status = null,
    Object? grossSeconds = null,
    Object? netSeconds = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endTime: freezed == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      grossSeconds: null == grossSeconds
          ? _value.grossSeconds
          : grossSeconds // ignore: cast_nullable_to_non_nullable
              as int,
      netSeconds: null == netSeconds
          ? _value.netSeconds
          : netSeconds // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WorkSessionModelImplCopyWith<$Res>
    implements $WorkSessionModelCopyWith<$Res> {
  factory _$$WorkSessionModelImplCopyWith(_$WorkSessionModelImpl value,
          $Res Function(_$WorkSessionModelImpl) then) =
      __$$WorkSessionModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      DateTime startTime,
      DateTime? endTime,
      String status,
      int grossSeconds,
      int netSeconds});
}

/// @nodoc
class __$$WorkSessionModelImplCopyWithImpl<$Res>
    extends _$WorkSessionModelCopyWithImpl<$Res, _$WorkSessionModelImpl>
    implements _$$WorkSessionModelImplCopyWith<$Res> {
  __$$WorkSessionModelImplCopyWithImpl(_$WorkSessionModelImpl _value,
      $Res Function(_$WorkSessionModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of WorkSessionModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? startTime = null,
    Object? endTime = freezed,
    Object? status = null,
    Object? grossSeconds = null,
    Object? netSeconds = null,
  }) {
    return _then(_$WorkSessionModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endTime: freezed == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      grossSeconds: null == grossSeconds
          ? _value.grossSeconds
          : grossSeconds // ignore: cast_nullable_to_non_nullable
              as int,
      netSeconds: null == netSeconds
          ? _value.netSeconds
          : netSeconds // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WorkSessionModelImpl implements _WorkSessionModel {
  const _$WorkSessionModelImpl(
      {required this.id,
      required this.startTime,
      this.endTime,
      required this.status,
      required this.grossSeconds,
      required this.netSeconds});

  factory _$WorkSessionModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$WorkSessionModelImplFromJson(json);

  @override
  final int id;
  @override
  final DateTime startTime;
  @override
  final DateTime? endTime;
  @override
  final String status;
  @override
  final int grossSeconds;
  @override
  final int netSeconds;

  @override
  String toString() {
    return 'WorkSessionModel(id: $id, startTime: $startTime, endTime: $endTime, status: $status, grossSeconds: $grossSeconds, netSeconds: $netSeconds)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WorkSessionModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.grossSeconds, grossSeconds) ||
                other.grossSeconds == grossSeconds) &&
            (identical(other.netSeconds, netSeconds) ||
                other.netSeconds == netSeconds));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, startTime, endTime, status, grossSeconds, netSeconds);

  /// Create a copy of WorkSessionModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WorkSessionModelImplCopyWith<_$WorkSessionModelImpl> get copyWith =>
      __$$WorkSessionModelImplCopyWithImpl<_$WorkSessionModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WorkSessionModelImplToJson(
      this,
    );
  }
}

abstract class _WorkSessionModel implements WorkSessionModel {
  const factory _WorkSessionModel(
      {required final int id,
      required final DateTime startTime,
      final DateTime? endTime,
      required final String status,
      required final int grossSeconds,
      required final int netSeconds}) = _$WorkSessionModelImpl;

  factory _WorkSessionModel.fromJson(Map<String, dynamic> json) =
      _$WorkSessionModelImpl.fromJson;

  @override
  int get id;
  @override
  DateTime get startTime;
  @override
  DateTime? get endTime;
  @override
  String get status;
  @override
  int get grossSeconds;
  @override
  int get netSeconds;

  /// Create a copy of WorkSessionModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WorkSessionModelImplCopyWith<_$WorkSessionModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
