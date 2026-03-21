import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../theme/app_colors.dart';

class DailyProgressBar extends StatelessWidget {

    const DailyProgressBar({
        super.key,
        required this.netSeconds,
        required this.targetSeconds,
        this.estimatedEndTime,
    });

    final int netSeconds;

    final int targetSeconds;

    final DateTime? estimatedEndTime;

    @override
    Widget build(BuildContext context) {
        final progress = targetSeconds > 0
                ? (netSeconds / targetSeconds).clamp(0.0, 1.0)
                : 0.0;
        final netH = netSeconds ~/ 3600;
        final netM = (netSeconds % 3600) ~/ 60;
        final targetH = targetSeconds ~/ 3600;

        final netLabel = netH > 0 ? '${netH}h ${netM}min' : '${netM}min';
        final progressLabel = '$netLabel z ${targetH}h';

        final endLabel = estimatedEndTime != null
                ? 'Koniec pracy ok. ${DateFormat('HH:mm').format(estimatedEndTime!)}'
                : null;

        return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                            Text(
                                progressLabel,
                                style: const TextStyle(
                                    color: AppColors.textPrimary,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                ),
                            ),
                            Text(
                                '${(progress * 100).round()}%',
                                style: const TextStyle(
                                    color: AppColors.textSecondary,
                                    fontSize: 14,
                                ),
                            ),
                        ],
                    ),
                    const SizedBox(height: 8),
                    ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: LinearProgressIndicator(
                            value: progress,
                            minHeight: 8,
                            backgroundColor: AppColors.surfaceVariant,
                            valueColor: AlwaysStoppedAnimation<Color>(
                                progress >= 1.0
                                        ? AppColors.successGold
                                        : AppColors.workGreen,
                            ),
                        ),
                    ),
                    if (endLabel != null) ...[
                        const SizedBox(height: 6),
                        Text(
                            endLabel,
                            style: const TextStyle(
                                color: AppColors.textSecondary,
                                fontSize: 12,
                            ),
                        ),
                    ],
                ],
            ),
        );
    }
}
