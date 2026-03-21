import 'get_daily_report.dart';

class WeeklyReportEntry {

    const WeeklyReportEntry({
        required this.date,
        required this.netMinutes,
        required this.grossMinutes,
        required this.learningMinutes,
    });

    final DateTime date;

    final int netMinutes;

    final int grossMinutes;

    final int learningMinutes;
}

class GetWeeklyReport {

    GetWeeklyReport(this._getDailyReport);

    final GetDailyReport _getDailyReport;

    Future<List<WeeklyReportEntry>> call(DateTime weekStart) async {
        final entries = <WeeklyReportEntry>[];
        for (var i = 0; i < 7; i++) {
            final day = weekStart.add(Duration(days: i));
            final report = await _getDailyReport(day);
            entries.add(
                WeeklyReportEntry(
                    date: day,
                    netMinutes: report.totalNetMinutes,
                    grossMinutes: report.totalGrossMinutes,
                    learningMinutes: report.learningMinutes,
                ),
            );
        }
        return entries;
    }
}
