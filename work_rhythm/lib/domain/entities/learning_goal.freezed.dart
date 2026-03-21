// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'learning_goal.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LearningGoal {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int get targetMinutes => throw _privateConstructorUsedError;
  DateTime? get deadline => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  bool get isActive => throw _privateConstructorUsedError;
  int get completedMinutes => throw _privateConstructorUsedError;

  /// Create a copy of LearningGoal
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LearningGoalCopyWith<LearningGoal> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LearningGoalCopyWith<$Res> {
  factory $LearningGoalCopyWith(
          LearningGoal value, $Res Function(LearningGoal) then) =
      _$LearningGoalCopyWithImpl<$Res, LearningGoal>;
  @useResult
  $Res call(
      {int id,
      String name,
      int targetMinutes,
      DateTime? deadline,
      String? description,
      DateTime createdAt,
      bool isActive,
      int completedMinutes});
}

/// @nodoc
class _$LearningGoalCopyWithImpl<$Res, $Val extends LearningGoal>
    implements $LearningGoalCopyWith<$Res> {
  _$LearningGoalCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LearningGoal
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
    Object? completedMinutes = null,
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
      completedMinutes: null == completedMinutes
          ? _value.completedMinutes
          : completedMinutes // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LearningGoalImplCopyWith<$Res>
    implements $LearningGoalCopyWith<$Res> {
  factory _$$LearningGoalImplCopyWith(
          _$LearningGoalImpl value, $Res Function(_$LearningGoalImpl) then) =
      __$$LearningGoalImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      int targetMinutes,
      DateTime? deadline,
      String? description,
      DateTime createdAt,
      bool isActive,
      int completedMinutes});
}

/// @nodoc
class __$$LearningGoalImplCopyWithImpl<$Res>
    extends _$LearningGoalCopyWithImpl<$Res, _$LearningGoalImpl>
    implements _$$LearningGoalImplCopyWith<$Res> {
  __$$LearningGoalImplCopyWithImpl(
      _$LearningGoalImpl _value, $Res Function(_$LearningGoalImpl) _then)
      : super(_value, _then);

  /// Create a copy of LearningGoal
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
    Object? completedMinutes = null,
  }) {
    return _then(_$LearningGoalImpl(
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
      completedMinutes: null == completedMinutes
          ? _value.completedMinutes
          : completedMinutes // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$LearningGoalImpl extends _LearningGoal {
  const _$LearningGoalImpl(
      {required this.id,
      required this.name,
      required this.targetMinutes,
      this.deadline,
      this.description,
      required this.createdAt,
      required this.isActive,
      this.completedMinutes = 0})
      : super._();

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
  @JsonKey()
  final int completedMinutes;

  @override
  String toString() {
    return 'LearningGoal(id: $id, name: $name, targetMinutes: $targetMinutes, deadline: $deadline, description: $description, createdAt: $createdAt, isActive: $isActive, completedMinutes: $completedMinutes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LearningGoalImpl &&
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
                other.isActive == isActive) &&
            (identical(other.completedMinutes, completedMinutes) ||
                other.completedMinutes == completedMinutes));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, name, targetMinutes,
      deadline, description, createdAt, isActive, completedMinutes);

  /// Create a copy of LearningGoal
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LearningGoalImplCopyWith<_$LearningGoalImpl> get copyWith =>
      __$$LearningGoalImplCopyWithImpl<_$LearningGoalImpl>(this, _$identity);
}

abstract class _LearningGoal extends LearningGoal {
  const factory _LearningGoal(
      {required final int id,
      required final String name,
      required final int targetMinutes,
      final DateTime? deadline,
      final String? description,
      required final DateTime createdAt,
      required final bool isActive,
      final int completedMinutes}) = _$LearningGoalImpl;
  const _LearningGoal._() : super._();

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
  @override
  int get completedMinutes;

  /// Create a copy of LearningGoal
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LearningGoalImplCopyWith<_$LearningGoalImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
