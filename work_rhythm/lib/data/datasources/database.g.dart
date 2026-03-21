// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $WorkSessionsTable extends WorkSessions
    with TableInfo<$WorkSessionsTable, WorkSessionRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WorkSessionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _startTimeMeta =
      const VerificationMeta('startTime');
  @override
  late final GeneratedColumn<DateTime> startTime = GeneratedColumn<DateTime>(
      'start_time', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _endTimeMeta =
      const VerificationMeta('endTime');
  @override
  late final GeneratedColumn<DateTime> endTime = GeneratedColumn<DateTime>(
      'end_time', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
      'status', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('RUNNING'));
  static const VerificationMeta _grossSecondsMeta =
      const VerificationMeta('grossSeconds');
  @override
  late final GeneratedColumn<int> grossSeconds = GeneratedColumn<int>(
      'gross_seconds', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _netSecondsMeta =
      const VerificationMeta('netSeconds');
  @override
  late final GeneratedColumn<int> netSeconds = GeneratedColumn<int>(
      'net_seconds', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  @override
  List<GeneratedColumn> get $columns =>
      [id, startTime, endTime, status, grossSeconds, netSeconds];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'work_sessions';
  @override
  VerificationContext validateIntegrity(Insertable<WorkSessionRow> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('start_time')) {
      context.handle(_startTimeMeta,
          startTime.isAcceptableOrUnknown(data['start_time']!, _startTimeMeta));
    } else if (isInserting) {
      context.missing(_startTimeMeta);
    }
    if (data.containsKey('end_time')) {
      context.handle(_endTimeMeta,
          endTime.isAcceptableOrUnknown(data['end_time']!, _endTimeMeta));
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    }
    if (data.containsKey('gross_seconds')) {
      context.handle(
          _grossSecondsMeta,
          grossSeconds.isAcceptableOrUnknown(
              data['gross_seconds']!, _grossSecondsMeta));
    }
    if (data.containsKey('net_seconds')) {
      context.handle(
          _netSecondsMeta,
          netSeconds.isAcceptableOrUnknown(
              data['net_seconds']!, _netSecondsMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  WorkSessionRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return WorkSessionRow(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      startTime: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}start_time'])!,
      endTime: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}end_time']),
      status: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}status'])!,
      grossSeconds: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}gross_seconds'])!,
      netSeconds: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}net_seconds'])!,
    );
  }

  @override
  $WorkSessionsTable createAlias(String alias) {
    return $WorkSessionsTable(attachedDatabase, alias);
  }
}

class WorkSessionRow extends DataClass implements Insertable<WorkSessionRow> {
  final int id;
  final DateTime startTime;
  final DateTime? endTime;
  final String status;
  final int grossSeconds;
  final int netSeconds;
  const WorkSessionRow(
      {required this.id,
      required this.startTime,
      this.endTime,
      required this.status,
      required this.grossSeconds,
      required this.netSeconds});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['start_time'] = Variable<DateTime>(startTime);
    if (!nullToAbsent || endTime != null) {
      map['end_time'] = Variable<DateTime>(endTime);
    }
    map['status'] = Variable<String>(status);
    map['gross_seconds'] = Variable<int>(grossSeconds);
    map['net_seconds'] = Variable<int>(netSeconds);
    return map;
  }

  WorkSessionsCompanion toCompanion(bool nullToAbsent) {
    return WorkSessionsCompanion(
      id: Value(id),
      startTime: Value(startTime),
      endTime: endTime == null && nullToAbsent
          ? const Value.absent()
          : Value(endTime),
      status: Value(status),
      grossSeconds: Value(grossSeconds),
      netSeconds: Value(netSeconds),
    );
  }

  factory WorkSessionRow.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return WorkSessionRow(
      id: serializer.fromJson<int>(json['id']),
      startTime: serializer.fromJson<DateTime>(json['startTime']),
      endTime: serializer.fromJson<DateTime?>(json['endTime']),
      status: serializer.fromJson<String>(json['status']),
      grossSeconds: serializer.fromJson<int>(json['grossSeconds']),
      netSeconds: serializer.fromJson<int>(json['netSeconds']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'startTime': serializer.toJson<DateTime>(startTime),
      'endTime': serializer.toJson<DateTime?>(endTime),
      'status': serializer.toJson<String>(status),
      'grossSeconds': serializer.toJson<int>(grossSeconds),
      'netSeconds': serializer.toJson<int>(netSeconds),
    };
  }

  WorkSessionRow copyWith(
          {int? id,
          DateTime? startTime,
          Value<DateTime?> endTime = const Value.absent(),
          String? status,
          int? grossSeconds,
          int? netSeconds}) =>
      WorkSessionRow(
        id: id ?? this.id,
        startTime: startTime ?? this.startTime,
        endTime: endTime.present ? endTime.value : this.endTime,
        status: status ?? this.status,
        grossSeconds: grossSeconds ?? this.grossSeconds,
        netSeconds: netSeconds ?? this.netSeconds,
      );
  WorkSessionRow copyWithCompanion(WorkSessionsCompanion data) {
    return WorkSessionRow(
      id: data.id.present ? data.id.value : this.id,
      startTime: data.startTime.present ? data.startTime.value : this.startTime,
      endTime: data.endTime.present ? data.endTime.value : this.endTime,
      status: data.status.present ? data.status.value : this.status,
      grossSeconds: data.grossSeconds.present
          ? data.grossSeconds.value
          : this.grossSeconds,
      netSeconds:
          data.netSeconds.present ? data.netSeconds.value : this.netSeconds,
    );
  }

  @override
  String toString() {
    return (StringBuffer('WorkSessionRow(')
          ..write('id: $id, ')
          ..write('startTime: $startTime, ')
          ..write('endTime: $endTime, ')
          ..write('status: $status, ')
          ..write('grossSeconds: $grossSeconds, ')
          ..write('netSeconds: $netSeconds')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, startTime, endTime, status, grossSeconds, netSeconds);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is WorkSessionRow &&
          other.id == this.id &&
          other.startTime == this.startTime &&
          other.endTime == this.endTime &&
          other.status == this.status &&
          other.grossSeconds == this.grossSeconds &&
          other.netSeconds == this.netSeconds);
}

class WorkSessionsCompanion extends UpdateCompanion<WorkSessionRow> {
  final Value<int> id;
  final Value<DateTime> startTime;
  final Value<DateTime?> endTime;
  final Value<String> status;
  final Value<int> grossSeconds;
  final Value<int> netSeconds;
  const WorkSessionsCompanion({
    this.id = const Value.absent(),
    this.startTime = const Value.absent(),
    this.endTime = const Value.absent(),
    this.status = const Value.absent(),
    this.grossSeconds = const Value.absent(),
    this.netSeconds = const Value.absent(),
  });
  WorkSessionsCompanion.insert({
    this.id = const Value.absent(),
    required DateTime startTime,
    this.endTime = const Value.absent(),
    this.status = const Value.absent(),
    this.grossSeconds = const Value.absent(),
    this.netSeconds = const Value.absent(),
  }) : startTime = Value(startTime);
  static Insertable<WorkSessionRow> custom({
    Expression<int>? id,
    Expression<DateTime>? startTime,
    Expression<DateTime>? endTime,
    Expression<String>? status,
    Expression<int>? grossSeconds,
    Expression<int>? netSeconds,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (startTime != null) 'start_time': startTime,
      if (endTime != null) 'end_time': endTime,
      if (status != null) 'status': status,
      if (grossSeconds != null) 'gross_seconds': grossSeconds,
      if (netSeconds != null) 'net_seconds': netSeconds,
    });
  }

  WorkSessionsCompanion copyWith(
      {Value<int>? id,
      Value<DateTime>? startTime,
      Value<DateTime?>? endTime,
      Value<String>? status,
      Value<int>? grossSeconds,
      Value<int>? netSeconds}) {
    return WorkSessionsCompanion(
      id: id ?? this.id,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      status: status ?? this.status,
      grossSeconds: grossSeconds ?? this.grossSeconds,
      netSeconds: netSeconds ?? this.netSeconds,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (startTime.present) {
      map['start_time'] = Variable<DateTime>(startTime.value);
    }
    if (endTime.present) {
      map['end_time'] = Variable<DateTime>(endTime.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (grossSeconds.present) {
      map['gross_seconds'] = Variable<int>(grossSeconds.value);
    }
    if (netSeconds.present) {
      map['net_seconds'] = Variable<int>(netSeconds.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WorkSessionsCompanion(')
          ..write('id: $id, ')
          ..write('startTime: $startTime, ')
          ..write('endTime: $endTime, ')
          ..write('status: $status, ')
          ..write('grossSeconds: $grossSeconds, ')
          ..write('netSeconds: $netSeconds')
          ..write(')'))
        .toString();
  }
}

class $DistractionEntriesTable extends DistractionEntries
    with TableInfo<$DistractionEntriesTable, DistractionEntryRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DistractionEntriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _sessionIdMeta =
      const VerificationMeta('sessionId');
  @override
  late final GeneratedColumn<int> sessionId = GeneratedColumn<int>(
      'session_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES work_sessions (id)'));
  static const VerificationMeta _categoryMeta =
      const VerificationMeta('category');
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
      'category', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _durationSecondsMeta =
      const VerificationMeta('durationSeconds');
  @override
  late final GeneratedColumn<int> durationSeconds = GeneratedColumn<int>(
      'duration_seconds', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _timestampMeta =
      const VerificationMeta('timestamp');
  @override
  late final GeneratedColumn<DateTime> timestamp = GeneratedColumn<DateTime>(
      'timestamp', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, sessionId, category, durationSeconds, timestamp];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'distraction_entries';
  @override
  VerificationContext validateIntegrity(
      Insertable<DistractionEntryRow> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('session_id')) {
      context.handle(_sessionIdMeta,
          sessionId.isAcceptableOrUnknown(data['session_id']!, _sessionIdMeta));
    } else if (isInserting) {
      context.missing(_sessionIdMeta);
    }
    if (data.containsKey('category')) {
      context.handle(_categoryMeta,
          category.isAcceptableOrUnknown(data['category']!, _categoryMeta));
    } else if (isInserting) {
      context.missing(_categoryMeta);
    }
    if (data.containsKey('duration_seconds')) {
      context.handle(
          _durationSecondsMeta,
          durationSeconds.isAcceptableOrUnknown(
              data['duration_seconds']!, _durationSecondsMeta));
    } else if (isInserting) {
      context.missing(_durationSecondsMeta);
    }
    if (data.containsKey('timestamp')) {
      context.handle(_timestampMeta,
          timestamp.isAcceptableOrUnknown(data['timestamp']!, _timestampMeta));
    } else if (isInserting) {
      context.missing(_timestampMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DistractionEntryRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DistractionEntryRow(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      sessionId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}session_id'])!,
      category: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}category'])!,
      durationSeconds: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}duration_seconds'])!,
      timestamp: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}timestamp'])!,
    );
  }

  @override
  $DistractionEntriesTable createAlias(String alias) {
    return $DistractionEntriesTable(attachedDatabase, alias);
  }
}

