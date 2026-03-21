import 'package:drift/drift.dart';

import '../database.dart';
import '../tables.dart';

part 'distraction_dao.g.dart';

@DriftAccessor(tables: [DistractionEntries, WorkSessions])
class DistractionDao extends DatabaseAccessor<AppDatabase>
        with _$DistractionDaoMixin {

    DistractionDao(super.db);

    Future<DistractionEntryRow> insertDistraction(DistractionEntriesCompanion entry) =>
            into(distractionEntries).insertReturning(entry);

    Future<List<DistractionEntryRow>> findBySessionId(int sessionId) {
        return (select(distractionEntries)
            ..where((t) => t.sessionId.equals(sessionId)))
                .get();
    }

    Future<List<DistractionEntryRow>> findByDate(DateTime date) {
        final startOfDay = DateTime(date.year, date.month, date.day);
        final endOfDay = startOfDay.add(const Duration(days: 1));
        return (select(distractionEntries)
            ..where(
                (t) => t.timestamp.isBetweenValues(startOfDay, endOfDay),
            ))
                .get();
    }

    Future<int> sumDurationBySessionId(int sessionId) async {
        final query = selectOnly(distractionEntries)
            ..addColumns([distractionEntries.durationSeconds.sum()])
            ..where(distractionEntries.sessionId.equals(sessionId));
        final row = await query.getSingleOrNull();
        return row?.read(distractionEntries.durationSeconds.sum()) ?? 0;
    }
}
