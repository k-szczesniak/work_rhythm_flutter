import 'package:drift/drift.dart';

import '../database.dart';
import '../tables.dart';

part 'learning_dao.g.dart';

@DriftAccessor(tables: [LearningGoals, LearningSessions])
class LearningDao extends DatabaseAccessor<AppDatabase>
        with _$LearningDaoMixin {

    LearningDao(super.db);

    Future<LearningGoalRow> insertGoal(LearningGoalsCompanion entry) =>
            into(learningGoals).insertReturning(entry);

    Future<List<LearningGoalRow>> findActiveGoals() {
        return (select(learningGoals)
            ..where((t) => t.isActive.equals(true)))
                .get();
    }

    Future<LearningGoalRow?> findGoalById(int id) {
        return (select(learningGoals)..where((t) => t.id.equals(id)))
                .getSingleOrNull();
    }

    Future<bool> updateGoal(LearningGoalsCompanion entry) =>
            update(learningGoals).replace(entry);

    Future<LearningSessionRow> insertSession(LearningSessionsCompanion entry) =>
            into(learningSessions).insertReturning(entry);

    Future<bool> updateSession(LearningSessionsCompanion entry) =>
            update(learningSessions).replace(entry);

    Future<LearningSessionRow?> findActiveSession() {
        return (select(learningSessions)
            ..where((t) => t.status.equals('RUNNING'))
            ..limit(1))
                .getSingleOrNull();
    }

    Future<LearningSessionRow?> findSessionById(int id) {
        return (select(learningSessions)..where((t) => t.id.equals(id)))
                .getSingleOrNull();
    }

    Future<int> sumCompletedMinutesByGoalId(int goalId) async {
        final query = selectOnly(learningSessions)
            ..addColumns([learningSessions.durationSeconds.sum()])
            ..where(learningSessions.goalId.equals(goalId));
        final row = await query.getSingleOrNull();
        final totalSeconds = row?.read(learningSessions.durationSeconds.sum()) ?? 0;
        return totalSeconds ~/ 60;
    }
}
