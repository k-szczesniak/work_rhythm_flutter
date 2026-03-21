// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'learning_viewmodel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LearningState {
  List<LearningGoal> get goals => throw _privateConstructorUsedError;
  LearningSession? get activeSession => throw _privateConstructorUsedError;
  LearningGoal? get activeGoal => throw _privateConstructorUsedError;
  int get currentSessionSeconds => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  /// Create a copy of LearningState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LearningStateCopyWith<LearningState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LearningStateCopyWith<$Res> {
  factory $LearningStateCopyWith(
          LearningState value, $Res Function(LearningState) then) =
      _$LearningStateCopyWithImpl<$Res, LearningState>;
  @useResult
  $Res call(
      {List<LearningGoal> goals,
      LearningSession? activeSession,
      LearningGoal? activeGoal,
      int currentSessionSeconds,
      bool isLoading,
      String? error});

  $LearningSessionCopyWith<$Res>? get activeSession;
  $LearningGoalCopyWith<$Res>? get activeGoal;
}

/// @nodoc
class _$LearningStateCopyWithImpl<$Res, $Val extends LearningState>
    implements $LearningStateCopyWith<$Res> {
  _$LearningStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LearningState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? goals = null,
    Object? activeSession = freezed,
    Object? activeGoal = freezed,
    Object? currentSessionSeconds = null,
    Object? isLoading = null,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      goals: null == goals
          ? _value.goals
          : goals // ignore: cast_nullable_to_non_nullable
              as List<LearningGoal>,
      activeSession: freezed == activeSession
          ? _value.activeSession
          : activeSession // ignore: cast_nullable_to_non_nullable
              as LearningSession?,
      activeGoal: freezed == activeGoal
          ? _value.activeGoal
          : activeGoal // ignore: cast_nullable_to_non_nullable
              as LearningGoal?,
      currentSessionSeconds: null == currentSessionSeconds
          ? _value.currentSessionSeconds
          : currentSessionSeconds // ignore: cast_nullable_to_non_nullable
              as int,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  /// Create a copy of LearningState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LearningSessionCopyWith<$Res>? get activeSession {
    if (_value.activeSession == null) {
      return null;
    }

    return $LearningSessionCopyWith<$Res>(_value.activeSession!, (value) {
      return _then(_value.copyWith(activeSession: value) as $Val);
    });
  }

  /// Create a copy of LearningState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LearningGoalCopyWith<$Res>? get activeGoal {
    if (_value.activeGoal == null) {
      return null;
    }

    return $LearningGoalCopyWith<$Res>(_value.activeGoal!, (value) {
      return _then(_value.copyWith(activeGoal: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$LearningStateImplCopyWith<$Res>
    implements $LearningStateCopyWith<$Res> {
  factory _$$LearningStateImplCopyWith(
          _$LearningStateImpl value, $Res Function(_$LearningStateImpl) then) =
      __$$LearningStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<LearningGoal> goals,
      LearningSession? activeSession,
      LearningGoal? activeGoal,
      int currentSessionSeconds,
      bool isLoading,
      String? error});

  @override
  $LearningSessionCopyWith<$Res>? get activeSession;
  @override
  $LearningGoalCopyWith<$Res>? get activeGoal;
}

/// @nodoc
class __$$LearningStateImplCopyWithImpl<$Res>
    extends _$LearningStateCopyWithImpl<$Res, _$LearningStateImpl>
    implements _$$LearningStateImplCopyWith<$Res> {
  __$$LearningStateImplCopyWithImpl(
      _$LearningStateImpl _value, $Res Function(_$LearningStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of LearningState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? goals = null,
    Object? activeSession = freezed,
    Object? activeGoal = freezed,
    Object? currentSessionSeconds = null,
    Object? isLoading = null,
    Object? error = freezed,
  }) {
    return _then(_$LearningStateImpl(
      goals: null == goals
          ? _value._goals
          : goals // ignore: cast_nullable_to_non_nullable
              as List<LearningGoal>,
      activeSession: freezed == activeSession
          ? _value.activeSession
          : activeSession // ignore: cast_nullable_to_non_nullable
              as LearningSession?,
      activeGoal: freezed == activeGoal
          ? _value.activeGoal
          : activeGoal // ignore: cast_nullable_to_non_nullable
              as LearningGoal?,
      currentSessionSeconds: null == currentSessionSeconds
          ? _value.currentSessionSeconds
          : currentSessionSeconds // ignore: cast_nullable_to_non_nullable
              as int,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$LearningStateImpl implements _LearningState {
  const _$LearningStateImpl(
      {final List<LearningGoal> goals = const [],
      this.activeSession,
      this.activeGoal,
      this.currentSessionSeconds = 0,
      this.isLoading = false,
      this.error})
      : _goals = goals;

  final List<LearningGoal> _goals;
  @override
  @JsonKey()
  List<LearningGoal> get goals {
    if (_goals is EqualUnmodifiableListView) return _goals;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_goals);
  }

  @override
  final LearningSession? activeSession;
  @override
  final LearningGoal? activeGoal;
  @override
  @JsonKey()
  final int currentSessionSeconds;
  @override
  @JsonKey()
  final bool isLoading;
  @override
  final String? error;

  @override
  String toString() {
    return 'LearningState(goals: $goals, activeSession: $activeSession, activeGoal: $activeGoal, currentSessionSeconds: $currentSessionSeconds, isLoading: $isLoading, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LearningStateImpl &&
            const DeepCollectionEquality().equals(other._goals, _goals) &&
            (identical(other.activeSession, activeSession) ||
                other.activeSession == activeSession) &&
            (identical(other.activeGoal, activeGoal) ||
                other.activeGoal == activeGoal) &&
            (identical(other.currentSessionSeconds, currentSessionSeconds) ||
                other.currentSessionSeconds == currentSessionSeconds) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_goals),
      activeSession,
      activeGoal,
      currentSessionSeconds,
      isLoading,
      error);

  /// Create a copy of LearningState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LearningStateImplCopyWith<_$LearningStateImpl> get copyWith =>
      __$$LearningStateImplCopyWithImpl<_$LearningStateImpl>(this, _$identity);
}

abstract class _LearningState implements LearningState {
  const factory _LearningState(
      {final List<LearningGoal> goals,
      final LearningSession? activeSession,
      final LearningGoal? activeGoal,
      final int currentSessionSeconds,
      final bool isLoading,
      final String? error}) = _$LearningStateImpl;

  @override
  List<LearningGoal> get goals;
  @override
  LearningSession? get activeSession;
  @override
  LearningGoal? get activeGoal;
  @override
  int get currentSessionSeconds;
  @override
  bool get isLoading;
  @override
  String? get error;

  /// Create a copy of LearningState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LearningStateImplCopyWith<_$LearningStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
