// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'timer_viewmodel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TimerState {
  TimerMode get mode => throw _privateConstructorUsedError;
  int? get activeSessionId => throw _privateConstructorUsedError;
  int get grossSeconds => throw _privateConstructorUsedError;
  int get netSeconds => throw _privateConstructorUsedError;
  int get targetSeconds => throw _privateConstructorUsedError;
  bool get goalReached => throw _privateConstructorUsedError;
  bool get hasOvertime => throw _privateConstructorUsedError;
  int get overtimeSeconds => throw _privateConstructorUsedError;
  DateTime? get sessionStart => throw _privateConstructorUsedError;
  bool get openDistractionSheet => throw _privateConstructorUsedError;

  /// Create a copy of TimerState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TimerStateCopyWith<TimerState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimerStateCopyWith<$Res> {
  factory $TimerStateCopyWith(
          TimerState value, $Res Function(TimerState) then) =
      _$TimerStateCopyWithImpl<$Res, TimerState>;
  @useResult
  $Res call(
      {TimerMode mode,
      int? activeSessionId,
      int grossSeconds,
      int netSeconds,
      int targetSeconds,
      bool goalReached,
      bool hasOvertime,
      int overtimeSeconds,
      DateTime? sessionStart,
      bool openDistractionSheet});
}

