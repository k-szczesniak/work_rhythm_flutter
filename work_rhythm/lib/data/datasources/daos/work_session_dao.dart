import 'package:drift/drift.dart';

import '../database.dart';
import '../tables.dart';

part 'work_session_dao.g.dart';

@DriftAccessor(tables: [WorkSessions])
class WorkSessionDao extends DatabaseAccessor<AppDatabase>
        with _$WorkSessionDaoMixin {

    WorkSessionDao(super.db);

    Future<WorkSessionRow> insertSession(WorkSessionsCompanion entry) =>
            into(workSessions).insertReturning(entry);

    Future<bool> updateSession(WorkSessionsCompanion entry) =>
            update(workSessions).replace(entry);

    Future<WorkSessionRow?> findActiveSession() {
        return (select(workSessions)
            ..where((t) => t.status.isIn(['RUNNING', 'PAUSED']))
            ..limit(1))
                .getSingleOrNull();
    }

    Future<List<WorkSessionRow>> findSessionsForDate(DateTime date) {
        final startOfDay = DateTime(date.year, date.month, date.day);
        final endOfDay = startOfDay.add(const Duration(days: 1));
        return (select(workSessions)
            ..where(
                (t) => t.startTime.isBetweenValues(startOfDay, endOfDay),
            ))
                .get();
    }

    Future<WorkSessionRow?> findById(int id) {
        return (select(workSessions)..where((t) => t.id.equals(id)))
                .getSingleOrNull();
    }

    Future<int> updateNetSeconds(int sessionId, int netSeconds) {
        return (update(workSessions)..where((t) => t.id.equals(sessionId)))
                .write(WorkSessionsCompanion(netSeconds: Value(netSeconds)));
    }
}
