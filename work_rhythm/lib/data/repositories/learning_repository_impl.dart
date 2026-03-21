import 'package:drift/drift.dart';

import '../../domain/entities/learning_goal.dart';
import '../../domain/entities/learning_session.dart';
import '../../domain/repositories/i_learning_repository.dart';
import '../datasources/daos/learning_dao.dart';
import '../datasources/database.dart';

class LearningRepositoryImpl implements ILearningRepository {

    LearningRepositoryImpl(this._dao);

    final LearningDao _dao;

    @override
    Future<List<LearningGoal>> getActiveGoals() async {
        final rows = await _dao.findActiveGoals();
        final goals = <LearningGoal>[];
        for (var row in rows) {
            goals.add(await _toGoalEntity(row));
        }
        return goals;
    }

    @override
    Future<LearningGoal> createGoal({
        required String name,
        required int targetMinutes,
        DateTime? deadline,
        String? description,
    }) async {
        final row = await _dao.insertGoal(
            LearningGoalsCompanion.insert(
                name: name,
                targetMinutes: targetMinutes,
                createdAt: DateTime.now(),
                deadline: Value(deadline),
                description: Value(description),
            ),
        );
        return _toGoalEntity(row);
    }

    @override
    Future<LearningSession> startSession(int goalId) async {
        final row = await _dao.insertSession(
            LearningSessionsCompanion.insert(
                goalId: goalId,
                startTime: DateTime.now(),
            ),
        );
        return _toSessionEntity(row);
    }

    @override
    Future<LearningSession> stopSession(int sessionId) async {
        final existing = await _dao.findSessionById(sessionId);
        if (existing == null) {
            throw StateError('Learning session $sessionId not found');
        }
        final endTime = DateTime.now();
        final durationSeconds = endTime.difference(existing.startTime).inSeconds;
        await _dao.updateSession(
            LearningSessionsCompanion(
                id: Value(sessionId),
                endTime: Value(endTime),
                durationSeconds: Value(durationSeconds),
                status: const Value('STOPPED'),
            ),
        );
        final updated = await _dao.findSessionById(sessionId);
        return _toSessionEntity(updated!);
    }

    @override
    Future<LearningSession?> getActiveSession() async {
        final row = await _dao.findActiveSession();
        return row != null ? _toSessionEntity(row) : null;
    }

    @override
    Future<int> getCompletedMinutesForGoal(int goalId) {
        return _dao.sumCompletedMinutesByGoalId(goalId);
    }

    Future<LearningGoal> _toGoalEntity(LearningGoalRow row) async {
        final completedMinutes = await _dao.sumCompletedMinutesByGoalId(row.id);
        return LearningGoal(
            id: row.id,
            name: row.name,
            targetMinutes: row.targetMinutes,
            deadline: row.deadline,
            description: row.description,
            createdAt: row.createdAt,
            isActive: row.isActive,
            completedMinutes: completedMinutes,
        );
    }

    LearningSession _toSessionEntity(LearningSessionRow row) => LearningSession(
        id: row.id,
        goalId: row.goalId,
        startTime: row.startTime,
        endTime: row.endTime,
        durationSeconds: row.durationSeconds,
        status: row.status == 'RUNNING'
                ? LearningSessionStatus.running
                : LearningSessionStatus.stopped,
    );
}
