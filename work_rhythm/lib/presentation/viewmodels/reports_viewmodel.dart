import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/providers/repository_providers.dart';
import '../../domain/entities/daily_report.dart';
import '../../domain/usecases/reports/get_weekly_report.dart';

class ReportsState {

    const ReportsState({
        required this.selectedDate,
        this.dailyReport,
        this.weeklyEntries = const [],
        this.isLoading = false,
        this.error,
    });

    final DateTime selectedDate;

    final DailyReport? dailyReport;

    final List<WeeklyReportEntry> weeklyEntries;

    final bool isLoading;

    final String? error;

    ReportsState copyWith({
        DateTime? selectedDate,
        DailyReport? dailyReport,
        List<WeeklyReportEntry>? weeklyEntries,
        bool? isLoading,
        String? error,
    }) {
        return ReportsState(
            selectedDate: selectedDate ?? this.selectedDate,
            dailyReport: dailyReport ?? this.dailyReport,
            weeklyEntries: weeklyEntries ?? this.weeklyEntries,
            isLoading: isLoading ?? this.isLoading,
            error: error,
        );
    }
}

final reportsViewmodelProvider =
        AsyncNotifierProvider<ReportsViewmodel, ReportsState>(
    ReportsViewmodel.new,
);

class ReportsViewmodel extends AsyncNotifier<ReportsState> {

    @override
    Future<ReportsState> build() async {
        final today = _today();
        return _loadForDate(today);
    }

    Future<void> selectDate(DateTime date) async {
        state = AsyncData(state.requireValue.copyWith(isLoading: true));
        state = await AsyncValue.guard(() => _loadForDate(date));
    }

    Future<void> goToPreviousDay() async {
        final current = state.valueOrNull?.selectedDate ?? _today();
        await selectDate(current.subtract(const Duration(days: 1)));
    }

    Future<void> goToNextDay() async {
        final current = state.valueOrNull?.selectedDate ?? _today();
        final next = current.add(const Duration(days: 1));
        if (next.isAfter(_today())) {
            return;
        }
        await selectDate(next);
    }

    // -------------------------------------------------------------------------
    // Private helpers
    // -------------------------------------------------------------------------

    Future<ReportsState> _loadForDate(DateTime date) async {
        final normalised = _normalise(date);

        final dailyReport = await ref
                .read(getDailyReportProvider)
                .call(normalised);

        final weekStart = _weekStart(normalised);
        final weeklyEntries = await ref
                .read(getWeeklyReportProvider)
                .call(weekStart);

        return ReportsState(
            selectedDate: normalised,
            dailyReport: dailyReport,
            weeklyEntries: weeklyEntries,
        );
    }

    DateTime _today() => _normalise(DateTime.now());

    DateTime _normalise(DateTime dt) =>
            DateTime(dt.year, dt.month, dt.day);

    /// Returns the Monday of the week containing [date].
    DateTime _weekStart(DateTime date) {
        final dayOfWeek = date.weekday; // Mon=1, Sun=7
        return date.subtract(Duration(days: dayOfWeek - 1));
    }
}
