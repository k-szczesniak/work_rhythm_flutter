import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import 'daos/config_dao.dart';
import 'daos/distraction_dao.dart';
import 'daos/learning_dao.dart';
import 'daos/work_session_dao.dart';
import 'tables.dart';

part 'database.g.dart';

@DriftDatabase(
    tables: [
        WorkSessions,
        DistractionEntries,
        LearningGoals,
        LearningSessions,
        AppConfigs,
    ],
    daos: [
        WorkSessionDao,
        DistractionDao,
        LearningDao,
        ConfigDao,
    ],
)
class AppDatabase extends _$AppDatabase {

    AppDatabase() : super(_openConnection());

    AppDatabase.forTesting(super.e);

    @override
    int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
    return LazyDatabase(() async {
        final dir = await getApplicationDocumentsDirectory();
        final file = File(p.join(dir.path, 'work_rhythm.db'));
        return NativeDatabase.createInBackground(file);
    });
}
