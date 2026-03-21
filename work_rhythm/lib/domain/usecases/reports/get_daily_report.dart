import '../../entities/daily_report.dart';
import '../../repositories/i_distraction_repository.dart';
import '../../repositories/i_learning_repository.dart';
import '../../repositories/i_work_session_repository.dart';

class GetDailyReport {

    GetDailyReport(
        this._workSessionRepository,
        this._distractionRepository,
        this._learningRepository,
    );

    final IWorkSessionRepository _workSessionRepository;

    final IDistractionRepository _distractionRepository;

    final ILearningRepository _learningRepository;

    Future<DailyReport> call(DateTime date) async {
        final sessions = await _workSessionRepository.getSessionsForDate(date);
        final distractions = await _distractionRepository.getDistractionsForDate(date);
        final activeGoals = await _learningRepository.getActiveGoals();

        int totalGrossSeconds = 0;
        int totalDistractionSeconds = 0;
        final blocks = <TimelineBlock>[];

        for (var session in sessions) {
            totalGrossSeconds += session.grossSeconds;
            final end = session.endTime ?? DateTime.now();
            blocks.add(
                TimelineBlock(
                    startTime: session.startTime,
                    endTime: end,
                    type: TimelineBlockType.work,
                ),
            );
        }

        final categoryTotals = <String, int>{};
        for (var d in distractions) {
            totalDistractionSeconds += d.durationSeconds;
            final label = d.category.label;
            categoryTotals[label] = (categoryTotals[label] ?? 0) + d.durationSeconds;
            blocks.add(
                TimelineBlock(
                    startTime: d.timestamp,
                    endTime: d.timestamp.add(Duration(seconds: d.durationSeconds)),
                    type: TimelineBlockType.distraction,
                    category: label,
                ),
            );
        }

        int learningSeconds = 0;
        for (var goal in activeGoals) {
            learningSeconds += goal.completedMinutes * 60;
        }

        blocks.sort((a, b) => a.startTime.compareTo(b.startTime));

        final totalNetSeconds = (totalGrossSeconds - totalDistractionSeconds)
                .clamp(0, totalGrossSeconds);

        return DailyReport(
            date: DateTime(date.year, date.month, date.day),
            timeline: blocks,
            totalNetMinutes: totalNetSeconds ~/ 60,
            totalGrossMinutes: totalGrossSeconds ~/ 60,
            distractionsByCategory: categoryTotals,
            learningMinutes: learningSeconds ~/ 60,
        );
    }
}