class DistractionEntryRow extends DataClass
    implements Insertable<DistractionEntryRow> {
  final int id;
  final int sessionId;
  final String category;
  final int durationSeconds;
  final DateTime timestamp;
  const DistractionEntryRow(
      {required this.id,
      required this.sessionId,
      required this.category,
      required this.durationSeconds,
      required this.timestamp});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['session_id'] = Variable<int>(sessionId);
    map['category'] = Variable<String>(category);
    map['duration_seconds'] = Variable<int>(durationSeconds);
    map['timestamp'] = Variable<DateTime>(timestamp);
    return map;
  }

  DistractionEntriesCompanion toCompanion(bool nullToAbsent) {
    return DistractionEntriesCompanion(
      id: Value(id),
      sessionId: Value(sessionId),
      category: Value(category),
      durationSeconds: Value(durationSeconds),
      timestamp: Value(timestamp),
    );
  }

  factory DistractionEntryRow.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DistractionEntryRow(
      id: serializer.fromJson<int>(json['id']),
      sessionId: serializer.fromJson<int>(json['sessionId']),
      category: serializer.fromJson<String>(json['category']),
      durationSeconds: serializer.fromJson<int>(json['durationSeconds']),
      timestamp: serializer.fromJson<DateTime>(json['timestamp']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'sessionId': serializer.toJson<int>(sessionId),
      'category': serializer.toJson<String>(category),
      'durationSeconds': serializer.toJson<int>(durationSeconds),
      'timestamp': serializer.toJson<DateTime>(timestamp),
    };
  }

  DistractionEntryRow copyWith(
          {int? id,
          int? sessionId,
          String? category,
          int? durationSeconds,
          DateTime? timestamp}) =>
      DistractionEntryRow(
        id: id ?? this.id,
        sessionId: sessionId ?? this.sessionId,
        category: category ?? this.category,
        durationSeconds: durationSeconds ?? this.durationSeconds,
        timestamp: timestamp ?? this.timestamp,
      );
  DistractionEntryRow copyWithCompanion(DistractionEntriesCompanion data) {
    return DistractionEntryRow(
      id: data.id.present ? data.id.value : this.id,
      sessionId: data.sessionId.present ? data.sessionId.value : this.sessionId,
      category: data.category.present ? data.category.value : this.category,
      durationSeconds: data.durationSeconds.present
          ? data.durationSeconds.value
          : this.durationSeconds,
      timestamp: data.timestamp.present ? data.timestamp.value : this.timestamp,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DistractionEntryRow(')
          ..write('id: $id, ')
          ..write('sessionId: $sessionId, ')
          ..write('category: $category, ')
          ..write('durationSeconds: $durationSeconds, ')
          ..write('timestamp: $timestamp')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, sessionId, category, durationSeconds, timestamp);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DistractionEntryRow &&
          other.id == this.id &&
          other.sessionId == this.sessionId &&
          other.category == this.category &&
          other.durationSeconds == this.durationSeconds &&
          other.timestamp == this.timestamp);
}

