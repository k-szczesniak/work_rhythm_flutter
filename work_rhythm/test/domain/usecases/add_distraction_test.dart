import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:work_rhythm/domain/entities/distraction_entry.dart';
import 'package:work_rhythm/domain/entities/work_session.dart';
import 'package:work_rhythm/domain/repositories/i_distraction_repository.dart';
import 'package:work_rhythm/domain/repositories/i_work_session_repository.dart';
import 'package:work_rhythm/domain/usecases/work/add_distraction.dart';

import 'add_distraction_test.mocks.dart';

@GenerateMocks([IWorkSessionRepository, IDistractionRepository])
void main() {
    late MockIWorkSessionRepository workSessionRepository;
    late MockIDistractionRepository distractionRepository;
    late AddDistraction addDistraction;

    setUp(() {
        workSessionRepository = MockIWorkSessionRepository();
        distractionRepository = MockIDistractionRepository();
        addDistraction = AddDistraction(
            distractionRepository,
            workSessionRepository,
        );
    });

    final _runningSession = WorkSession(
        id: 1,
        startTime: DateTime(2026, 3, 22, 9, 0),
        status: WorkSessionStatus.running,
        grossSeconds: 3600,
        netSeconds: 3600,
    );

    final _stoppedSession = WorkSession(
        id: 2,
        startTime: DateTime(2026, 3, 22, 9, 0),
        endTime: DateTime(2026, 3, 22, 10, 0),
        status: WorkSessionStatus.stopped,
        grossSeconds: 3600,
        netSeconds: 3600,
    );

    final _distractionEntry = DistractionEntry(
        id: 10,
        sessionId: 1,
        category: DistractionCategory.phone,
        durationSeconds: 300,
        timestamp: DateTime(2026, 3, 22, 9, 30),
    );

    group('AddDistraction', () {
        test('distractionTimeSubtractedFromNetSeconds', () async {
            // given
            when(workSessionRepository.getSessionsForDate(any))
                    .thenAnswer((_) async => [_runningSession]);
            when(distractionRepository.addDistraction(
                sessionId: anyNamed('sessionId'),
                category: anyNamed('category'),
                durationSeconds: anyNamed('durationSeconds'),
            )).thenAnswer((_) async => _distractionEntry);
            when(workSessionRepository.updateNetSeconds(any, any))
                    .thenAnswer((_) async {});

            // when
            await addDistraction(
                sessionId: 1,
                category: DistractionCategory.phone,
                durationSeconds: 300,
            );

            // then
            // netSeconds was 3600, distraction is 300 → new net = 3300
            verify(workSessionRepository.updateNetSeconds(1, 3300)).called(1);
        });

        test('exceptionThrownWhenSessionIsStopped', () async {
            // given
            when(workSessionRepository.getSessionsForDate(any))
                    .thenAnswer((_) async => [_stoppedSession]);

            // when / then
            expect(
                () => addDistraction(
                    sessionId: 2,
                    category: DistractionCategory.other,
                    durationSeconds: 120,
                ),
                throwsStateError,
            );
        });

        test('exceptionThrownWhenSessionNotFound', () async {
            // given
            when(workSessionRepository.getSessionsForDate(any))
                    .thenAnswer((_) async => []);

            // when / then
            expect(
                () => addDistraction(
                    sessionId: 99,
                    category: DistractionCategory.home,
                    durationSeconds: 60,
                ),
                throwsStateError,
            );
        });

        test('netSecondsClampedToZeroWhenDistractionExceedsNet', () async {
            // given — distraction (600s) > netSeconds (300s) → should clamp to 0
            final shortNetSession = WorkSession(
                id: 3,
                startTime: DateTime(2026, 3, 22, 9, 0),
                status: WorkSessionStatus.running,
                grossSeconds: 3600,
                netSeconds: 300,
            );
            when(workSessionRepository.getSessionsForDate(any))
                    .thenAnswer((_) async => [shortNetSession]);
            when(distractionRepository.addDistraction(
                sessionId: anyNamed('sessionId'),
                category: anyNamed('category'),
                durationSeconds: anyNamed('durationSeconds'),
            )).thenAnswer((_) async => _distractionEntry.copyWith(
                sessionId: 3,
                durationSeconds: 600,
            ));
            when(workSessionRepository.updateNetSeconds(any, any))
                    .thenAnswer((_) async {});

            // when
            await addDistraction(
                sessionId: 3,
                category: DistractionCategory.child,
                durationSeconds: 600,
            );

            // then — clamped to 0, not negative
            verify(workSessionRepository.updateNetSeconds(3, 0)).called(1);
        });
    });
}
