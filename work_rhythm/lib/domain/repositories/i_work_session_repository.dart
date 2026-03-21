import '../entities/work_session.dart';

abstract class IWorkSessionRepository {

    Future<WorkSession> startSession();

    Future<WorkSession> pauseSession(int sessionId);

    Future<WorkSession> resumeSession(int sessionId);

    Future<WorkSession> stopSession(int sessionId);

    Future<WorkSession?> getActiveSession();

    Future<List<WorkSession>> getSessionsForDate(DateTime date);

    Future<void> updateNetSeconds(int sessionId, int netSeconds);
}