class DistractionEntriesCompanion extends UpdateCompanion<DistractionEntryRow> {
  final Value<int> id;
  final Value<int> sessionId;
  final Value<String> category;
  final Value<int> durationSeconds;
  final Value<DateTime> timestamp;
  const DistractionEntriesCompanion({
    this.id = const Value.absent(),
    this.sessionId = const Value.absent(),
    this.category = const Value.absent(),
    this.durationSeconds = const Value.absent(),
    this.timestamp = const Value.absent(),
  });
  DistractionEntriesCompanion.insert({
    this.id = const Value.absent(),
    required int sessionId,
    required String category,
    required int durationSeconds,
    required DateTime timestamp,
  })  : sessionId = Value(sessionId),
        category = Value(category),
        durationSeconds = Value(durationSeconds),
        timestamp = Value(timestamp);
  static Insertable<DistractionEntryRow> custom({
    Expression<int>? id,
    Expression<int>? sessionId,
    Expression<String>? category,
    Expression<int>? durationSeconds,
    Expression<DateTime>? timestamp,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (sessionId != null) 'session_id': sessionId,
      if (category != null) 'category': category,
      if (durationSeconds != null) 'duration_seconds': durationSeconds,
      if (timestamp != null) 'timestamp': timestamp,
    });
  }

  DistractionEntriesCompanion copyWith(
      {Value<int>? id,
      Value<int>? sessionId,
      Value<String>? category,
      Value<int>? durationSeconds,
      Value<DateTime>? timestamp}) {
    return DistractionEntriesCompanion(
      id: id ?? this.id,
      sessionId: sessionId ?? this.sessionId,
      category: category ?? this.category,
      durationSeconds: durationSeconds ?? this.durationSeconds,
      timestamp: timestamp ?? this.timestamp,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (sessionId.present) {
      map['session_id'] = Variable<int>(sessionId.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (durationSeconds.present) {
      map['duration_seconds'] = Variable<int>(durationSeconds.value);
    }
    if (timestamp.present) {
      map['timestamp'] = Variable<DateTime>(timestamp.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DistractionEntriesCompanion(')
          ..write('id: $id, ')
          ..write('sessionId: $sessionId, ')
          ..write('category: $category, ')
          ..write('durationSeconds: $durationSeconds, ')
          ..write('timestamp: $timestamp')
          ..write(')'))
        .toString();
  }
}

class $LearningGoalsTable extends LearningGoals
    with TableInfo<$LearningGoalsTable, LearningGoalRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LearningGoalsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _targetMinutesMeta =
      const VerificationMeta('targetMinutes');
  @override
  late final GeneratedColumn<int> targetMinutes = GeneratedColumn<int>(
      'target_minutes', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _deadlineMeta =
      const VerificationMeta('deadline');
  @override
  late final GeneratedColumn<DateTime> deadline = GeneratedColumn<DateTime>(
      'deadline', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _isActiveMeta =
      const VerificationMeta('isActive');
  @override
  late final GeneratedColumn<bool> isActive = GeneratedColumn<bool>(
      'is_active', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_active" IN (0, 1))'),
      defaultValue: const Constant(true));
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, targetMinutes, deadline, description, createdAt, isActive];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'learning_goals';
  @override
  VerificationContext validateIntegrity(Insertable<LearningGoalRow> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('target_minutes')) {
      context.handle(
          _targetMinutesMeta,
          targetMinutes.isAcceptableOrUnknown(
              data['target_minutes']!, _targetMinutesMeta));
    } else if (isInserting) {
      context.missing(_targetMinutesMeta);
    }
    if (data.containsKey('deadline')) {
      context.handle(_deadlineMeta,
          deadline.isAcceptableOrUnknown(data['deadline']!, _deadlineMeta));
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('is_active')) {
      context.handle(_isActiveMeta,
          isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  LearningGoalRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LearningGoalRow(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      targetMinutes: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}target_minutes'])!,
      deadline: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}deadline']),
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      isActive: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_active'])!,
    );
  }

  @override
  $LearningGoalsTable createAlias(String alias) {
    return $LearningGoalsTable(attachedDatabase, alias);
  }
}

class LearningGoalRow extends DataClass implements Insertable<LearningGoalRow> {
  final int id;
  final String name;
  final int targetMinutes;
  final DateTime? deadline;
  final String? description;
  final DateTime createdAt;
  final bool isActive;
  const LearningGoalRow(
      {required this.id,
      required this.name,
      required this.targetMinutes,
      this.deadline,
      this.description,
      required this.createdAt,
      required this.isActive});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['target_minutes'] = Variable<int>(targetMinutes);
    if (!nullToAbsent || deadline != null) {
      map['deadline'] = Variable<DateTime>(deadline);
    }
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['is_active'] = Variable<bool>(isActive);
    return map;
  }

  LearningGoalsCompanion toCompanion(bool nullToAbsent) {
    return LearningGoalsCompanion(
      id: Value(id),
      name: Value(name),
      targetMinutes: Value(targetMinutes),
      deadline: deadline == null && nullToAbsent
          ? const Value.absent()
          : Value(deadline),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      createdAt: Value(createdAt),
      isActive: Value(isActive),
    );
  }

  factory LearningGoalRow.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LearningGoalRow(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      targetMinutes: serializer.fromJson<int>(json['targetMinutes']),
      deadline: serializer.fromJson<DateTime?>(json['deadline']),
      description: serializer.fromJson<String?>(json['description']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      isActive: serializer.fromJson<bool>(json['isActive']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'targetMinutes': serializer.toJson<int>(targetMinutes),
      'deadline': serializer.toJson<DateTime?>(deadline),
      'description': serializer.toJson<String?>(description),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'isActive': serializer.toJson<bool>(isActive),
    };
  }

  LearningGoalRow copyWith(
          {int? id,
          String? name,
          int? targetMinutes,
          Value<DateTime?> deadline = const Value.absent(),
          Value<String?> description = const Value.absent(),
          DateTime? createdAt,
          bool? isActive}) =>
      LearningGoalRow(
        id: id ?? this.id,
        name: name ?? this.name,
        targetMinutes: targetMinutes ?? this.targetMinutes,
        deadline: deadline.present ? deadline.value : this.deadline,
        description: description.present ? description.value : this.description,
        createdAt: createdAt ?? this.createdAt,
        isActive: isActive ?? this.isActive,
      );
  LearningGoalRow copyWithCompanion(LearningGoalsCompanion data) {
    return LearningGoalRow(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      targetMinutes: data.targetMinutes.present
          ? data.targetMinutes.value
          : this.targetMinutes,
      deadline: data.deadline.present ? data.deadline.value : this.deadline,
      description:
          data.description.present ? data.description.value : this.description,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      isActive: data.isActive.present ? data.isActive.value : this.isActive,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LearningGoalRow(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('targetMinutes: $targetMinutes, ')
          ..write('deadline: $deadline, ')
          ..write('description: $description, ')
          ..write('createdAt: $createdAt, ')
          ..write('isActive: $isActive')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, name, targetMinutes, deadline, description, createdAt, isActive);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LearningGoalRow &&
          other.id == this.id &&
          other.name == this.name &&
          other.targetMinutes == this.targetMinutes &&
          other.deadline == this.deadline &&
          other.description == this.description &&
          other.createdAt == this.createdAt &&
          other.isActive == this.isActive);
}

class LearningGoalsCompanion extends UpdateCompanion<LearningGoalRow> {
  final Value<int> id;
  final Value<String> name;
  final Value<int> targetMinutes;
  final Value<DateTime?> deadline;
  final Value<String?> description;
  final Value<DateTime> createdAt;
  final Value<bool> isActive;
  const LearningGoalsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.targetMinutes = const Value.absent(),
    this.deadline = const Value.absent(),
    this.description = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.isActive = const Value.absent(),
  });
  LearningGoalsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required int targetMinutes,
    this.deadline = const Value.absent(),
    this.description = const Value.absent(),
    required DateTime createdAt,
    this.isActive = const Value.absent(),
  })  : name = Value(name),
        targetMinutes = Value(targetMinutes),
        createdAt = Value(createdAt);
  static Insertable<LearningGoalRow> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<int>? targetMinutes,
    Expression<DateTime>? deadline,
    Expression<String>? description,
    Expression<DateTime>? createdAt,
    Expression<bool>? isActive,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (targetMinutes != null) 'target_minutes': targetMinutes,
      if (deadline != null) 'deadline': deadline,
      if (description != null) 'description': description,
      if (createdAt != null) 'created_at': createdAt,
      if (isActive != null) 'is_active': isActive,
    });
  }

  LearningGoalsCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<int>? targetMinutes,
      Value<DateTime?>? deadline,
      Value<String?>? description,
      Value<DateTime>? createdAt,
      Value<bool>? isActive}) {
    return LearningGoalsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      targetMinutes: targetMinutes ?? this.targetMinutes,
      deadline: deadline ?? this.deadline,
      description: description ?? this.description,
      createdAt: createdAt ?? this.createdAt,
      isActive: isActive ?? this.isActive,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (targetMinutes.present) {
      map['target_minutes'] = Variable<int>(targetMinutes.value);
    }
    if (deadline.present) {
      map['deadline'] = Variable<DateTime>(deadline.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (isActive.present) {
      map['is_active'] = Variable<bool>(isActive.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LearningGoalsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('targetMinutes: $targetMinutes, ')
          ..write('deadline: $deadline, ')
          ..write('description: $description, ')
          ..write('createdAt: $createdAt, ')
          ..write('isActive: $isActive')
          ..write(')'))
        .toString();
  }
}

class $LearningSessionsTable extends LearningSessions
    with TableInfo<$LearningSessionsTable, LearningSessionRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LearningSessionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _goalIdMeta = const VerificationMeta('goalId');
  @override
  late final GeneratedColumn<int> goalId = GeneratedColumn<int>(
      'goal_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES learning_goals (id)'));
  static const VerificationMeta _startTimeMeta =
      const VerificationMeta('startTime');
  @override
  late final GeneratedColumn<DateTime> startTime = GeneratedColumn<DateTime>(
      'start_time', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _endTimeMeta =
      const VerificationMeta('endTime');
  @override
  late final GeneratedColumn<DateTime> endTime = GeneratedColumn<DateTime>(
      'end_time', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _durationSecondsMeta =
      const VerificationMeta('durationSeconds');
  @override
  late final GeneratedColumn<int> durationSeconds = GeneratedColumn<int>(
      'duration_seconds', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
      'status', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('RUNNING'));
  @override
  List<GeneratedColumn> get $columns =>
      [id, goalId, startTime, endTime, durationSeconds, status];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'learning_sessions';
  @override
  VerificationContext validateIntegrity(Insertable<LearningSessionRow> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('goal_id')) {
      context.handle(_goalIdMeta,
          goalId.isAcceptableOrUnknown(data['goal_id']!, _goalIdMeta));
    } else if (isInserting) {
      context.missing(_goalIdMeta);
    }
    if (data.containsKey('start_time')) {
      context.handle(_startTimeMeta,
          startTime.isAcceptableOrUnknown(data['start_time']!, _startTimeMeta));
    } else if (isInserting) {
      context.missing(_startTimeMeta);
    }
    if (data.containsKey('end_time')) {
      context.handle(_endTimeMeta,
          endTime.isAcceptableOrUnknown(data['end_time']!, _endTimeMeta));
    }
    if (data.containsKey('duration_seconds')) {
      context.handle(
          _durationSecondsMeta,
          durationSeconds.isAcceptableOrUnknown(
              data['duration_seconds']!, _durationSecondsMeta));
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  LearningSessionRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LearningSessionRow(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      goalId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}goal_id'])!,
      startTime: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}start_time'])!,
      endTime: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}end_time']),
      durationSeconds: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}duration_seconds'])!,
      status: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}status'])!,
    );
  }

  @override
  $LearningSessionsTable createAlias(String alias) {
    return $LearningSessionsTable(attachedDatabase, alias);
  }
}

class LearningSessionRow extends DataClass
    implements Insertable<LearningSessionRow> {
  final int id;
  final int goalId;
  final DateTime startTime;
  final DateTime? endTime;
  final int durationSeconds;
  final String status;
  const LearningSessionRow(
      {required this.id,
      required this.goalId,
      required this.startTime,
      this.endTime,
      required this.durationSeconds,
      required this.status});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['goal_id'] = Variable<int>(goalId);
    map['start_time'] = Variable<DateTime>(startTime);
    if (!nullToAbsent || endTime != null) {
      map['end_time'] = Variable<DateTime>(endTime);
    }
    map['duration_seconds'] = Variable<int>(durationSeconds);
    map['status'] = Variable<String>(status);
    return map;
  }

  LearningSessionsCompanion toCompanion(bool nullToAbsent) {
    return LearningSessionsCompanion(
      id: Value(id),
      goalId: Value(goalId),
      startTime: Value(startTime),
      endTime: endTime == null && nullToAbsent
          ? const Value.absent()
          : Value(endTime),
      durationSeconds: Value(durationSeconds),
      status: Value(status),
    );
  }

  factory LearningSessionRow.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LearningSessionRow(
      id: serializer.fromJson<int>(json['id']),
      goalId: serializer.fromJson<int>(json['goalId']),
      startTime: serializer.fromJson<DateTime>(json['startTime']),
      endTime: serializer.fromJson<DateTime?>(json['endTime']),
      durationSeconds: serializer.fromJson<int>(json['durationSeconds']),
      status: serializer.fromJson<String>(json['status']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'goalId': serializer.toJson<int>(goalId),
      'startTime': serializer.toJson<DateTime>(startTime),
      'endTime': serializer.toJson<DateTime?>(endTime),
      'durationSeconds': serializer.toJson<int>(durationSeconds),
      'status': serializer.toJson<String>(status),
    };
  }

  LearningSessionRow copyWith(
          {int? id,
          int? goalId,
          DateTime? startTime,
          Value<DateTime?> endTime = const Value.absent(),
          int? durationSeconds,
          String? status}) =>
      LearningSessionRow(
        id: id ?? this.id,
        goalId: goalId ?? this.goalId,
        startTime: startTime ?? this.startTime,
        endTime: endTime.present ? endTime.value : this.endTime,
        durationSeconds: durationSeconds ?? this.durationSeconds,
        status: status ?? this.status,
      );
  LearningSessionRow copyWithCompanion(LearningSessionsCompanion data) {
    return LearningSessionRow(
      id: data.id.present ? data.id.value : this.id,
      goalId: data.goalId.present ? data.goalId.value : this.goalId,
      startTime: data.startTime.present ? data.startTime.value : this.startTime,
      endTime: data.endTime.present ? data.endTime.value : this.endTime,
      durationSeconds: data.durationSeconds.present
          ? data.durationSeconds.value
          : this.durationSeconds,
      status: data.status.present ? data.status.value : this.status,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LearningSessionRow(')
          ..write('id: $id, ')
          ..write('goalId: $goalId, ')
          ..write('startTime: $startTime, ')
          ..write('endTime: $endTime, ')
          ..write('durationSeconds: $durationSeconds, ')
          ..write('status: $status')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, goalId, startTime, endTime, durationSeconds, status);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LearningSessionRow &&
          other.id == this.id &&
          other.goalId == this.goalId &&
          other.startTime == this.startTime &&
          other.endTime == this.endTime &&
          other.durationSeconds == this.durationSeconds &&
          other.status == this.status);
}

