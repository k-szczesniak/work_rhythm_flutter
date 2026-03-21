import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';

class CircularTimerDisplay extends StatelessWidget {

    const CircularTimerDisplay({
        super.key,
        required this.progress,
        required this.formattedTime,
        required this.targetLabel,
        required this.isOvertime,
        this.size = 260,
        this.strokeWidth = 12,
    });

    final double progress;

    final String formattedTime;

    final String targetLabel;

    final bool isOvertime;

    final double size;

    final double strokeWidth;

    @override
    Widget build(BuildContext context) {
        final arcColor = isOvertime ? AppColors.overtimeRed : AppColors.workGreen;
        return SizedBox(
            width: size,
            height: size,
            child: Stack(
                alignment: Alignment.center,
                children: [
                    CustomPaint(
                        size: Size(size, size),
                        painter: _ArcPainter(
                            progress: progress.clamp(0.0, 1.0),
                            arcColor: arcColor,
                            trackColor: AppColors.surfaceVariant,
                            strokeWidth: strokeWidth,
                        ),
                    ),
                    Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                            Text(
                                formattedTime,
                                style: const TextStyle(
                                    color: AppColors.textPrimary,
                                    fontSize: 42,
                                    fontWeight: FontWeight.w700,
                                    letterSpacing: 2,
                                    fontFeatures: [FontFeature.tabularFigures()],
                                ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                                targetLabel,
                                style: const TextStyle(
                                    color: AppColors.textSecondary,
                                    fontSize: 13,
                                ),
                            ),
                        ],
                    ),
                ],
            ),
        );
    }
}

class _ArcPainter extends CustomPainter {

    _ArcPainter({
        required this.progress,
        required this.arcColor,
        required this.trackColor,
        required this.strokeWidth,
    });

    final double progress;

    final Color arcColor;

    final Color trackColor;

    final double strokeWidth;

    @override
    void paint(Canvas canvas, Size size) {
        final center = Offset(size.width / 2, size.height / 2);
        final radius = (size.width - strokeWidth) / 2;
        final rect = Rect.fromCircle(center: center, radius: radius);

        // Background track
        final trackPaint = Paint()
            ..color = trackColor
            ..strokeWidth = strokeWidth
            ..style = PaintingStyle.stroke
            ..strokeCap = StrokeCap.round;
        canvas.drawArc(rect, -math.pi / 2, 2 * math.pi, false, trackPaint);

        // Progress arc
        if (progress > 0) {
            final arcPaint = Paint()
                ..color = arcColor
                ..strokeWidth = strokeWidth
                ..style = PaintingStyle.stroke
                ..strokeCap = StrokeCap.round;
            canvas.drawArc(
                rect,
                -math.pi / 2,
                2 * math.pi * progress,
                false,
                arcPaint,
            );
        }
    }

    @override
    bool shouldRepaint(_ArcPainter oldDelegate) =>
            oldDelegate.progress != progress ||
            oldDelegate.arcColor != arcColor;
}
