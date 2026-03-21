import '../../entities/distraction_entry.dart';
import '../../entities/work_session.dart';
import '../../repositories/i_distraction_repository.dart';
import '../../repositories/i_work_session_repository.dart';

class AddDistraction {

    AddDistraction(this._distractionRepository, this._workSessionRepository);

    final IDistractionRepository _distractionRepository;

    final IWorkSessionRepository _workSessionRepository;

    Future<DistractionEntry> call({
        required int sessionId,
        required DistractionCategory category,
        required int durationSeconds,
    }) async {
        final sessions = await _workSessionRepository.getSessionsForDate(DateTime.now());
        final session = sessions.where((s) => s.id == sessionId).firstOrNull;
        if (session == null) {
            throw StateError('Session $sessionId not found');
        }
        if (session.status == WorkSessionStatus.stopped) {
            throw StateError('Cannot add distraction to a stopped session');
        }

        final distraction = await _distractionRepository.addDistraction(
            sessionId: sessionId,
            category: category,
            durationSeconds: durationSeconds,
        );

        final currentNet = session.netSeconds;
        final newNet = (currentNet - durationSeconds).clamp(0, currentNet);
        await _workSessionRepository.updateNetSeconds(sessionId, newNet);

        return distraction;
    }
}