class LearningSessionsCompanion extends UpdateCompanion<LearningSessionRow> {
  final Value<int> id;
  final Value<int> goalId;
  final Value<DateTime> startTime;
  final Value<DateTime?> endTime;
  final Value<int> durationSeconds;
  final Value<String> status;
  const LearningSessionsCompanion({
    this.id = const Value.absent(),
    this.goalId = const Value.absent(),
    this.startTime = const Value.absent(),
    this.endTime = const Value.absent(),
    this.durationSeconds = const Value.absent(),
    this.status = const Value.absent(),
  });
  LearningSessionsCompanion.insert({
    this.id = const Value.absent(),
    required int goalId,
    required DateTime startTime,
    this.endTime = const Value.absent(),
    this.durationSeconds = const Value.absent(),
    this.status = const Value.absent(),
  })  : goalId = Value(goalId),
        startTime = Value(startTime);
  static Insertable<LearningSessionRow> custom({
    Expression<int>? id,
    Expression<int>? goalId,
    Expression<DateTime>? startTime,
    Expression<DateTime>? endTime,
    Expression<int>? durationSeconds,
    Expression<String>? status,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (goalId != null) 'goal_id': goalId,
      if (startTime != null) 'start_time': startTime,
      if (endTime != null) 'end_time': endTime,
      if (durationSeconds != null) 'duration_seconds': durationSeconds,
      if (status != null) 'status': status,
    });
  }

  LearningSessionsCompanion copyWith(
      {Value<int>? id,
      Value<int>? goalId,
      Value<DateTime>? startTime,
      Value<DateTime?>? endTime,
      Value<int>? durationSeconds,
      Value<String>? status}) {
    return LearningSessionsCompanion(
      id: id ?? this.id,
      goalId: goalId ?? this.goalId,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      durationSeconds: durationSeconds ?? this.durationSeconds,
      status: status ?? this.status,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (goalId.present) {
      map['goal_id'] = Variable<int>(goalId.value);
    }
    if (startTime.present) {
      map['start_time'] = Variable<DateTime>(startTime.value);
    }
    if (endTime.present) {
      map['end_time'] = Variable<DateTime>(endTime.value);
    }
    if (durationSeconds.present) {
      map['duration_seconds'] = Variable<int>(durationSeconds.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LearningSessionsCompanion(')
          ..write('id: $id, ')
          ..write('goalId: $goalId, ')
          ..write('startTime: $startTime, ')
          ..write('endTime: $endTime, ')
          ..write('durationSeconds: $durationSeconds, ')
          ..write('status: $status')
          ..write(')'))
        .toString();
  }
}

class $AppConfigsTable extends AppConfigs
    with TableInfo<$AppConfigsTable, AppConfigRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AppConfigsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _targetHoursMeta =
      const VerificationMeta('targetHours');
  @override
  late final GeneratedColumn<int> targetHours = GeneratedColumn<int>(
      'target_hours', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(8));
  static const VerificationMeta _activityReminderMinutesMeta =
      const VerificationMeta('activityReminderMinutes');
  @override
  late final GeneratedColumn<int> activityReminderMinutes =
      GeneratedColumn<int>('activity_reminder_minutes', aliasedName, false,
          type: DriftSqlType.int,
          requiredDuringInsert: false,
          defaultValue: const Constant(90));
  static const VerificationMeta _overtimeNotificationIntervalMinutesMeta =
      const VerificationMeta('overtimeNotificationIntervalMinutes');
  @override
  late final GeneratedColumn<int> overtimeNotificationIntervalMinutes =
      GeneratedColumn<int>(
          'overtime_notification_interval_minutes', aliasedName, false,
          type: DriftSqlType.int,
          requiredDuringInsert: false,
          defaultValue: const Constant(30));
  static const VerificationMeta _overtimeNotificationsEnabledMeta =
      const VerificationMeta('overtimeNotificationsEnabled');
  @override
  late final GeneratedColumn<bool> overtimeNotificationsEnabled =
      GeneratedColumn<bool>(
          'overtime_notifications_enabled', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: false,
          defaultConstraints: GeneratedColumn.constraintIsAlways(
              'CHECK ("overtime_notifications_enabled" IN (0, 1))'),
          defaultValue: const Constant(true));
  static const VerificationMeta _activityRemindersEnabledMeta =
      const VerificationMeta('activityRemindersEnabled');
  @override
  late final GeneratedColumn<bool> activityRemindersEnabled =
      GeneratedColumn<bool>(
          'activity_reminders_enabled', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: false,
          defaultConstraints: GeneratedColumn.constraintIsAlways(
              'CHECK ("activity_reminders_enabled" IN (0, 1))'),
          defaultValue: const Constant(true));
  static const VerificationMeta _customCategoriesMeta =
      const VerificationMeta('customCategories');
  @override
  late final GeneratedColumn<String> customCategories = GeneratedColumn<String>(
      'custom_categories', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        targetHours,
        activityReminderMinutes,
        overtimeNotificationIntervalMinutes,
        overtimeNotificationsEnabled,
        activityRemindersEnabled,
        customCategories
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'app_configs';
  @override
  VerificationContext validateIntegrity(Insertable<AppConfigRow> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('target_hours')) {
      context.handle(
          _targetHoursMeta,
          targetHours.isAcceptableOrUnknown(
              data['target_hours']!, _targetHoursMeta));
    }
    if (data.containsKey('activity_reminder_minutes')) {
      context.handle(
          _activityReminderMinutesMeta,
          activityReminderMinutes.isAcceptableOrUnknown(
              data['activity_reminder_minutes']!,
              _activityReminderMinutesMeta));
    }
    if (data.containsKey('overtime_notification_interval_minutes')) {
      context.handle(
          _overtimeNotificationIntervalMinutesMeta,
          overtimeNotificationIntervalMinutes.isAcceptableOrUnknown(
              data['overtime_notification_interval_minutes']!,
              _overtimeNotificationIntervalMinutesMeta));
    }
    if (data.containsKey('overtime_notifications_enabled')) {
      context.handle(
          _overtimeNotificationsEnabledMeta,
          overtimeNotificationsEnabled.isAcceptableOrUnknown(
              data['overtime_notifications_enabled']!,
              _overtimeNotificationsEnabledMeta));
    }
    if (data.containsKey('activity_reminders_enabled')) {
      context.handle(
          _activityRemindersEnabledMeta,
          activityRemindersEnabled.isAcceptableOrUnknown(
              data['activity_reminders_enabled']!,
              _activityRemindersEnabledMeta));
    }
    if (data.containsKey('custom_categories')) {
      context.handle(
          _customCategoriesMeta,
          customCategories.isAcceptableOrUnknown(
              data['custom_categories']!, _customCategoriesMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AppConfigRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AppConfigRow(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      targetHours: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}target_hours'])!,
      activityReminderMinutes: attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}activity_reminder_minutes'])!,
      overtimeNotificationIntervalMinutes: attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}overtime_notification_interval_minutes'])!,
      overtimeNotificationsEnabled: attachedDatabase.typeMapping.read(
          DriftSqlType.bool,
          data['${effectivePrefix}overtime_notifications_enabled'])!,
      activityRemindersEnabled: attachedDatabase.typeMapping.read(
          DriftSqlType.bool,
          data['${effectivePrefix}activity_reminders_enabled'])!,
      customCategories: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}custom_categories']),
    );
  }

  @override
  $AppConfigsTable createAlias(String alias) {
    return $AppConfigsTable(attachedDatabase, alias);
  }
}

