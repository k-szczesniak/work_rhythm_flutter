import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:work_rhythm/domain/entities/daily_report.dart';
import 'package:work_rhythm/domain/entities/distraction_entry.dart';
import 'package:work_rhythm/domain/entities/learning_goal.dart';
import 'package:work_rhythm/domain/entities/work_session.dart';
import 'package:work_rhythm/domain/repositories/i_distraction_repository.dart';
import 'package:work_rhythm/domain/repositories/i_learning_repository.dart';
import 'package:work_rhythm/domain/repositories/i_work_session_repository.dart';
import 'package:work_rhythm/domain/usecases/reports/get_daily_report.dart';

import 'get_daily_report_test.mocks.dart';

@GenerateMocks([
    IWorkSessionRepository,
    IDistractionRepository,
    ILearningRepository,
])
void main() {
    late MockIWorkSessionRepository workSessionRepository;
    late MockIDistractionRepository distractionRepository;
    late MockILearningRepository learningRepository;
    late GetDailyReport getDailyReport;

    final _date = DateTime(2026, 3, 22);

    setUp(() {
        workSessionRepository = MockIWorkSessionRepository();
        distractionRepository = MockIDistractionRepository();
        learningRepository = MockILearningRepository();
        getDailyReport = GetDailyReport(
            workSessionRepository,
            distractionRepository,
            learningRepository,
        );
        when(learningRepository.getActiveGoals())
                .thenAnswer((_) async => []);
    });

    group('GetDailyReport', () {
        test('correctNetTimeCalculatedAfterDistractions', () async {
            // given — 3600s gross, 600s distractions → 3000s net = 50 min
            final session = WorkSession(
                id: 1,
                startTime: DateTime(2026, 3, 22, 9, 0),
                endTime: DateTime(2026, 3, 22, 10, 0),
                status: WorkSessionStatus.stopped,
                grossSeconds: 3600,
                netSeconds: 3000,
            );
            final distraction = DistractionEntry(
                id: 10,
                sessionId: 1,
                category: DistractionCategory.phone,
                durationSeconds: 600,
                timestamp: DateTime(2026, 3, 22, 9, 30),
            );
            when(workSessionRepository.getSessionsForDate(_date))
                    .thenAnswer((_) async => [session]);
            when(distractionRepository.getDistractionsForDate(_date))
                    .thenAnswer((_) async => [distraction]);

            // when
            final report = await getDailyReport(_date);

            // then — gross=60min, distraction=10min, net=50min
            expect(report.totalGrossMinutes, equals(60));
            expect(report.totalNetMinutes, equals(50));
        });

        test('timelineBlocksReturnedInChronologicalOrder', () async {
            // given — two sessions and one distraction interleaved
            final sessionA = WorkSession(
                id: 1,
                startTime: DateTime(2026, 3, 22, 10, 0),
                endTime: DateTime(2026, 3, 22, 11, 0),
                status: WorkSessionStatus.stopped,
                grossSeconds: 3600,
                netSeconds: 3600,
            );
            final sessionB = WorkSession(
                id: 2,
                startTime: DateTime(2026, 3, 22, 8, 0),
                endTime: DateTime(2026, 3, 22, 9, 0),
                status: WorkSessionStatus.stopped,
                grossSeconds: 3600,
                netSeconds: 3600,
            );
            final distraction = DistractionEntry(
                id: 20,
                sessionId: 1,
                category: DistractionCategory.home,
                durationSeconds: 300,
                timestamp: DateTime(2026, 3, 22, 9, 30),
            );
            when(workSessionRepository.getSessionsForDate(_date))
                    .thenAnswer((_) async => [sessionA, sessionB]);
            when(distractionRepository.getDistractionsForDate(_date))
                    .thenAnswer((_) async => [distraction]);

            // when
            final report = await getDailyReport(_date);

            // then — blocks sorted: 08:00 session, 09:30 distraction, 10:00 session
            expect(report.timeline.length, equals(3));
            expect(
                report.timeline[0].startTime,
                equals(DateTime(2026, 3, 22, 8, 0)),
            );
            expect(
                report.timeline[1].startTime,
                equals(DateTime(2026, 3, 22, 9, 30)),
            );
            expect(
                report.timeline[2].startTime,
                equals(DateTime(2026, 3, 22, 10, 0)),
            );
        });

        test('emptyReportReturnedForDayWithNoSessions', () async {
            // given
            when(workSessionRepository.getSessionsForDate(_date))
                    .thenAnswer((_) async => []);
            when(distractionRepository.getDistractionsForDate(_date))
                    .thenAnswer((_) async => []);

            // when
            final report = await getDailyReport(_date);

            // then
            expect(report.totalNetMinutes, equals(0));
            expect(report.totalGrossMinutes, equals(0));
            expect(report.timeline, isEmpty);
            expect(report.distractionsByCategory, isEmpty);
        });

        test('distractionsCategorisedCorrectly', () async {
            // given — two distractions in different categories
            final phoneDistraction = DistractionEntry(
                id: 30,
                sessionId: 1,
                category: DistractionCategory.phone,
                durationSeconds: 180,
                timestamp: DateTime(2026, 3, 22, 9, 0),
            );
            final homeDistraction = DistractionEntry(
                id: 31,
                sessionId: 1,
                category: DistractionCategory.home,
                durationSeconds: 120,
                timestamp: DateTime(2026, 3, 22, 9, 30),
            );
            when(workSessionRepository.getSessionsForDate(_date))
                    .thenAnswer((_) async => []);
            when(distractionRepository.getDistractionsForDate(_date))
                    .thenAnswer((_) async => [phoneDistraction, homeDistraction]);

            // when
            final report = await getDailyReport(_date);

            // then
            expect(
                report.distractionsByCategory[DistractionCategory.phone.label],
                equals(180),
            );
            expect(
                report.distractionsByCategory[DistractionCategory.home.label],
                equals(120),
            );
        });

        test('learningMinutesIncludedFromActiveGoals', () async {
            // given — goal with 60 completed minutes
            final goal = LearningGoal(
                id: 1,
                name: 'Flutter',
                targetMinutes: 600,
                createdAt: DateTime(2026, 1, 1),
                isActive: true,
                completedMinutes: 60,
            );
            when(workSessionRepository.getSessionsForDate(_date))
                    .thenAnswer((_) async => []);
            when(distractionRepository.getDistractionsForDate(_date))
                    .thenAnswer((_) async => []);
            when(learningRepository.getActiveGoals())
                    .thenAnswer((_) async => [goal]);

            // when
            final report = await getDailyReport(_date);

            // then
            expect(report.learningMinutes, equals(60));
        });
    });
}
