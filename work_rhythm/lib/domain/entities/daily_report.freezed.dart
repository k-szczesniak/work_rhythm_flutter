// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'daily_report.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TimelineBlock {
  DateTime get startTime => throw _privateConstructorUsedError;
  DateTime get endTime => throw _privateConstructorUsedError;
  TimelineBlockType get type => throw _privateConstructorUsedError;
  String? get category => throw _privateConstructorUsedError;

  /// Create a copy of TimelineBlock
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TimelineBlockCopyWith<TimelineBlock> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimelineBlockCopyWith<$Res> {
  factory $TimelineBlockCopyWith(
          TimelineBlock value, $Res Function(TimelineBlock) then) =
      _$TimelineBlockCopyWithImpl<$Res, TimelineBlock>;
  @useResult
  $Res call(
      {DateTime startTime,
      DateTime endTime,
      TimelineBlockType type,
      String? category});
}

/// @nodoc
class _$TimelineBlockCopyWithImpl<$Res, $Val extends TimelineBlock>
    implements $TimelineBlockCopyWith<$Res> {
  _$TimelineBlockCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TimelineBlock
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startTime = null,
    Object? endTime = null,
    Object? type = null,
    Object? category = freezed,
  }) {
    return _then(_value.copyWith(
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endTime: null == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as TimelineBlockType,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TimelineBlockImplCopyWith<$Res>
    implements $TimelineBlockCopyWith<$Res> {
  factory _$$TimelineBlockImplCopyWith(
          _$TimelineBlockImpl value, $Res Function(_$TimelineBlockImpl) then) =
      __$$TimelineBlockImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateTime startTime,
      DateTime endTime,
      TimelineBlockType type,
      String? category});
}

/// @nodoc
class __$$TimelineBlockImplCopyWithImpl<$Res>
    extends _$TimelineBlockCopyWithImpl<$Res, _$TimelineBlockImpl>
    implements _$$TimelineBlockImplCopyWith<$Res> {
  __$$TimelineBlockImplCopyWithImpl(
      _$TimelineBlockImpl _value, $Res Function(_$TimelineBlockImpl) _then)
      : super(_value, _then);

  /// Create a copy of TimelineBlock
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startTime = null,
    Object? endTime = null,
    Object? type = null,
    Object? category = freezed,
  }) {
    return _then(_$TimelineBlockImpl(
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endTime: null == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as TimelineBlockType,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$TimelineBlockImpl implements _TimelineBlock {
  const _$TimelineBlockImpl(
      {required this.startTime,
      required this.endTime,
      required this.type,
      this.category});

  @override
  final DateTime startTime;
  @override
  final DateTime endTime;
  @override
  final TimelineBlockType type;
  @override
  final String? category;

  @override
  String toString() {
    return 'TimelineBlock(startTime: $startTime, endTime: $endTime, type: $type, category: $category)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TimelineBlockImpl &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.category, category) ||
                other.category == category));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, startTime, endTime, type, category);

  /// Create a copy of TimelineBlock
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TimelineBlockImplCopyWith<_$TimelineBlockImpl> get copyWith =>
      __$$TimelineBlockImplCopyWithImpl<_$TimelineBlockImpl>(this, _$identity);
}

abstract class _TimelineBlock implements TimelineBlock {
  const factory _TimelineBlock(
      {required final DateTime startTime,
      required final DateTime endTime,
      required final TimelineBlockType type,
      final String? category}) = _$TimelineBlockImpl;

  @override
  DateTime get startTime;
  @override
  DateTime get endTime;
  @override
  TimelineBlockType get type;
  @override
  String? get category;

  /// Create a copy of TimelineBlock
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TimelineBlockImplCopyWith<_$TimelineBlockImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DailyReport {
  DateTime get date => throw _privateConstructorUsedError;
  List<TimelineBlock> get timeline => throw _privateConstructorUsedError;
  int get totalNetMinutes => throw _privateConstructorUsedError;
  int get totalGrossMinutes => throw _privateConstructorUsedError;
  Map<String, int> get distractionsByCategory =>
      throw _privateConstructorUsedError;
  int get learningMinutes => throw _privateConstructorUsedError;

  /// Create a copy of DailyReport
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DailyReportCopyWith<DailyReport> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DailyReportCopyWith<$Res> {
  factory $DailyReportCopyWith(
          DailyReport value, $Res Function(DailyReport) then) =
      _$DailyReportCopyWithImpl<$Res, DailyReport>;
  @useResult
  $Res call(
      {DateTime date,
      List<TimelineBlock> timeline,
      int totalNetMinutes,
      int totalGrossMinutes,
      Map<String, int> distractionsByCategory,
      int learningMinutes});
}

/// @nodoc
class _$DailyReportCopyWithImpl<$Res, $Val extends DailyReport>
    implements $DailyReportCopyWith<$Res> {
  _$DailyReportCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DailyReport
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? timeline = null,
    Object? totalNetMinutes = null,
    Object? totalGrossMinutes = null,
    Object? distractionsByCategory = null,
    Object? learningMinutes = null,
  }) {
    return _then(_value.copyWith(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      timeline: null == timeline
          ? _value.timeline
          : timeline // ignore: cast_nullable_to_non_nullable
              as List<TimelineBlock>,
      totalNetMinutes: null == totalNetMinutes
          ? _value.totalNetMinutes
          : totalNetMinutes // ignore: cast_nullable_to_non_nullable
              as int,
      totalGrossMinutes: null == totalGrossMinutes
          ? _value.totalGrossMinutes
          : totalGrossMinutes // ignore: cast_nullable_to_non_nullable
              as int,
      distractionsByCategory: null == distractionsByCategory
          ? _value.distractionsByCategory
          : distractionsByCategory // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
      learningMinutes: null == learningMinutes
          ? _value.learningMinutes
          : learningMinutes // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DailyReportImplCopyWith<$Res>
    implements $DailyReportCopyWith<$Res> {
  factory _$$DailyReportImplCopyWith(
          _$DailyReportImpl value, $Res Function(_$DailyReportImpl) then) =
      __$$DailyReportImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateTime date,
      List<TimelineBlock> timeline,
      int totalNetMinutes,
      int totalGrossMinutes,
      Map<String, int> distractionsByCategory,
      int learningMinutes});
}

/// @nodoc
class __$$DailyReportImplCopyWithImpl<$Res>
    extends _$DailyReportCopyWithImpl<$Res, _$DailyReportImpl>
    implements _$$DailyReportImplCopyWith<$Res> {
  __$$DailyReportImplCopyWithImpl(
      _$DailyReportImpl _value, $Res Function(_$DailyReportImpl) _then)
      : super(_value, _then);

  /// Create a copy of DailyReport
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? timeline = null,
    Object? totalNetMinutes = null,
    Object? totalGrossMinutes = null,
    Object? distractionsByCategory = null,
    Object? learningMinutes = null,
  }) {
    return _then(_$DailyReportImpl(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      timeline: null == timeline
          ? _value._timeline
          : timeline // ignore: cast_nullable_to_non_nullable
              as List<TimelineBlock>,
      totalNetMinutes: null == totalNetMinutes
          ? _value.totalNetMinutes
          : totalNetMinutes // ignore: cast_nullable_to_non_nullable
              as int,
      totalGrossMinutes: null == totalGrossMinutes
          ? _value.totalGrossMinutes
          : totalGrossMinutes // ignore: cast_nullable_to_non_nullable
              as int,
      distractionsByCategory: null == distractionsByCategory
          ? _value._distractionsByCategory
          : distractionsByCategory // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
      learningMinutes: null == learningMinutes
          ? _value.learningMinutes
          : learningMinutes // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$DailyReportImpl implements _DailyReport {
  const _$DailyReportImpl(
      {required this.date,
      required final List<TimelineBlock> timeline,
      required this.totalNetMinutes,
      required this.totalGrossMinutes,
      required final Map<String, int> distractionsByCategory,
      required this.learningMinutes})
      : _timeline = timeline,
        _distractionsByCategory = distractionsByCategory;

  @override
  final DateTime date;
  final List<TimelineBlock> _timeline;
  @override
  List<TimelineBlock> get timeline {
    if (_timeline is EqualUnmodifiableListView) return _timeline;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_timeline);
  }

  @override
  final int totalNetMinutes;
  @override
  final int totalGrossMinutes;
  final Map<String, int> _distractionsByCategory;
  @override
  Map<String, int> get distractionsByCategory {
    if (_distractionsByCategory is EqualUnmodifiableMapView)
      return _distractionsByCategory;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_distractionsByCategory);
  }

  @override
  final int learningMinutes;

  @override
  String toString() {
    return 'DailyReport(date: $date, timeline: $timeline, totalNetMinutes: $totalNetMinutes, totalGrossMinutes: $totalGrossMinutes, distractionsByCategory: $distractionsByCategory, learningMinutes: $learningMinutes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DailyReportImpl &&
            (identical(other.date, date) || other.date == date) &&
            const DeepCollectionEquality().equals(other._timeline, _timeline) &&
            (identical(other.totalNetMinutes, totalNetMinutes) ||
                other.totalNetMinutes == totalNetMinutes) &&
            (identical(other.totalGrossMinutes, totalGrossMinutes) ||
                other.totalGrossMinutes == totalGrossMinutes) &&
            const DeepCollectionEquality().equals(
                other._distractionsByCategory, _distractionsByCategory) &&
            (identical(other.learningMinutes, learningMinutes) ||
                other.learningMinutes == learningMinutes));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      date,
      const DeepCollectionEquality().hash(_timeline),
      totalNetMinutes,
      totalGrossMinutes,
      const DeepCollectionEquality().hash(_distractionsByCategory),
      learningMinutes);

  /// Create a copy of DailyReport
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DailyReportImplCopyWith<_$DailyReportImpl> get copyWith =>
      __$$DailyReportImplCopyWithImpl<_$DailyReportImpl>(this, _$identity);
}

abstract class _DailyReport implements DailyReport {
  const factory _DailyReport(
      {required final DateTime date,
      required final List<TimelineBlock> timeline,
      required final int totalNetMinutes,
      required final int totalGrossMinutes,
      required final Map<String, int> distractionsByCategory,
      required final int learningMinutes}) = _$DailyReportImpl;

  @override
  DateTime get date;
  @override
  List<TimelineBlock> get timeline;
  @override
  int get totalNetMinutes;
  @override
  int get totalGrossMinutes;
  @override
  Map<String, int> get distractionsByCategory;
  @override
  int get learningMinutes;

  /// Create a copy of DailyReport
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DailyReportImplCopyWith<_$DailyReportImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