/// @nodoc
class _$TimerStateCopyWithImpl<$Res, $Val extends TimerState>
    implements $TimerStateCopyWith<$Res> {
  _$TimerStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TimerState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mode = null,
    Object? activeSessionId = freezed,
    Object? grossSeconds = null,
    Object? netSeconds = null,
    Object? targetSeconds = null,
    Object? goalReached = null,
    Object? hasOvertime = null,
    Object? overtimeSeconds = null,
    Object? sessionStart = freezed,
    Object? openDistractionSheet = null,
  }) {
    return _then(_value.copyWith(
      mode: null == mode
          ? _value.mode
          : mode // ignore: cast_nullable_to_non_nullable
              as TimerMode,
      activeSessionId: freezed == activeSessionId
          ? _value.activeSessionId
          : activeSessionId // ignore: cast_nullable_to_non_nullable
              as int?,
      grossSeconds: null == grossSeconds
          ? _value.grossSeconds
          : grossSeconds // ignore: cast_nullable_to_non_nullable
              as int,
      netSeconds: null == netSeconds
          ? _value.netSeconds
          : netSeconds // ignore: cast_nullable_to_non_nullable
              as int,
      targetSeconds: null == targetSeconds
          ? _value.targetSeconds
          : targetSeconds // ignore: cast_nullable_to_non_nullable
              as int,
      goalReached: null == goalReached
          ? _value.goalReached
          : goalReached // ignore: cast_nullable_to_non_nullable
              as bool,
      hasOvertime: null == hasOvertime
          ? _value.hasOvertime
          : hasOvertime // ignore: cast_nullable_to_non_nullable
              as bool,
      overtimeSeconds: null == overtimeSeconds
          ? _value.overtimeSeconds
          : overtimeSeconds // ignore: cast_nullable_to_non_nullable
              as int,
      sessionStart: freezed == sessionStart
          ? _value.sessionStart
          : sessionStart // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      openDistractionSheet: null == openDistractionSheet
          ? _value.openDistractionSheet
          : openDistractionSheet // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TimerStateImplCopyWith<$Res>
    implements $TimerStateCopyWith<$Res> {
  factory _$$TimerStateImplCopyWith(
          _$TimerStateImpl value, $Res Function(_$TimerStateImpl) then) =
      __$$TimerStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {TimerMode mode,
      int? activeSessionId,
      int grossSeconds,
      int netSeconds,
      int targetSeconds,
      bool goalReached,
      bool hasOvertime,
      int overtimeSeconds,
      DateTime? sessionStart,
      bool openDistractionSheet});
}

/// @nodoc
class __$$TimerStateImplCopyWithImpl<$Res>
    extends _$TimerStateCopyWithImpl<$Res, _$TimerStateImpl>
    implements _$$TimerStateImplCopyWith<$Res> {
  __$$TimerStateImplCopyWithImpl(
      _$TimerStateImpl _value, $Res Function(_$TimerStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of TimerState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mode = null,
    Object? activeSessionId = freezed,
    Object? grossSeconds = null,
    Object? netSeconds = null,
    Object? targetSeconds = null,
    Object? goalReached = null,
    Object? hasOvertime = null,
    Object? overtimeSeconds = null,
    Object? sessionStart = freezed,
    Object? openDistractionSheet = null,
  }) {
    return _then(_$TimerStateImpl(
      mode: null == mode
          ? _value.mode
          : mode // ignore: cast_nullable_to_non_nullable
              as TimerMode,
      activeSessionId: freezed == activeSessionId
          ? _value.activeSessionId
          : activeSessionId // ignore: cast_nullable_to_non_nullable
              as int?,
      grossSeconds: null == grossSeconds
          ? _value.grossSeconds
          : grossSeconds // ignore: cast_nullable_to_non_nullable
              as int,
      netSeconds: null == netSeconds
          ? _value.netSeconds
          : netSeconds // ignore: cast_nullable_to_non_nullable
              as int,
      targetSeconds: null == targetSeconds
          ? _value.targetSeconds
          : targetSeconds // ignore: cast_nullable_to_non_nullable
              as int,
      goalReached: null == goalReached
          ? _value.goalReached
          : goalReached // ignore: cast_nullable_to_non_nullable
              as bool,
      hasOvertime: null == hasOvertime
          ? _value.hasOvertime
          : hasOvertime // ignore: cast_nullable_to_non_nullable
              as bool,
      overtimeSeconds: null == overtimeSeconds
          ? _value.overtimeSeconds
          : overtimeSeconds // ignore: cast_nullable_to_non_nullable
              as int,
      sessionStart: freezed == sessionStart
          ? _value.sessionStart
          : sessionStart // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      openDistractionSheet: null == openDistractionSheet
          ? _value.openDistractionSheet
          : openDistractionSheet // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$TimerStateImpl extends _TimerState {
  const _$TimerStateImpl(
      {this.mode = TimerMode.idle,
      this.activeSessionId,
      this.grossSeconds = 0,
      this.netSeconds = 0,
      this.targetSeconds = 28800,
      this.goalReached = false,
      this.hasOvertime = false,
      this.overtimeSeconds = 0,
      this.sessionStart,
      this.openDistractionSheet = false})
      : super._();

  @override
  @JsonKey()
  final TimerMode mode;
  @override
  final int? activeSessionId;
  @override
  @JsonKey()
  final int grossSeconds;
  @override
  @JsonKey()
  final int netSeconds;
  @override
  @JsonKey()
  final int targetSeconds;
  @override
  @JsonKey()
  final bool goalReached;
  @override
  @JsonKey()
  final bool hasOvertime;
  @override
  @JsonKey()
  final int overtimeSeconds;
  @override
  final DateTime? sessionStart;
  @override
  @JsonKey()
  final bool openDistractionSheet;

  @override
  String toString() {
    return 'TimerState(mode: $mode, activeSessionId: $activeSessionId, grossSeconds: $grossSeconds, netSeconds: $netSeconds, targetSeconds: $targetSeconds, goalReached: $goalReached, hasOvertime: $hasOvertime, overtimeSeconds: $overtimeSeconds, sessionStart: $sessionStart, openDistractionSheet: $openDistractionSheet)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TimerStateImpl &&
            (identical(other.mode, mode) || other.mode == mode) &&
            (identical(other.activeSessionId, activeSessionId) ||
                other.activeSessionId == activeSessionId) &&
            (identical(other.grossSeconds, grossSeconds) ||
                other.grossSeconds == grossSeconds) &&
            (identical(other.netSeconds, netSeconds) ||
                other.netSeconds == netSeconds) &&
            (identical(other.targetSeconds, targetSeconds) ||
                other.targetSeconds == targetSeconds) &&
            (identical(other.goalReached, goalReached) ||
                other.goalReached == goalReached) &&
            (identical(other.hasOvertime, hasOvertime) ||
                other.hasOvertime == hasOvertime) &&
            (identical(other.overtimeSeconds, overtimeSeconds) ||
                other.overtimeSeconds == overtimeSeconds) &&
            (identical(other.sessionStart, sessionStart) ||
                other.sessionStart == sessionStart) &&
            (identical(other.openDistractionSheet, openDistractionSheet) ||
                other.openDistractionSheet == openDistractionSheet));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      mode,
      activeSessionId,
      grossSeconds,
      netSeconds,
      targetSeconds,
      goalReached,
      hasOvertime,
      overtimeSeconds,
      sessionStart,
      openDistractionSheet);

  /// Create a copy of TimerState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TimerStateImplCopyWith<_$TimerStateImpl> get copyWith =>
      __$$TimerStateImplCopyWithImpl<_$TimerStateImpl>(this, _$identity);
}

abstract class _TimerState extends TimerState {
  const factory _TimerState(
      {final TimerMode mode,
      final int? activeSessionId,
      final int grossSeconds,
      final int netSeconds,
      final int targetSeconds,
      final bool goalReached,
      final bool hasOvertime,
      final int overtimeSeconds,
      final DateTime? sessionStart,
      final bool openDistractionSheet}) = _$TimerStateImpl;
  const _TimerState._() : super._();

  @override
  TimerMode get mode;
  @override
  int? get activeSessionId;
  @override
  int get grossSeconds;
  @override
  int get netSeconds;
  @override
  int get targetSeconds;
  @override
  bool get goalReached;
  @override
  bool get hasOvertime;
  @override
  int get overtimeSeconds;
  @override
  DateTime? get sessionStart;
  @override
  bool get openDistractionSheet;

  /// Create a copy of TimerState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TimerStateImplCopyWith<_$TimerStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
