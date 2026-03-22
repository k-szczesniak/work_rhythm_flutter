import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../domain/usecases/reports/get_weekly_report.dart';
import '../../theme/app_colors.dart';

/// fl_chart [BarChart] showing 7-day (Mon–Sun) net work hours.
///
/// - Bars coloured orange (<8h), green (>=8h), gray (weekend).
/// - Dashed horizontal reference line at y=8 (daily goal).
/// - Y-axis: 0–12h (step 2h).
/// - X-axis labels: Polish short day names.
/// - Tap tooltip: "Xh Ymin netto".
class WeeklyBarChart extends StatefulWidget {

    const WeeklyBarChart({
        super.key,
        required this.entries,
        this.targetHours = 8,
    });

    final List<WeeklyReportEntry> entries;

    final int targetHours;

    @override
    State<WeeklyBarChart> createState() => _WeeklyBarChartState();
}

class _WeeklyBarChartState extends State<WeeklyBarChart> {

    int? _touchedIndex;

    static const List<String> _dayLabels = [
        'Pn', 'Wt', 'Śr', 'Cz', 'Pt', 'Sb', 'Nd',
    ];

    @override
    Widget build(BuildContext context) {
        return AspectRatio(
            aspectRatio: 1.7,
            child: BarChart(
                _buildChartData(),
                swapAnimationDuration: const Duration(milliseconds: 300),
            ),
        );
    }

    BarChartData _buildChartData() {
        return BarChartData(
            alignment: BarChartAlignment.spaceAround,
            maxY: 12,
            barTouchData: BarTouchData(
                touchCallback: (event, response) {
                    setState(() {
                        _touchedIndex = (event.isInterestedForInteractions &&
                                response != null &&
                                response.spot != null)
                                ? response.spot!.touchedBarGroupIndex
                                : null;
                    });
                },
                touchTooltipData: BarTouchTooltipData(
                    getTooltipColor: (_) => const Color(0xFF252836),
                    getTooltipItem: _buildTooltip,
                ),
            ),
            titlesData: _buildTitlesData(),
            gridData: FlGridData(
                show: true,
                drawVerticalLine: false,
                horizontalInterval: 2,
                getDrawingHorizontalLine: (value) => const FlLine(
                    color: AppColors.surfaceVariant,
                    strokeWidth: 1,
                ),
            ),
            borderData: FlBorderData(show: false),
            barGroups: _buildBarGroups(),
            extraLinesData: ExtraLinesData(
                horizontalLines: [
                    HorizontalLine(
                        y: widget.targetHours.toDouble(),
                        color: AppColors.textPrimary.withValues(alpha: 0.3),
                        strokeWidth: 1.5,
                        dashArray: [6, 4],
                        label: HorizontalLineLabel(
                            show: true,
                            alignment: Alignment.topRight,
                            labelResolver: (_) =>
                                    '${widget.targetHours}h cel',
                            style: const TextStyle(
                                color: AppColors.textDisabled,
                                fontSize: 10,
                            ),
                        ),
                    ),
                ],
            ),
        );
    }

    FlTitlesData _buildTitlesData() {
        return FlTitlesData(
            show: true,
            topTitles: const AxisTitles(
                sideTitles: SideTitles(showTitles: false),
            ),
            rightTitles: const AxisTitles(
                sideTitles: SideTitles(showTitles: false),
            ),
            leftTitles: AxisTitles(
                sideTitles: SideTitles(
                    showTitles: true,
                    interval: 2,
                    getTitlesWidget: (value, meta) => Text(
                        '${value.toInt()}h',
                        style: const TextStyle(
                            color: AppColors.textDisabled,
                            fontSize: 10,
                        ),
                    ),
                    reservedSize: 32,
                ),
            ),
            bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                    showTitles: true,
                    getTitlesWidget: (value, meta) {
                        final index = value.toInt();
                        if (index < 0 || index >= _dayLabels.length) {
                            return const SizedBox.shrink();
                        }
                        return Text(
                            _dayLabels[index],
                            style: const TextStyle(
                                color: AppColors.textSecondary,
                                fontSize: 11,
                            ),
                        );
                    },
                ),
            ),
        );
    }

    List<BarChartGroupData> _buildBarGroups() {
        final groups = <BarChartGroupData>[];

        for (var i = 0; i < widget.entries.length; i++) {
            final entry = widget.entries[i];
            final hours = entry.netMinutes / 60.0;
            final isWeekend = i >= 5; // Sat=5, Sun=6
            final isTouched = i == _touchedIndex;

            Color barColor;
            if (isWeekend) {
                barColor = AppColors.pauseGray;
            } else if (hours >= widget.targetHours) {
                barColor = AppColors.workGreen;
            } else {
                barColor = AppColors.distractionOrange;
            }

            groups.add(
                BarChartGroupData(
                    x: i,
                    barRods: [
                        BarChartRodData(
                            toY: hours.clamp(0, 12),
                            color: isTouched
                                    ? barColor.withValues(alpha: 0.7)
                                    : barColor,
                            width: 16,
                            borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(4),
                            ),
                        ),
                    ],
                ),
            );
        }

        return groups;
    }

    BarTooltipItem? _buildTooltip(BarChartGroupData group, int groupIndex,
            BarChartRodData rod, int rodIndex) {
        if (groupIndex >= widget.entries.length) {
            return null;
        }
        final minutes = widget.entries[groupIndex].netMinutes;
        final h = minutes ~/ 60;
        final m = minutes % 60;
        return BarTooltipItem(
            '${h}h ${m}min netto',
            const TextStyle(
                color: AppColors.textPrimary,
                fontWeight: FontWeight.w600,
                fontSize: 12,
            ),
        );
    }
}
