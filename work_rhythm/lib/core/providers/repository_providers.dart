import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/datasources/database.dart';
import '../../data/repositories/config_repository_impl.dart';
import '../../data/repositories/distraction_repository_impl.dart';
import '../../data/repositories/learning_repository_impl.dart';
import '../../data/repositories/work_session_repository_impl.dart';
import '../../domain/repositories/i_config_repository.dart';
import '../../domain/repositories/i_distraction_repository.dart';
import '../../domain/repositories/i_learning_repository.dart';
import '../../domain/repositories/i_work_session_repository.dart';
import '../../domain/usecases/learning/create_learning_goal.dart';
import '../../domain/usecases/learning/start_learning_session.dart';
import '../../domain/usecases/learning/stop_learning_session.dart';
import '../../domain/usecases/reports/get_daily_report.dart';
import '../../domain/usecases/reports/get_weekly_report.dart';
import '../../domain/usecases/work/add_distraction.dart';
import '../../domain/usecases/work/pause_work_session.dart';
import '../../domain/usecases/work/start_work_session.dart';
import '../../domain/usecases/work/stop_work_session.dart';

// ---------- Database ----------

final appDatabaseProvider = Provider<AppDatabase>((ref) {
    final db = AppDatabase();
    ref.onDispose(db.close);
    return db;
});

// ---------- Repositories ----------

final workSessionRepositoryProvider = Provider<IWorkSessionRepository>((ref) {
    final db = ref.watch(appDatabaseProvider);
    return WorkSessionRepositoryImpl(db.workSessionDao);
});

final distractionRepositoryProvider = Provider<IDistractionRepository>((ref) {
    final db = ref.watch(appDatabaseProvider);
    return DistractionRepositoryImpl(db.distractionDao);
});

final learningRepositoryProvider = Provider<ILearningRepository>((ref) {
    final db = ref.watch(appDatabaseProvider);
    return LearningRepositoryImpl(db.learningDao);
});

final configRepositoryProvider = Provider<IConfigRepository>((ref) {
    final db = ref.watch(appDatabaseProvider);
    return ConfigRepositoryImpl(db.configDao);
});

// ---------- Use cases — Work ----------

final startWorkSessionProvider = Provider<StartWorkSession>((ref) {
    return StartWorkSession(ref.watch(workSessionRepositoryProvider));
});

final pauseWorkSessionProvider = Provider<PauseWorkSession>((ref) {
    return PauseWorkSession(ref.watch(workSessionRepositoryProvider));
});

final stopWorkSessionProvider = Provider<StopWorkSession>((ref) {
    return StopWorkSession(ref.watch(workSessionRepositoryProvider));
});

final addDistractionProvider = Provider<AddDistraction>((ref) {
    return AddDistraction(
        ref.watch(distractionRepositoryProvider),
        ref.watch(workSessionRepositoryProvider),
    );
});

// ---------- Use cases — Learning ----------

final createLearningGoalProvider = Provider<CreateLearningGoal>((ref) {
    return CreateLearningGoal(ref.watch(learningRepositoryProvider));
});

final startLearningSessionProvider = Provider<StartLearningSession>((ref) {
    return StartLearningSession(
        ref.watch(learningRepositoryProvider),
        ref.watch(workSessionRepositoryProvider),
    );
});

final stopLearningSessionProvider = Provider<StopLearningSession>((ref) {
    return StopLearningSession(ref.watch(learningRepositoryProvider));
});

// ---------- Use cases — Reports ----------

final getDailyReportProvider = Provider<GetDailyReport>((ref) {
    return GetDailyReport(
        ref.watch(workSessionRepositoryProvider),
        ref.watch(distractionRepositoryProvider),
        ref.watch(learningRepositoryProvider),
    );
});

final getWeeklyReportProvider = Provider<GetWeeklyReport>((ref) {
    return GetWeeklyReport(ref.watch(getDailyReportProvider));
});

// ---------- Timer ViewModel — defined in presentation/viewmodels/timer_viewmodel.dart ----------
// timerViewmodelProvider is declared in that file to keep freezed & Riverpod co-located.
