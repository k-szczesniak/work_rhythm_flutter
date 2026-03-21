import 'package:drift/drift.dart';

import '../../domain/entities/work_session.dart';
import '../../domain/repositories/i_work_session_repository.dart';
import '../datasources/daos/work_session_dao.dart';
import '../datasources/database.dart';

class WorkSessionRepositoryImpl implements IWorkSessionRepository {

    WorkSessionRepositoryImpl(this._dao);

    final WorkSessionDao _dao;

    @override
    Future<WorkSession> startSession() async {
        final row = await _dao.insertSession(
            WorkSessionsCompanion.insert(
                startTime: DateTime.now(),
                status: const Value('RUNNING'),
            ),
        );
        return _toEntity(row);
    }

    @override
    Future<WorkSession> pauseSession(int sessionId) async {
        await _dao.updateSession(
            WorkSessionsCompanion(
                id: Value(sessionId),
                status: const Value('PAUSED'),
            ),
        );
        final row = await _dao.findById(sessionId);
        if (row == null) {
            throw StateError('Session $sessionId not found');
        }
        return _toEntity(row);
    }

    @override
    Future<WorkSession> resumeSession(int sessionId) async {
        await _dao.updateSession(
            WorkSessionsCompanion(
                id: Value(sessionId),
                status: const Value('RUNNING'),
            ),
        );
        final row = await _dao.findById(sessionId);
        if (row == null) {
            throw StateError('Session $sessionId not found');
        }
        return _toEntity(row);
    }

    @override
    Future<WorkSession> stopSession(int sessionId) async {
        await _dao.updateSession(
            WorkSessionsCompanion(
                id: Value(sessionId),
                status: const Value('STOPPED'),
                endTime: Value(DateTime.now()),
            ),
        );
        final row = await _dao.findById(sessionId);
        if (row == null) {
            throw StateError('Session $sessionId not found');
        }
        return _toEntity(row);
    }

    @override
    Future<WorkSession?> getActiveSession() async {
        final row = await _dao.findActiveSession();
        return row != null ? _toEntity(row) : null;
    }

    @override
    Future<List<WorkSession>> getSessionsForDate(DateTime date) async {
        final rows = await _dao.findSessionsForDate(date);
        return rows.map(_toEntity).toList();
    }

    @override
    Future<void> updateNetSeconds(int sessionId, int netSeconds) {
        return _dao.updateNetSeconds(sessionId, netSeconds);
    }

    WorkSession _toEntity(WorkSessionRow row) => WorkSession(
        id: row.id,
        startTime: row.startTime,
        endTime: row.endTime,
        status: _parseStatus(row.status),
        grossSeconds: row.grossSeconds,
        netSeconds: row.netSeconds,
    );

    WorkSessionStatus _parseStatus(String value) {
        switch (value) {
            case 'RUNNING':
                return WorkSessionStatus.running;
            case 'PAUSED':
                return WorkSessionStatus.paused;
            default:
                return WorkSessionStatus.stopped;
        }
    }
}
