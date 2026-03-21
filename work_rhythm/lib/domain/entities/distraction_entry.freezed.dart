// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'distraction_entry.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DistractionEntry {
  int get id => throw _privateConstructorUsedError;
  int get sessionId => throw _privateConstructorUsedError;
  DistractionCategory get category => throw _privateConstructorUsedError;
  int get durationSeconds => throw _privateConstructorUsedError;
  DateTime get timestamp => throw _privateConstructorUsedError;

  /// Create a copy of DistractionEntry
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DistractionEntryCopyWith<DistractionEntry> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DistractionEntryCopyWith<$Res> {
  factory $DistractionEntryCopyWith(
          DistractionEntry value, $Res Function(DistractionEntry) then) =
      _$DistractionEntryCopyWithImpl<$Res, DistractionEntry>;
  @useResult
  $Res call(
      {int id,
      int sessionId,
      DistractionCategory category,
      int durationSeconds,
      DateTime timestamp});
}

/// @nodoc
class _$DistractionEntryCopyWithImpl<$Res, $Val extends DistractionEntry>
    implements $DistractionEntryCopyWith<$Res> {
  _$DistractionEntryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DistractionEntry
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
              as DistractionCategory,
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
abstract class _$$DistractionEntryImplCopyWith<$Res>
    implements $DistractionEntryCopyWith<$Res> {
  factory _$$DistractionEntryImplCopyWith(_$DistractionEntryImpl value,
          $Res Function(_$DistractionEntryImpl) then) =
      __$$DistractionEntryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      int sessionId,
      DistractionCategory category,
      int durationSeconds,
      DateTime timestamp});
}

/// @nodoc
class __$$DistractionEntryImplCopyWithImpl<$Res>
    extends _$DistractionEntryCopyWithImpl<$Res, _$DistractionEntryImpl>
    implements _$$DistractionEntryImplCopyWith<$Res> {
  __$$DistractionEntryImplCopyWithImpl(_$DistractionEntryImpl _value,
      $Res Function(_$DistractionEntryImpl) _then)
      : super(_value, _then);

  /// Create a copy of DistractionEntry
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
    return _then(_$DistractionEntryImpl(
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
              as DistractionCategory,
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

class _$DistractionEntryImpl implements _DistractionEntry {
  const _$DistractionEntryImpl(
      {required this.id,
      required this.sessionId,
      required this.category,
      required this.durationSeconds,
      required this.timestamp});

  @override
  final int id;
  @override
  final int sessionId;
  @override
  final DistractionCategory category;
  @override
  final int durationSeconds;
  @override
  final DateTime timestamp;

  @override
  String toString() {
    return 'DistractionEntry(id: $id, sessionId: $sessionId, category: $category, durationSeconds: $durationSeconds, timestamp: $timestamp)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DistractionEntryImpl &&
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

  @override
  int get hashCode => Object.hash(
      runtimeType, id, sessionId, category, durationSeconds, timestamp);

  /// Create a copy of DistractionEntry
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DistractionEntryImplCopyWith<_$DistractionEntryImpl> get copyWith =>
      __$$DistractionEntryImplCopyWithImpl<_$DistractionEntryImpl>(
          this, _$identity);
}

abstract class _DistractionEntry implements DistractionEntry {
  const factory _DistractionEntry(
      {required final int id,
      required final int sessionId,
      required final DistractionCategory category,
      required final int durationSeconds,
      required final DateTime timestamp}) = _$DistractionEntryImpl;

  @override
  int get id;
  @override
  int get sessionId;
  @override
  DistractionCategory get category;
  @override
  int get durationSeconds;
  @override
  DateTime get timestamp;

  /// Create a copy of DistractionEntry
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DistractionEntryImplCopyWith<_$DistractionEntryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
