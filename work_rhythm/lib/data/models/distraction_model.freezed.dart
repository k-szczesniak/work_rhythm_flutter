// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'distraction_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DistractionModel _$DistractionModelFromJson(Map<String, dynamic> json) {
  return _DistractionModel.fromJson(json);
}

/// @nodoc
mixin _$DistractionModel {
  int get id => throw _privateConstructorUsedError;
  int get sessionId => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  int get durationSeconds => throw _privateConstructorUsedError;
  DateTime get timestamp => throw _privateConstructorUsedError;

  /// Serializes this DistractionModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DistractionModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DistractionModelCopyWith<DistractionModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DistractionModelCopyWith<$Res> {
  factory $DistractionModelCopyWith(
          DistractionModel value, $Res Function(DistractionModel) then) =
      _$DistractionModelCopyWithImpl<$Res, DistractionModel>;
  @useResult
  $Res call(
      {int id,
      int sessionId,
      String category,
      int durationSeconds,
      DateTime timestamp});
}

/// @nodoc
class _$DistractionModelCopyWithImpl<$Res, $Val extends DistractionModel>
    implements $DistractionModelCopyWith<$Res> {
  _$DistractionModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DistractionModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? sessionId = null,
    Object? category = null,
    Object? durationSeconds = null,
    Object? timestamp = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      sessionId: null == sessionId
          ? _value.sessionId
          : sessionId // ignore: cast_nullable_to_non_nullable
              as int,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      durationSeconds: null == durationSeconds
          ? _value.durationSeconds
          : durationSeconds // ignore: cast_nullable_to_non_nullable
              as int,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DistractionModelImplCopyWith<$Res>
    implements $DistractionModelCopyWith<$Res> {
  factory _$$DistractionModelImplCopyWith(_$DistractionModelImpl value,
          $Res Function(_$DistractionModelImpl) then) =
      __$$DistractionModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      int sessionId,
      String category,
      int durationSeconds,
      DateTime timestamp});
}

/// @nodoc
class __$$DistractionModelImplCopyWithImpl<$Res>
    extends _$DistractionModelCopyWithImpl<$Res, _$DistractionModelImpl>
    implements _$$DistractionModelImplCopyWith<$Res> {
  __$$DistractionModelImplCopyWithImpl(_$DistractionModelImpl _value,
      $Res Function(_$DistractionModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of DistractionModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? sessionId = null,
    Object? category = null,
    Object? durationSeconds = null,
    Object? timestamp = null,
  }) {
    return _then(_$DistractionModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      sessionId: null == sessionId
          ? _value.sessionId
          : sessionId // ignore: cast_nullable_to_non_nullable
              as int,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      durationSeconds: null == durationSeconds
          ? _value.durationSeconds
          : durationSeconds // ignore: cast_nullable_to_non_nullable
              as int,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DistractionModelImpl implements _DistractionModel {
  const _$DistractionModelImpl(
      {required this.id,
      required this.sessionId,
      required this.category,
      required this.durationSeconds,
      required this.timestamp});

  factory _$DistractionModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DistractionModelImplFromJson(json);

  @override
  final int id;
  @override
  final int sessionId;
  @override
  final String category;
  @override
  final int durationSeconds;
  @override
  final DateTime timestamp;

  @override
  String toString() {
    return 'DistractionModel(id: $id, sessionId: $sessionId, category: $category, durationSeconds: $durationSeconds, timestamp: $timestamp)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DistractionModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.sessionId, sessionId) ||
                other.sessionId == sessionId) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.durationSeconds, durationSeconds) ||
                other.durationSeconds == durationSeconds) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, sessionId, category, durationSeconds, timestamp);

  /// Create a copy of DistractionModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DistractionModelImplCopyWith<_$DistractionModelImpl> get copyWith =>
      __$$DistractionModelImplCopyWithImpl<_$DistractionModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DistractionModelImplToJson(
      this,
    );
  }
}

abstract class _DistractionModel implements DistractionModel {
  const factory _DistractionModel(
      {required final int id,
      required final int sessionId,
      required final String category,
      required final int durationSeconds,
      required final DateTime timestamp}) = _$DistractionModelImpl;

  factory _DistractionModel.fromJson(Map<String, dynamic> json) =
      _$DistractionModelImpl.fromJson;

  @override
  int get id;
  @override
  int get sessionId;
  @override
  String get category;
  @override
  int get durationSeconds;
  @override
  DateTime get timestamp;

  /// Create a copy of DistractionModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DistractionModelImplCopyWith<_$DistractionModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
