import '../entities/distraction_entry.dart';

abstract class IDistractionRepository {

    Future<DistractionEntry> addDistraction({
        required int sessionId,
        required DistractionCategory category,
        required int durationSeconds,
    });

    Future<List<DistractionEntry>> getDistractionsForSession(int sessionId);

    Future<List<DistractionEntry>> getDistractionsForDate(DateTime date);

    Future<int> getTotalDistractionSeconds(int sessionId);
}
