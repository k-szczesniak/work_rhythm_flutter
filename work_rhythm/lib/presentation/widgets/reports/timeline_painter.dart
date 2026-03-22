import 'package:flutter/material.dart';

import '../../../domain/entities/daily_report.dart';
import '../../theme/app_colors.dart';

/// [CustomPainter] that draws a horizontal timeline of [TimelineBlock] items
/// for a single day.
///
/// Layout:
/// - Canvas height: 80px
/// - Blocks occupy the top 52px; time labels occupy the bottom 20px.
/// - Each block is coloured by type with rounded corners (radius 4).
class TimelinePainter extends CustomPainter {

    const TimelinePainter({
        required this.blocks,
        required this.startHour,
        required this.endHour,
    });

    final List<TimelineBlock> blocks;

    /// First visible hour on the axis (inclusive), e.g. 8.
    final int startHour;

    /// Last visible hour on the axis (exclusive), e.g. 20.
    final int endHour;

    static const double _blockHeight = 48;

    static const double _blockRadius = 4;

    @override
    void paint(Canvas canvas, Size size) {
        if (endHour <= startHour) {
            return;
        }

        final totalMinutes = (endHour - startHour) * 60.0;

        _drawBlocks(canvas, size, totalMinutes);
        _drawAxisLabels(canvas, size, totalMinutes);
    }

    void _drawBlocks(Canvas canvas, Size size, double totalMinutes) {
        for (final block in blocks) {
            final blockStart = _clampToRange(block.startTime);
            final blockEnd = _clampToRange(block.endTime);

            final startMinutes = _toMinutesFromRangeStart(blockStart);
            final endMinutes = _toMinutesFromRangeStart(blockEnd);

            if (endMinutes <= startMinutes) {
                continue;
            }

            final left = (startMinutes / totalMinutes) * size.width;
            final right = (endMinutes / totalMinutes) * size.width;
            final rect = RRect.fromLTRBR(
                left,
                0,
                right,
                _blockHeight,
                const Radius.circular(_blockRadius),
            );

            final paint = Paint()
                ..color = _colorForType(block.type)
                ..style = PaintingStyle.fill;

            canvas.drawRRect(rect, paint);
        }
    }

    void _drawAxisLabels(Canvas canvas, Size size, double totalMinutes) {
        final labelPainter = TextPainter(
            textDirection: TextDirection.ltr,
        );

        for (var h = startHour; h <= endHour; h++) {
            final minutes = (h - startHour) * 60.0;
            final x = (minutes / totalMinutes) * size.width;
            final label = '${h.toString().padLeft(2, '0')}:00';

            labelPainter.text = TextSpan(
                text: label,
                style: const TextStyle(
                    color: AppColors.textDisabled,
                    fontSize: 10,
                ),
            );
            labelPainter.layout();
            labelPainter.paint(
                canvas,
                Offset(x - labelPainter.width / 2,
                        _blockHeight + 4),
            );
        }
    }

    // -------------------------------------------------------------------------
    // Helpers
    // -------------------------------------------------------------------------

    DateTime _clampToRange(DateTime dt) {
        final rangeStart = DateTime(dt.year, dt.month, dt.day, startHour);
        final rangeEnd = DateTime(dt.year, dt.month, dt.day, endHour);
        if (dt.isBefore(rangeStart)) {
            return rangeStart;
        }
        if (dt.isAfter(rangeEnd)) {
            return rangeEnd;
        }
        return dt;
    }

    double _toMinutesFromRangeStart(DateTime dt) {
        return (dt.hour - startHour) * 60.0 + dt.minute;
    }

    Color _colorForType(TimelineBlockType type) {
        switch (type) {
            case TimelineBlockType.work:
                return AppColors.workGreen;
            case TimelineBlockType.distraction:
                return AppColors.distractionOrange;
            case TimelineBlockType.learning:
                return AppColors.learningBlue;
            case TimelineBlockType.pause:
                return AppColors.pauseGray.withValues(alpha: 0.5);
        }
    }

    @override
    bool shouldRepaint(TimelinePainter oldDelegate) =>
            oldDelegate.blocks != blocks ||
            oldDelegate.startHour != startHour ||
            oldDelegate.endHour != endHour;
}

/// Widget wrapper around [TimelinePainter].
class TimelineChart extends StatelessWidget {

    const TimelineChart({
        super.key,
        required this.blocks,
        this.startHour = 8,
        this.endHour = 20,
    });

    final List<TimelineBlock> blocks;

    final int startHour;

    final int endHour;

    @override
    Widget build(BuildContext context) {
        return SizedBox(
            height: 68,
            child: CustomPaint(
                painter: TimelinePainter(
                    blocks: blocks,
                    startHour: startHour,
                    endHour: endHour,
                ),
                child: const SizedBox.expand(),
            ),
        );
    }
}
