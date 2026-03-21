import 'package:flutter/material.dart';

import '../../../presentation/theme/app_colors.dart';
import '../../../domain/entities/learning_goal.dart';

/// Horizontal progress bar used inside [GoalCard] to visualise learning progress.
class LearningProgressBar extends StatelessWidget {

    const LearningProgressBar({
        super.key,
        required this.goal,
    });

    final LearningGoal goal;

    @override
    Widget build(BuildContext context) {
        final progress = goal.progressPercent.clamp(0.0, 1.0);
        final color = progress >= 1.0 ? AppColors.successGold : AppColors.learningBlue;

        return ClipRRect(
            borderRadius: BorderRadius.circular(3),
            child: LinearProgressIndicator(
                value: progress,
                minHeight: 6,
                backgroundColor: AppColors.surfaceVariant,
                valueColor: AlwaysStoppedAnimation<Color>(color),
            ),
        );
    }
}
