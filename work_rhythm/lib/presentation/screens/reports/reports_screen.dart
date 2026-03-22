import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../theme/app_colors.dart';
import '../../viewmodels/reports_viewmodel.dart';
import '../../widgets/reports/timeline_painter.dart';
import '../../widgets/reports/weekly_bar_chart.dart';

class ReportsScreen extends ConsumerWidget {

    const ReportsScreen({super.key});

    @override
    Widget build(BuildContext context, WidgetRef ref) {
        final reportsAsync = ref.watch(reportsViewmodelProvider);

        return Scaffold(
            backgroundColor: AppColors.background,
            appBar: AppBar(
                backgroundColor: AppColors.background,
                title: const Text(
                    'Raporty',
                    style: TextStyle(
                        color: AppColors.textPrimary,
                        fontWeight: FontWeight.w700,
                    ),
                ),
            ),
            body: reportsAsync.when(
                loading: () => const Center(
                    child: CircularProgressIndicator(
                        color: AppColors.workGreen,
                    ),
                ),
                error: (err, _) => Center(
                    child: Text(
                        'Błąd: $err',
                        style: const TextStyle(color: AppColors.overtimeRed),
                    ),
                ),
                data: (state) => _ReportsBody(state: state),
            ),
        );
    }
}

class _ReportsBody extends ConsumerWidget {

    const _ReportsBody({required this.state});

    final ReportsState state;

    @override
    Widget build(BuildContext context, WidgetRef ref) {
        final notifier = ref.read(reportsViewmodelProvider.notifier);
        final today = DateTime.now();
        final isToday = state.selectedDate.year == today.year &&
                state.selectedDate.month == today.month &&
                state.selectedDate.day == today.day;

        return ListView(
            padding: const EdgeInsets.all(16),
            children: [
                _DateNavigator(
                    date: state.selectedDate,
                    isToday: isToday,
                    onPrevious: notifier.goToPreviousDay,
                    onNext: notifier.goToNextDay,
                ),
                const SizedBox(height: 16),
                if (state.dailyReport != null) ...[
                    _DailySummaryCard(report: state.dailyReport!),
                    const SizedBox(height: 16),
                    _TimelineSection(report: state.dailyReport!),
                    const SizedBox(height: 16),
                ],
                if (state.weeklyEntries.isNotEmpty) ...[
                    const Text(
                        'Ten tydzień',
                        style: TextStyle(
                            color: AppColors.textPrimary,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                        ),
                    ),
                    const SizedBox(height: 12),
                    WeeklyBarChart(entries: state.weeklyEntries),
                ],
            ],
        );
    }
}

class _DateNavigator extends StatelessWidget {

    const _DateNavigator({
        required this.date,
        required this.isToday,
        required this.onPrevious,
        required this.onNext,
    });

    final DateTime date;

    final bool isToday;

    final VoidCallback onPrevious;

    final VoidCallback onNext;

    @override
    Widget build(BuildContext context) {
        final label = isToday
                ? 'Dziś, ${DateFormat('d MMMM', 'pl').format(date)}'
                : DateFormat('EEEE, d MMMM yyyy', 'pl').format(date);

        return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
                IconButton(
                    icon: const Icon(
                        Icons.chevron_left,
                        color: AppColors.textSecondary,
                    ),
                    onPressed: onPrevious,
                ),
                Text(
                    label,
                    style: const TextStyle(
                        color: AppColors.textPrimary,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                    ),
                ),
                IconButton(
                    icon: Icon(
                        Icons.chevron_right,
                        color: isToday
                                ? AppColors.textDisabled
                                : AppColors.textSecondary,
                    ),
                    onPressed: isToday ? null : onNext,
                ),
            ],
        );
    }
}

class _DailySummaryCard extends StatelessWidget {

    const _DailySummaryCard({required this.report});

    final dynamic report;

    @override
    Widget build(BuildContext context) {
        final netH = report.totalNetMinutes ~/ 60;
        final netM = report.totalNetMinutes % 60;
        final grossH = report.totalGrossMinutes ~/ 60;
        final grossM = report.totalGrossMinutes % 60;
        final learnH = report.learningMinutes ~/ 60;
        final learnM = report.learningMinutes % 60;

        return Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                    _StatCell(
                        label: 'Netto',
                        value: '${netH}h ${netM}min',
                        color: AppColors.workGreen,
                    ),
                    _StatCell(
                        label: 'Brutto',
                        value: '${grossH}h ${grossM}min',
                        color: AppColors.textSecondary,
                    ),
                    _StatCell(
                        label: 'Nauka',
                        value: '${learnH}h ${learnM}min',
                        color: AppColors.learningBlue,
                    ),
                ],
            ),
        );
    }
}

class _StatCell extends StatelessWidget {

    const _StatCell({
        required this.label,
        required this.value,
        required this.color,
    });

    final String label;

    final String value;

    final Color color;

    @override
    Widget build(BuildContext context) {
        return Column(
            children: [
                Text(
                    value,
                    style: TextStyle(
                        color: color,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                    ),
                ),
                const SizedBox(height: 2),
                Text(
                    label,
                    style: const TextStyle(
                        color: AppColors.textDisabled,
                        fontSize: 11,
                    ),
                ),
            ],
        );
    }
}

class _TimelineSection extends StatelessWidget {

    const _TimelineSection({required this.report});

    final dynamic report;

    @override
    Widget build(BuildContext context) {
        return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                const Text(
                    'Oś czasu',
                    style: TextStyle(
                        color: AppColors.textPrimary,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                    ),
                ),
                const SizedBox(height: 8),
                Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                        color: AppColors.surface,
                        borderRadius: BorderRadius.circular(12),
                    ),
                    child: report.timeline.isEmpty
                            ? const Center(
                                child: Text(
                                    'Brak danych',
                                    style: TextStyle(
                                        color: AppColors.textDisabled,
                                    ),
                                ),
                            )
                            : TimelineChart(blocks: report.timeline),
                ),
            ],
        );
    }
}