class AppConfigRow extends DataClass implements Insertable<AppConfigRow> {
  final int id;
  final int targetHours;
  final int activityReminderMinutes;
  final int overtimeNotificationIntervalMinutes;
  final bool overtimeNotificationsEnabled;
  final bool activityRemindersEnabled;
  final String? customCategories;
  const AppConfigRow(
      {required this.id,
      required this.targetHours,
      required this.activityReminderMinutes,
      required this.overtimeNotificationIntervalMinutes,
      required this.overtimeNotificationsEnabled,
      required this.activityRemindersEnabled,
      this.customCategories});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['target_hours'] = Variable<int>(targetHours);
    map['activity_reminder_minutes'] = Variable<int>(activityReminderMinutes);
    map['overtime_notification_interval_minutes'] =
        Variable<int>(overtimeNotificationIntervalMinutes);
    map['overtime_notifications_enabled'] =
        Variable<bool>(overtimeNotificationsEnabled);
    map['activity_reminders_enabled'] =
        Variable<bool>(activityRemindersEnabled);
    if (!nullToAbsent || customCategories != null) {
      map['custom_categories'] = Variable<String>(customCategories);
    }
    return map;
  }

  AppConfigsCompanion toCompanion(bool nullToAbsent) {
    return AppConfigsCompanion(
      id: Value(id),
      targetHours: Value(targetHours),
      activityReminderMinutes: Value(activityReminderMinutes),
      overtimeNotificationIntervalMinutes:
          Value(overtimeNotificationIntervalMinutes),
      overtimeNotificationsEnabled: Value(overtimeNotificationsEnabled),
      activityRemindersEnabled: Value(activityRemindersEnabled),
      customCategories: customCategories == null && nullToAbsent
          ? const Value.absent()
          : Value(customCategories),
    );
  }

  factory AppConfigRow.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AppConfigRow(
      id: serializer.fromJson<int>(json['id']),
      targetHours: serializer.fromJson<int>(json['targetHours']),
      activityReminderMinutes:
          serializer.fromJson<int>(json['activityReminderMinutes']),
      overtimeNotificationIntervalMinutes:
          serializer.fromJson<int>(json['overtimeNotificationIntervalMinutes']),
      overtimeNotificationsEnabled:
          serializer.fromJson<bool>(json['overtimeNotificationsEnabled']),
      activityRemindersEnabled:
          serializer.fromJson<bool>(json['activityRemindersEnabled']),
      customCategories: serializer.fromJson<String?>(json['customCategories']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'targetHours': serializer.toJson<int>(targetHours),
      'activityReminderMinutes':
          serializer.toJson<int>(activityReminderMinutes),
      'overtimeNotificationIntervalMinutes':
          serializer.toJson<int>(overtimeNotificationIntervalMinutes),
      'overtimeNotificationsEnabled':
          serializer.toJson<bool>(overtimeNotificationsEnabled),
      'activityRemindersEnabled':
          serializer.toJson<bool>(activityRemindersEnabled),
      'customCategories': serializer.toJson<String?>(customCategories),
    };
  }

  AppConfigRow copyWith(
          {int? id,
          int? targetHours,
          int? activityReminderMinutes,
          int? overtimeNotificationIntervalMinutes,
          bool? overtimeNotificationsEnabled,
          bool? activityRemindersEnabled,
          Value<String?> customCategories = const Value.absent()}) =>
      AppConfigRow(
        id: id ?? this.id,
        targetHours: targetHours ?? this.targetHours,
        activityReminderMinutes:
            activityReminderMinutes ?? this.activityReminderMinutes,
        overtimeNotificationIntervalMinutes:
            overtimeNotificationIntervalMinutes ??
                this.overtimeNotificationIntervalMinutes,
        overtimeNotificationsEnabled:
            overtimeNotificationsEnabled ?? this.overtimeNotificationsEnabled,
        activityRemindersEnabled:
            activityRemindersEnabled ?? this.activityRemindersEnabled,
        customCategories: customCategories.present
            ? customCategories.value
            : this.customCategories,
      );
  AppConfigRow copyWithCompanion(AppConfigsCompanion data) {
    return AppConfigRow(
      id: data.id.present ? data.id.value : this.id,
      targetHours:
          data.targetHours.present ? data.targetHours.value : this.targetHours,
      activityReminderMinutes: data.activityReminderMinutes.present
          ? data.activityReminderMinutes.value
          : this.activityReminderMinutes,
      overtimeNotificationIntervalMinutes:
          data.overtimeNotificationIntervalMinutes.present
              ? data.overtimeNotificationIntervalMinutes.value
              : this.overtimeNotificationIntervalMinutes,
      overtimeNotificationsEnabled: data.overtimeNotificationsEnabled.present
          ? data.overtimeNotificationsEnabled.value
          : this.overtimeNotificationsEnabled,
      activityRemindersEnabled: data.activityRemindersEnabled.present
          ? data.activityRemindersEnabled.value
          : this.activityRemindersEnabled,
      customCategories: data.customCategories.present
          ? data.customCategories.value
          : this.customCategories,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AppConfigRow(')
          ..write('id: $id, ')
          ..write('targetHours: $targetHours, ')
          ..write('activityReminderMinutes: $activityReminderMinutes, ')
          ..write(
              'overtimeNotificationIntervalMinutes: $overtimeNotificationIntervalMinutes, ')
          ..write(
              'overtimeNotificationsEnabled: $overtimeNotificationsEnabled, ')
          ..write('activityRemindersEnabled: $activityRemindersEnabled, ')
          ..write('customCategories: $customCategories')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      targetHours,
      activityReminderMinutes,
      overtimeNotificationIntervalMinutes,
      overtimeNotificationsEnabled,
      activityRemindersEnabled,
      customCategories);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AppConfigRow &&
          other.id == this.id &&
          other.targetHours == this.targetHours &&
          other.activityReminderMinutes == this.activityReminderMinutes &&
          other.overtimeNotificationIntervalMinutes ==
              this.overtimeNotificationIntervalMinutes &&
          other.overtimeNotificationsEnabled ==
              this.overtimeNotificationsEnabled &&
          other.activityRemindersEnabled == this.activityRemindersEnabled &&
          other.customCategories == this.customCategories);
}

