import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:work_rhythm/domain/entities/work_session.dart';
import 'package:work_rhythm/domain/repositories/i_work_session_repository.dart';
import 'package:work_rhythm/domain/usecases/work/start_work_session.dart';

import 'start_work_session_test.mocks.dart';

@GenerateMocks([IWorkSessionRepository])
void main() {
    late MockIWorkSessionRepository workSessionRepository;
    late StartWorkSession startWorkSession;

    setUp(() {
        workSessionRepository = MockIWorkSessionRepository();
        startWorkSession = StartWorkSession(workSessionRepository);
    });

    final _newSession = WorkSession(
        id: 1,
        startTime: DateTime(2026, 3, 22, 9, 0),
        status: WorkSessionStatus.running,
        grossSeconds: 0,
        netSeconds: 0,
    );

    group('StartWorkSession', () {
        test('newSessionCreatedWhenNoActiveSessionExists', () async {
            // given
            when(workSessionRepository.getActiveSession())
                    .thenAnswer((_) async => null);
            when(workSessionRepository.startSession())
                    .thenAnswer((_) async => _newSession);

            // when
            final result = await startWorkSession();

            // then
            expect(result.id, equals(1));
            verify(workSessionRepository.startSession()).called(1);
        });

        test('exceptionThrownWhenActiveSessionAlreadyExists', () async {
            // given
            when(workSessionRepository.getActiveSession())
                    .thenAnswer((_) async => _newSession);

            // when / then
            expect(
                () => startWorkSession(),
                throwsStateError,
            );
            verifyNever(workSessionRepository.startSession());
        });

        test('newSessionHasRunningStatus', () async {
            // given
            when(workSessionRepository.getActiveSession())
                    .thenAnswer((_) async => null);
            when(workSessionRepository.startSession())
                    .thenAnswer((_) async => _newSession);

            // when
            final result = await startWorkSession();

            // then
            expect(result.status, equals(WorkSessionStatus.running));
        });
    });
}
