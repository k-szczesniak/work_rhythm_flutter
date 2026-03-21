import '../../domain/entities/distraction_entry.dart';
import '../../domain/repositories/i_distraction_repository.dart';
import '../datasources/daos/distraction_dao.dart';
import '../datasources/database.dart';

class DistractionRepositoryImpl implements IDistractionRepository {

    DistractionRepositoryImpl(this._dao);

    final DistractionDao _dao;

    @override
    Future<DistractionEntry> addDistraction({
        required int sessionId,
        required DistractionCategory category,
        required int durationSeconds,
    }) async {
        final row = await _dao.insertDistraction(
            DistractionEntriesCompanion.insert(
                sessionId: sessionId,
                category: category.name.toUpperCase(),
                durationSeconds: durationSeconds,
                timestamp: DateTime.now(),
            ),
        );
        return _toEntity(row);
    }

    @override
    Future<List<DistractionEntry>> getDistractionsForSession(int sessionId) async {
        final rows = await _dao.findBySessionId(sessionId);
        return rows.map(_toEntity).toList();
    }

    @override
    Future<List<DistractionEntry>> getDistractionsForDate(DateTime date) async {
        final rows = await _dao.findByDate(date);
        return rows.map(_toEntity).toList();
    }

    @override
    Future<int> getTotalDistractionSeconds(int sessionId) {
        return _dao.sumDurationBySessionId(sessionId);
    }

    DistractionEntry _toEntity(DistractionEntryRow row) => DistractionEntry(
        id: row.id,
        sessionId: row.sessionId,
        category: DistractionCategory.fromString(row.category),
        durationSeconds: row.durationSeconds,
        timestamp: row.timestamp,
    );
}