class AppConfigsCompanion extends UpdateCompanion<AppConfigRow> {
  final Value<int> id;
  final Value<int> targetHours;
  final Value<int> activityReminderMinutes;
  final Value<int> overtimeNotificationIntervalMinutes;
  final Value<bool> overtimeNotificationsEnabled;
  final Value<bool> activityRemindersEnabled;
  final Value<String?> customCategories;
  const AppConfigsCompanion({
    this.id = const Value.absent(),
    this.targetHours = const Value.absent(),
    this.activityReminderMinutes = const Value.absent(),
    this.overtimeNotificationIntervalMinutes = const Value.absent(),
    this.overtimeNotificationsEnabled = const Value.absent(),
    this.activityRemindersEnabled = const Value.absent(),
    this.customCategories = const Value.absent(),
  });
  AppConfigsCompanion.insert({
    this.id = const Value.absent(),
    this.targetHours = const Value.absent(),
    this.activityReminderMinutes = const Value.absent(),
    this.overtimeNotificationIntervalMinutes = const Value.absent(),
    this.overtimeNotificationsEnabled = const Value.absent(),
    this.activityRemindersEnabled = const Value.absent(),
    this.customCategories = const Value.absent(),
  });
  static Insertable<AppConfigRow> custom({
    Expression<int>? id,
    Expression<int>? targetHours,
    Expression<int>? activityReminderMinutes,
    Expression<int>? overtimeNotificationIntervalMinutes,
    Expression<bool>? overtimeNotificationsEnabled,
    Expression<bool>? activityRemindersEnabled,
    Expression<String>? customCategories,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (targetHours != null) 'target_hours': targetHours,
      if (activityReminderMinutes != null)
        'activity_reminder_minutes': activityReminderMinutes,
      if (overtimeNotificationIntervalMinutes != null)
        'overtime_notification_interval_minutes':
            overtimeNotificationIntervalMinutes,
      if (overtimeNotificationsEnabled != null)
        'overtime_notifications_enabled': overtimeNotificationsEnabled,
      if (activityRemindersEnabled != null)
        'activity_reminders_enabled': activityRemindersEnabled,
      if (customCategories != null) 'custom_categories': customCategories,
    });
  }

  AppConfigsCompanion copyWith(
      {Value<int>? id,
      Value<int>? targetHours,
      Value<int>? activityReminderMinutes,
      Value<int>? overtimeNotificationIntervalMinutes,
      Value<bool>? overtimeNotificationsEnabled,
      Value<bool>? activityRemindersEnabled,
      Value<String?>? customCategories}) {
    return AppConfigsCompanion(
      id: id ?? this.id,
      targetHours: targetHours ?? this.targetHours,
      activityReminderMinutes:
          activityReminderMinutes ?? this.activityReminderMinutes,
      overtimeNotificationIntervalMinutes:
          overtimeNotificationIntervalMinutes ??
              this.overtimeNotificationIntervalMinutes,
      overtimeNotificationsEnabled:
          overtimeNotificationsEnabled ?? this.overtimeNotificationsEnabled,
      activityRemindersEnabled:
          activityRemindersEnabled ?? this.activityRemindersEnabled,
      customCategories: customCategories ?? this.customCategories,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (targetHours.present) {
      map['target_hours'] = Variable<int>(targetHours.value);
    }
    if (activityReminderMinutes.present) {
      map['activity_reminder_minutes'] =
          Variable<int>(activityReminderMinutes.value);
    }
    if (overtimeNotificationIntervalMinutes.present) {
      map['overtime_notification_interval_minutes'] =
          Variable<int>(overtimeNotificationIntervalMinutes.value);
    }
    if (overtimeNotificationsEnabled.present) {
      map['overtime_notifications_enabled'] =
          Variable<bool>(overtimeNotificationsEnabled.value);
    }
    if (activityRemindersEnabled.present) {
      map['activity_reminders_enabled'] =
          Variable<bool>(activityRemindersEnabled.value);
    }
    if (customCategories.present) {
      map['custom_categories'] = Variable<String>(customCategories.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AppConfigsCompanion(')
          ..write('id: $id, ')
          ..write('targetHours: $targetHours, ')
          ..write('activityReminderMinutes: $activityReminderMinutes, ')
          ..write(
              'overtimeNotificationIntervalMinutes: $overtimeNotificationIntervalMinutes, ')
          ..write(
              'overtimeNotificationsEnabled: $overtimeNotificationsEnabled, ')
          ..write('activityRemindersEnabled: $activityRemindersEnabled, ')
          ..write('customCategories: $customCategories')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $WorkSessionsTable workSessions = $WorkSessionsTable(this);
  late final $DistractionEntriesTable distractionEntries =
      $DistractionEntriesTable(this);
  late final $LearningGoalsTable learningGoals = $LearningGoalsTable(this);
  late final $LearningSessionsTable learningSessions =
      $LearningSessionsTable(this);
  late final $AppConfigsTable appConfigs = $AppConfigsTable(this);
  late final WorkSessionDao workSessionDao =
      WorkSessionDao(this as AppDatabase);
  late final DistractionDao distractionDao =
      DistractionDao(this as AppDatabase);
  late final LearningDao learningDao = LearningDao(this as AppDatabase);
  late final ConfigDao configDao = ConfigDao(this as AppDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        workSessions,
        distractionEntries,
        learningGoals,
        learningSessions,
        appConfigs
      ];
}

typedef $$WorkSessionsTableCreateCompanionBuilder = WorkSessionsCompanion
    Function({
  Value<int> id,
  required DateTime startTime,
  Value<DateTime?> endTime,
  Value<String> status,
  Value<int> grossSeconds,
  Value<int> netSeconds,
});
typedef $$WorkSessionsTableUpdateCompanionBuilder = WorkSessionsCompanion
    Function({
  Value<int> id,
  Value<DateTime> startTime,
  Value<DateTime?> endTime,
  Value<String> status,
  Value<int> grossSeconds,
  Value<int> netSeconds,
});

final class $$WorkSessionsTableReferences
    extends BaseReferences<_$AppDatabase, $WorkSessionsTable, WorkSessionRow> {
  $$WorkSessionsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$DistractionEntriesTable,
      List<DistractionEntryRow>> _distractionEntriesRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.distractionEntries,
          aliasName: $_aliasNameGenerator(
              db.workSessions.id, db.distractionEntries.sessionId));

  $$DistractionEntriesTableProcessedTableManager get distractionEntriesRefs {
    final manager =
        $$DistractionEntriesTableTableManager($_db, $_db.distractionEntries)
            .filter((f) => f.sessionId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache =
        $_typedResult.readTableOrNull(_distractionEntriesRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$WorkSessionsTableFilterComposer
    extends Composer<_$AppDatabase, $WorkSessionsTable> {
  $$WorkSessionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get startTime => $composableBuilder(
      column: $table.startTime, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get endTime => $composableBuilder(
      column: $table.endTime, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get grossSeconds => $composableBuilder(
      column: $table.grossSeconds, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get netSeconds => $composableBuilder(
      column: $table.netSeconds, builder: (column) => ColumnFilters(column));

  Expression<bool> distractionEntriesRefs(
      Expression<bool> Function($$DistractionEntriesTableFilterComposer f) f) {
    final $$DistractionEntriesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.distractionEntries,
        getReferencedColumn: (t) => t.sessionId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$DistractionEntriesTableFilterComposer(
              $db: $db,
              $table: $db.distractionEntries,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$WorkSessionsTableOrderingComposer
    extends Composer<_$AppDatabase, $WorkSessionsTable> {
  $$WorkSessionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get startTime => $composableBuilder(
      column: $table.startTime, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get endTime => $composableBuilder(
      column: $table.endTime, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get grossSeconds => $composableBuilder(
      column: $table.grossSeconds,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get netSeconds => $composableBuilder(
      column: $table.netSeconds, builder: (column) => ColumnOrderings(column));
}

class $$WorkSessionsTableAnnotationComposer
    extends Composer<_$AppDatabase, $WorkSessionsTable> {
  $$WorkSessionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get startTime =>
      $composableBuilder(column: $table.startTime, builder: (column) => column);

  GeneratedColumn<DateTime> get endTime =>
      $composableBuilder(column: $table.endTime, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<int> get grossSeconds => $composableBuilder(
      column: $table.grossSeconds, builder: (column) => column);

  GeneratedColumn<int> get netSeconds => $composableBuilder(
      column: $table.netSeconds, builder: (column) => column);

  Expression<T> distractionEntriesRefs<T extends Object>(
      Expression<T> Function($$DistractionEntriesTableAnnotationComposer a) f) {
    final $$DistractionEntriesTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.distractionEntries,
            getReferencedColumn: (t) => t.sessionId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$DistractionEntriesTableAnnotationComposer(
                  $db: $db,
                  $table: $db.distractionEntries,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }
}

class $$WorkSessionsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $WorkSessionsTable,
    WorkSessionRow,
    $$WorkSessionsTableFilterComposer,
    $$WorkSessionsTableOrderingComposer,
    $$WorkSessionsTableAnnotationComposer,
    $$WorkSessionsTableCreateCompanionBuilder,
    $$WorkSessionsTableUpdateCompanionBuilder,
    (WorkSessionRow, $$WorkSessionsTableReferences),
    WorkSessionRow,
    PrefetchHooks Function({bool distractionEntriesRefs})> {
  $$WorkSessionsTableTableManager(_$AppDatabase db, $WorkSessionsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$WorkSessionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$WorkSessionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$WorkSessionsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<DateTime> startTime = const Value.absent(),
            Value<DateTime?> endTime = const Value.absent(),
            Value<String> status = const Value.absent(),
            Value<int> grossSeconds = const Value.absent(),
            Value<int> netSeconds = const Value.absent(),
          }) =>
              WorkSessionsCompanion(
            id: id,
            startTime: startTime,
            endTime: endTime,
            status: status,
            grossSeconds: grossSeconds,
            netSeconds: netSeconds,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required DateTime startTime,
            Value<DateTime?> endTime = const Value.absent(),
            Value<String> status = const Value.absent(),
            Value<int> grossSeconds = const Value.absent(),
            Value<int> netSeconds = const Value.absent(),
          }) =>
              WorkSessionsCompanion.insert(
            id: id,
            startTime: startTime,
            endTime: endTime,
            status: status,
            grossSeconds: grossSeconds,
            netSeconds: netSeconds,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$WorkSessionsTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({distractionEntriesRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (distractionEntriesRefs) db.distractionEntries
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (distractionEntriesRefs)
                    await $_getPrefetchedData<WorkSessionRow,
                            $WorkSessionsTable, DistractionEntryRow>(
                        currentTable: table,
                        referencedTable: $$WorkSessionsTableReferences
                            ._distractionEntriesRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$WorkSessionsTableReferences(db, table, p0)
                                .distractionEntriesRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.sessionId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$WorkSessionsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $WorkSessionsTable,
    WorkSessionRow,
    $$WorkSessionsTableFilterComposer,
    $$WorkSessionsTableOrderingComposer,
    $$WorkSessionsTableAnnotationComposer,
    $$WorkSessionsTableCreateCompanionBuilder,
    $$WorkSessionsTableUpdateCompanionBuilder,
    (WorkSessionRow, $$WorkSessionsTableReferences),
    WorkSessionRow,
    PrefetchHooks Function({bool distractionEntriesRefs})>;
typedef $$DistractionEntriesTableCreateCompanionBuilder
    = DistractionEntriesCompanion Function({
  Value<int> id,
  required int sessionId,
  required String category,
  required int durationSeconds,
  required DateTime timestamp,
});
typedef $$DistractionEntriesTableUpdateCompanionBuilder
    = DistractionEntriesCompanion Function({
  Value<int> id,
  Value<int> sessionId,
  Value<String> category,
  Value<int> durationSeconds,
  Value<DateTime> timestamp,
});

final class $$DistractionEntriesTableReferences extends BaseReferences<
    _$AppDatabase, $DistractionEntriesTable, DistractionEntryRow> {
  $$DistractionEntriesTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $WorkSessionsTable _sessionIdTable(_$AppDatabase db) =>
      db.workSessions.createAlias($_aliasNameGenerator(
          db.distractionEntries.sessionId, db.workSessions.id));

  $$WorkSessionsTableProcessedTableManager get sessionId {
    final $_column = $_itemColumn<int>('session_id')!;

    final manager = $$WorkSessionsTableTableManager($_db, $_db.workSessions)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_sessionIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$DistractionEntriesTableFilterComposer
    extends Composer<_$AppDatabase, $DistractionEntriesTable> {
  $$DistractionEntriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get category => $composableBuilder(
      column: $table.category, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get durationSeconds => $composableBuilder(
      column: $table.durationSeconds,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get timestamp => $composableBuilder(
      column: $table.timestamp, builder: (column) => ColumnFilters(column));

  $$WorkSessionsTableFilterComposer get sessionId {
    final $$WorkSessionsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.sessionId,
        referencedTable: $db.workSessions,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$WorkSessionsTableFilterComposer(
              $db: $db,
              $table: $db.workSessions,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$DistractionEntriesTableOrderingComposer
    extends Composer<_$AppDatabase, $DistractionEntriesTable> {
  $$DistractionEntriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get category => $composableBuilder(
      column: $table.category, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get durationSeconds => $composableBuilder(
      column: $table.durationSeconds,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get timestamp => $composableBuilder(
      column: $table.timestamp, builder: (column) => ColumnOrderings(column));

  $$WorkSessionsTableOrderingComposer get sessionId {
    final $$WorkSessionsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.sessionId,
        referencedTable: $db.workSessions,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$WorkSessionsTableOrderingComposer(
              $db: $db,
              $table: $db.workSessions,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$DistractionEntriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $DistractionEntriesTable> {
  $$DistractionEntriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  GeneratedColumn<int> get durationSeconds => $composableBuilder(
      column: $table.durationSeconds, builder: (column) => column);

  GeneratedColumn<DateTime> get timestamp =>
      $composableBuilder(column: $table.timestamp, builder: (column) => column);

  $$WorkSessionsTableAnnotationComposer get sessionId {
    final $$WorkSessionsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.sessionId,
        referencedTable: $db.workSessions,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$WorkSessionsTableAnnotationComposer(
              $db: $db,
              $table: $db.workSessions,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$DistractionEntriesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $DistractionEntriesTable,
    DistractionEntryRow,
    $$DistractionEntriesTableFilterComposer,
    $$DistractionEntriesTableOrderingComposer,
    $$DistractionEntriesTableAnnotationComposer,
    $$DistractionEntriesTableCreateCompanionBuilder,
    $$DistractionEntriesTableUpdateCompanionBuilder,
    (DistractionEntryRow, $$DistractionEntriesTableReferences),
    DistractionEntryRow,
    PrefetchHooks Function({bool sessionId})> {
  $$DistractionEntriesTableTableManager(
      _$AppDatabase db, $DistractionEntriesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DistractionEntriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DistractionEntriesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DistractionEntriesTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> sessionId = const Value.absent(),
            Value<String> category = const Value.absent(),
            Value<int> durationSeconds = const Value.absent(),
            Value<DateTime> timestamp = const Value.absent(),
          }) =>
              DistractionEntriesCompanion(
            id: id,
            sessionId: sessionId,
            category: category,
            durationSeconds: durationSeconds,
            timestamp: timestamp,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int sessionId,
            required String category,
            required int durationSeconds,
            required DateTime timestamp,
          }) =>
              DistractionEntriesCompanion.insert(
            id: id,
            sessionId: sessionId,
            category: category,
            durationSeconds: durationSeconds,
            timestamp: timestamp,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$DistractionEntriesTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({sessionId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (sessionId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.sessionId,
                    referencedTable:
                        $$DistractionEntriesTableReferences._sessionIdTable(db),
                    referencedColumn: $$DistractionEntriesTableReferences
                        ._sessionIdTable(db)
                        .id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$DistractionEntriesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $DistractionEntriesTable,
    DistractionEntryRow,
    $$DistractionEntriesTableFilterComposer,
    $$DistractionEntriesTableOrderingComposer,
    $$DistractionEntriesTableAnnotationComposer,
    $$DistractionEntriesTableCreateCompanionBuilder,
    $$DistractionEntriesTableUpdateCompanionBuilder,
    (DistractionEntryRow, $$DistractionEntriesTableReferences),
    DistractionEntryRow,
    PrefetchHooks Function({bool sessionId})>;
typedef $$LearningGoalsTableCreateCompanionBuilder = LearningGoalsCompanion
    Function({
  Value<int> id,
  required String name,
  required int targetMinutes,
  Value<DateTime?> deadline,
  Value<String?> description,
  required DateTime createdAt,
  Value<bool> isActive,
});
typedef $$LearningGoalsTableUpdateCompanionBuilder = LearningGoalsCompanion
    Function({
  Value<int> id,
  Value<String> name,
  Value<int> targetMinutes,
  Value<DateTime?> deadline,
  Value<String?> description,
  Value<DateTime> createdAt,
  Value<bool> isActive,
});

final class $$LearningGoalsTableReferences extends BaseReferences<_$AppDatabase,
    $LearningGoalsTable, LearningGoalRow> {
  $$LearningGoalsTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$LearningSessionsTable, List<LearningSessionRow>>
      _learningSessionsRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.learningSessions,
              aliasName: $_aliasNameGenerator(
                  db.learningGoals.id, db.learningSessions.goalId));

  $$LearningSessionsTableProcessedTableManager get learningSessionsRefs {
    final manager =
        $$LearningSessionsTableTableManager($_db, $_db.learningSessions)
            .filter((f) => f.goalId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache =
        $_typedResult.readTableOrNull(_learningSessionsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$LearningGoalsTableFilterComposer
    extends Composer<_$AppDatabase, $LearningGoalsTable> {
  $$LearningGoalsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get targetMinutes => $composableBuilder(
      column: $table.targetMinutes, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get deadline => $composableBuilder(
      column: $table.deadline, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isActive => $composableBuilder(
      column: $table.isActive, builder: (column) => ColumnFilters(column));

  Expression<bool> learningSessionsRefs(
      Expression<bool> Function($$LearningSessionsTableFilterComposer f) f) {
    final $$LearningSessionsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.learningSessions,
        getReferencedColumn: (t) => t.goalId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$LearningSessionsTableFilterComposer(
              $db: $db,
              $table: $db.learningSessions,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$LearningGoalsTableOrderingComposer
    extends Composer<_$AppDatabase, $LearningGoalsTable> {
  $$LearningGoalsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get targetMinutes => $composableBuilder(
      column: $table.targetMinutes,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get deadline => $composableBuilder(
      column: $table.deadline, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isActive => $composableBuilder(
      column: $table.isActive, builder: (column) => ColumnOrderings(column));
}

class $$LearningGoalsTableAnnotationComposer
    extends Composer<_$AppDatabase, $LearningGoalsTable> {
  $$LearningGoalsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<int> get targetMinutes => $composableBuilder(
      column: $table.targetMinutes, builder: (column) => column);

  GeneratedColumn<DateTime> get deadline =>
      $composableBuilder(column: $table.deadline, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<bool> get isActive =>
      $composableBuilder(column: $table.isActive, builder: (column) => column);

  Expression<T> learningSessionsRefs<T extends Object>(
      Expression<T> Function($$LearningSessionsTableAnnotationComposer a) f) {
    final $$LearningSessionsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.learningSessions,
        getReferencedColumn: (t) => t.goalId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$LearningSessionsTableAnnotationComposer(
              $db: $db,
              $table: $db.learningSessions,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$LearningGoalsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $LearningGoalsTable,
    LearningGoalRow,
    $$LearningGoalsTableFilterComposer,
    $$LearningGoalsTableOrderingComposer,
    $$LearningGoalsTableAnnotationComposer,
    $$LearningGoalsTableCreateCompanionBuilder,
    $$LearningGoalsTableUpdateCompanionBuilder,
    (LearningGoalRow, $$LearningGoalsTableReferences),
    LearningGoalRow,
    PrefetchHooks Function({bool learningSessionsRefs})> {
  $$LearningGoalsTableTableManager(_$AppDatabase db, $LearningGoalsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LearningGoalsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$LearningGoalsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$LearningGoalsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<int> targetMinutes = const Value.absent(),
            Value<DateTime?> deadline = const Value.absent(),
            Value<String?> description = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<bool> isActive = const Value.absent(),
          }) =>
              LearningGoalsCompanion(
            id: id,
            name: name,
            targetMinutes: targetMinutes,
            deadline: deadline,
            description: description,
            createdAt: createdAt,
            isActive: isActive,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
            required int targetMinutes,
            Value<DateTime?> deadline = const Value.absent(),
            Value<String?> description = const Value.absent(),
            required DateTime createdAt,
            Value<bool> isActive = const Value.absent(),
          }) =>
              LearningGoalsCompanion.insert(
            id: id,
            name: name,
            targetMinutes: targetMinutes,
            deadline: deadline,
            description: description,
            createdAt: createdAt,
            isActive: isActive,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$LearningGoalsTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({learningSessionsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (learningSessionsRefs) db.learningSessions
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (learningSessionsRefs)
                    await $_getPrefetchedData<LearningGoalRow,
                            $LearningGoalsTable, LearningSessionRow>(
                        currentTable: table,
                        referencedTable: $$LearningGoalsTableReferences
                            ._learningSessionsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$LearningGoalsTableReferences(db, table, p0)
                                .learningSessionsRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.goalId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$LearningGoalsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $LearningGoalsTable,
    LearningGoalRow,
    $$LearningGoalsTableFilterComposer,
    $$LearningGoalsTableOrderingComposer,
    $$LearningGoalsTableAnnotationComposer,
    $$LearningGoalsTableCreateCompanionBuilder,
    $$LearningGoalsTableUpdateCompanionBuilder,
    (LearningGoalRow, $$LearningGoalsTableReferences),
    LearningGoalRow,
    PrefetchHooks Function({bool learningSessionsRefs})>;
typedef $$LearningSessionsTableCreateCompanionBuilder
    = LearningSessionsCompanion Function({
  Value<int> id,
  required int goalId,
  required DateTime startTime,
  Value<DateTime?> endTime,
  Value<int> durationSeconds,
  Value<String> status,
});
typedef $$LearningSessionsTableUpdateCompanionBuilder
    = LearningSessionsCompanion Function({
  Value<int> id,
  Value<int> goalId,
  Value<DateTime> startTime,
  Value<DateTime?> endTime,
  Value<int> durationSeconds,
  Value<String> status,
});

final class $$LearningSessionsTableReferences extends BaseReferences<
    _$AppDatabase, $LearningSessionsTable, LearningSessionRow> {
  $$LearningSessionsTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $LearningGoalsTable _goalIdTable(_$AppDatabase db) =>
      db.learningGoals.createAlias($_aliasNameGenerator(
          db.learningSessions.goalId, db.learningGoals.id));

  $$LearningGoalsTableProcessedTableManager get goalId {
    final $_column = $_itemColumn<int>('goal_id')!;

    final manager = $$LearningGoalsTableTableManager($_db, $_db.learningGoals)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_goalIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$LearningSessionsTableFilterComposer
    extends Composer<_$AppDatabase, $LearningSessionsTable> {
  $$LearningSessionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get startTime => $composableBuilder(
      column: $table.startTime, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get endTime => $composableBuilder(
      column: $table.endTime, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get durationSeconds => $composableBuilder(
      column: $table.durationSeconds,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnFilters(column));

  $$LearningGoalsTableFilterComposer get goalId {
    final $$LearningGoalsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.goalId,
        referencedTable: $db.learningGoals,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$LearningGoalsTableFilterComposer(
              $db: $db,
              $table: $db.learningGoals,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$LearningSessionsTableOrderingComposer
    extends Composer<_$AppDatabase, $LearningSessionsTable> {
  $$LearningSessionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get startTime => $composableBuilder(
      column: $table.startTime, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get endTime => $composableBuilder(
      column: $table.endTime, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get durationSeconds => $composableBuilder(
      column: $table.durationSeconds,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnOrderings(column));

  $$LearningGoalsTableOrderingComposer get goalId {
    final $$LearningGoalsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.goalId,
        referencedTable: $db.learningGoals,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$LearningGoalsTableOrderingComposer(
              $db: $db,
              $table: $db.learningGoals,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$LearningSessionsTableAnnotationComposer
    extends Composer<_$AppDatabase, $LearningSessionsTable> {
  $$LearningSessionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get startTime =>
      $composableBuilder(column: $table.startTime, builder: (column) => column);

  GeneratedColumn<DateTime> get endTime =>
      $composableBuilder(column: $table.endTime, builder: (column) => column);

  GeneratedColumn<int> get durationSeconds => $composableBuilder(
      column: $table.durationSeconds, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  $$LearningGoalsTableAnnotationComposer get goalId {
    final $$LearningGoalsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.goalId,
        referencedTable: $db.learningGoals,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$LearningGoalsTableAnnotationComposer(
              $db: $db,
              $table: $db.learningGoals,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$LearningSessionsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $LearningSessionsTable,
    LearningSessionRow,
    $$LearningSessionsTableFilterComposer,
    $$LearningSessionsTableOrderingComposer,
    $$LearningSessionsTableAnnotationComposer,
    $$LearningSessionsTableCreateCompanionBuilder,
    $$LearningSessionsTableUpdateCompanionBuilder,
    (LearningSessionRow, $$LearningSessionsTableReferences),
    LearningSessionRow,
    PrefetchHooks Function({bool goalId})> {
  $$LearningSessionsTableTableManager(
      _$AppDatabase db, $LearningSessionsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LearningSessionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$LearningSessionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$LearningSessionsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> goalId = const Value.absent(),
            Value<DateTime> startTime = const Value.absent(),
            Value<DateTime?> endTime = const Value.absent(),
            Value<int> durationSeconds = const Value.absent(),
            Value<String> status = const Value.absent(),
          }) =>
              LearningSessionsCompanion(
            id: id,
            goalId: goalId,
            startTime: startTime,
            endTime: endTime,
            durationSeconds: durationSeconds,
            status: status,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int goalId,
            required DateTime startTime,
            Value<DateTime?> endTime = const Value.absent(),
            Value<int> durationSeconds = const Value.absent(),
            Value<String> status = const Value.absent(),
          }) =>
              LearningSessionsCompanion.insert(
            id: id,
            goalId: goalId,
            startTime: startTime,
            endTime: endTime,
            durationSeconds: durationSeconds,
            status: status,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$LearningSessionsTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({goalId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (goalId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.goalId,
                    referencedTable:
                        $$LearningSessionsTableReferences._goalIdTable(db),
                    referencedColumn:
                        $$LearningSessionsTableReferences._goalIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$LearningSessionsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $LearningSessionsTable,
    LearningSessionRow,
    $$LearningSessionsTableFilterComposer,
    $$LearningSessionsTableOrderingComposer,
    $$LearningSessionsTableAnnotationComposer,
    $$LearningSessionsTableCreateCompanionBuilder,
    $$LearningSessionsTableUpdateCompanionBuilder,
    (LearningSessionRow, $$LearningSessionsTableReferences),
    LearningSessionRow,
    PrefetchHooks Function({bool goalId})>;
typedef $$AppConfigsTableCreateCompanionBuilder = AppConfigsCompanion Function({
  Value<int> id,
  Value<int> targetHours,
  Value<int> activityReminderMinutes,
  Value<int> overtimeNotificationIntervalMinutes,
  Value<bool> overtimeNotificationsEnabled,
  Value<bool> activityRemindersEnabled,
  Value<String?> customCategories,
});
typedef $$AppConfigsTableUpdateCompanionBuilder = AppConfigsCompanion Function({
  Value<int> id,
  Value<int> targetHours,
  Value<int> activityReminderMinutes,
  Value<int> overtimeNotificationIntervalMinutes,
  Value<bool> overtimeNotificationsEnabled,
  Value<bool> activityRemindersEnabled,
  Value<String?> customCategories,
});

class $$AppConfigsTableFilterComposer
    extends Composer<_$AppDatabase, $AppConfigsTable> {
  $$AppConfigsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get targetHours => $composableBuilder(
      column: $table.targetHours, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get activityReminderMinutes => $composableBuilder(
      column: $table.activityReminderMinutes,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get overtimeNotificationIntervalMinutes =>
      $composableBuilder(
          column: $table.overtimeNotificationIntervalMinutes,
          builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get overtimeNotificationsEnabled => $composableBuilder(
      column: $table.overtimeNotificationsEnabled,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get activityRemindersEnabled => $composableBuilder(
      column: $table.activityRemindersEnabled,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get customCategories => $composableBuilder(
      column: $table.customCategories,
      builder: (column) => ColumnFilters(column));
}

class $$AppConfigsTableOrderingComposer
    extends Composer<_$AppDatabase, $AppConfigsTable> {
  $$AppConfigsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get targetHours => $composableBuilder(
      column: $table.targetHours, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get activityReminderMinutes => $composableBuilder(
      column: $table.activityReminderMinutes,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get overtimeNotificationIntervalMinutes =>
      $composableBuilder(
          column: $table.overtimeNotificationIntervalMinutes,
          builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get overtimeNotificationsEnabled => $composableBuilder(
      column: $table.overtimeNotificationsEnabled,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get activityRemindersEnabled => $composableBuilder(
      column: $table.activityRemindersEnabled,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get customCategories => $composableBuilder(
      column: $table.customCategories,
      builder: (column) => ColumnOrderings(column));
}

class $$AppConfigsTableAnnotationComposer
    extends Composer<_$AppDatabase, $AppConfigsTable> {
  $$AppConfigsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get targetHours => $composableBuilder(
      column: $table.targetHours, builder: (column) => column);

  GeneratedColumn<int> get activityReminderMinutes => $composableBuilder(
      column: $table.activityReminderMinutes, builder: (column) => column);

  GeneratedColumn<int> get overtimeNotificationIntervalMinutes =>
      $composableBuilder(
          column: $table.overtimeNotificationIntervalMinutes,
          builder: (column) => column);

  GeneratedColumn<bool> get overtimeNotificationsEnabled => $composableBuilder(
      column: $table.overtimeNotificationsEnabled, builder: (column) => column);

  GeneratedColumn<bool> get activityRemindersEnabled => $composableBuilder(
      column: $table.activityRemindersEnabled, builder: (column) => column);

  GeneratedColumn<String> get customCategories => $composableBuilder(
      column: $table.customCategories, builder: (column) => column);
}

class $$AppConfigsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $AppConfigsTable,
    AppConfigRow,
    $$AppConfigsTableFilterComposer,
    $$AppConfigsTableOrderingComposer,
    $$AppConfigsTableAnnotationComposer,
    $$AppConfigsTableCreateCompanionBuilder,
    $$AppConfigsTableUpdateCompanionBuilder,
    (
      AppConfigRow,
      BaseReferences<_$AppDatabase, $AppConfigsTable, AppConfigRow>
    ),
    AppConfigRow,
    PrefetchHooks Function()> {
  $$AppConfigsTableTableManager(_$AppDatabase db, $AppConfigsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AppConfigsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AppConfigsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AppConfigsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> targetHours = const Value.absent(),
            Value<int> activityReminderMinutes = const Value.absent(),
            Value<int> overtimeNotificationIntervalMinutes =
                const Value.absent(),
            Value<bool> overtimeNotificationsEnabled = const Value.absent(),
            Value<bool> activityRemindersEnabled = const Value.absent(),
            Value<String?> customCategories = const Value.absent(),
          }) =>
              AppConfigsCompanion(
            id: id,
            targetHours: targetHours,
            activityReminderMinutes: activityReminderMinutes,
            overtimeNotificationIntervalMinutes:
                overtimeNotificationIntervalMinutes,
            overtimeNotificationsEnabled: overtimeNotificationsEnabled,
            activityRemindersEnabled: activityRemindersEnabled,
            customCategories: customCategories,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> targetHours = const Value.absent(),
            Value<int> activityReminderMinutes = const Value.absent(),
            Value<int> overtimeNotificationIntervalMinutes =
                const Value.absent(),
            Value<bool> overtimeNotificationsEnabled = const Value.absent(),
            Value<bool> activityRemindersEnabled = const Value.absent(),
            Value<String?> customCategories = const Value.absent(),
          }) =>
              AppConfigsCompanion.insert(
            id: id,
            targetHours: targetHours,
            activityReminderMinutes: activityReminderMinutes,
            overtimeNotificationIntervalMinutes:
                overtimeNotificationIntervalMinutes,
            overtimeNotificationsEnabled: overtimeNotificationsEnabled,
            activityRemindersEnabled: activityRemindersEnabled,
            customCategories: customCategories,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$AppConfigsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $AppConfigsTable,
    AppConfigRow,
    $$AppConfigsTableFilterComposer,
    $$AppConfigsTableOrderingComposer,
    $$AppConfigsTableAnnotationComposer,
    $$AppConfigsTableCreateCompanionBuilder,
    $$AppConfigsTableUpdateCompanionBuilder,
    (
      AppConfigRow,
      BaseReferences<_$AppDatabase, $AppConfigsTable, AppConfigRow>
    ),
    AppConfigRow,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$WorkSessionsTableTableManager get workSessions =>
      $$WorkSessionsTableTableManager(_db, _db.workSessions);
  $$DistractionEntriesTableTableManager get distractionEntries =>
      $$DistractionEntriesTableTableManager(_db, _db.distractionEntries);
  $$LearningGoalsTableTableManager get learningGoals =>
      $$LearningGoalsTableTableManager(_db, _db.learningGoals);
  $$LearningSessionsTableTableManager get learningSessions =>
      $$LearningSessionsTableTableManager(_db, _db.learningSessions);
  $$AppConfigsTableTableManager get appConfigs =>
      $$AppConfigsTableTableManager(_db, _db.appConfigs);
}
