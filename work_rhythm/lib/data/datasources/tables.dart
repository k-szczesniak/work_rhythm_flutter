import 'package:drift/drift.dart';

@DataClassName('WorkSessionRow')
class WorkSessions extends Table {

    IntColumn get id => integer().autoIncrement()();

    DateTimeColumn get startTime => dateTime()();

    DateTimeColumn get endTime => dateTime().nullable()();

    // status: RUNNING | PAUSED | STOPPED
    TextColumn get status => text().withDefault(const Constant('RUNNING'))();

    IntColumn get grossSeconds => integer().withDefault(const Constant(0))();

    IntColumn get netSeconds => integer().withDefault(const Constant(0))();
}

@DataClassName('DistractionEntryRow')
class DistractionEntries extends Table {

    IntColumn get id => integer().autoIncrement()();

    IntColumn get sessionId => integer().references(WorkSessions, #id)();

    // category: HOME | CHILD | PHONE | SHOPPING | OTHER
    TextColumn get category => text()();

    IntColumn get durationSeconds => integer()();

    DateTimeColumn get timestamp => dateTime()();
}

@DataClassName('LearningGoalRow')
class LearningGoals extends Table {

    IntColumn get id => integer().autoIncrement()();

    TextColumn get name => text()();

    IntColumn get targetMinutes => integer()();

    DateTimeColumn get deadline => dateTime().nullable()();

    TextColumn get description => text().nullable()();

    DateTimeColumn get createdAt => dateTime()();

    BoolColumn get isActive => boolean().withDefault(const Constant(true))();
}

@DataClassName('LearningSessionRow')
class LearningSessions extends Table {

    IntColumn get id => integer().autoIncrement()();

    IntColumn get goalId => integer().references(LearningGoals, #id)();

    DateTimeColumn get startTime => dateTime()();

    DateTimeColumn get endTime => dateTime().nullable()();

    IntColumn get durationSeconds => integer().withDefault(const Constant(0))();

    // status: RUNNING | STOPPED
    TextColumn get status => text().withDefault(const Constant('RUNNING'))();
}

@DataClassName('AppConfigRow')
class AppConfigs extends Table {

    IntColumn get id => integer().autoIncrement()();

    IntColumn get targetHours => integer().withDefault(const Constant(8))();

    IntColumn get activityReminderMinutes => integer().withDefault(const Constant(90))();

    IntColumn get overtimeNotificationIntervalMinutes => integer().withDefault(const Constant(30))();

    BoolColumn get overtimeNotificationsEnabled => boolean().withDefault(const Constant(true))();

    BoolColumn get activityRemindersEnabled => boolean().withDefault(const Constant(true))();

    // customCategories: JSON array e.g. ["Spacer", "Gotowanie"]
    TextColumn get customCategories => text().nullable()();
}
