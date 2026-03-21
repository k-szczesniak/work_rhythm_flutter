import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../domain/entities/learning_goal.dart';
import '../../theme/app_colors.dart';
import 'learning_progress_bar.dart';

/// Card widget displaying a single [LearningGoal] with progress stats
/// and a button to start a learning session.
class GoalCard extends StatelessWidget {

    const GoalCard({
        super.key,
        required this.goal,
        required this.isActive,
        required this.onStartSession,
        this.onStopSession,
    });

    final LearningGoal goal;

    /// Whether this goal has the currently running learning session.
    final bool isActive;

    final VoidCallback onStartSession;

    final VoidCallback? onStopSession;

    @override
    Widget build(BuildContext context) {
        return Card(
            color: AppColors.surfaceVariant,
            elevation: 0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                        _Header(goal: goal),
                        const SizedBox(height: 12),
                        LearningProgressBar(goal: goal),
                        const SizedBox(height: 8),
                        _Stats(goal: goal),
                        const SizedBox(height: 12),
                        _Footer(
                            goal: goal,
                            isActive: isActive,
                            onStartSession: onStartSession,
                            onStopSession: onStopSession,
                        ),
                    ],
                ),
            ),
        );
    }
}

class _Header extends StatelessWidget {

    const _Header({required this.goal});

    final LearningGoal goal;

    @override
    Widget build(BuildContext context) {
        return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                Expanded(
                    child: Text(
                        goal.name,
                        style: const TextStyle(
                            color: AppColors.textPrimary,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                        ),
                    ),
                ),
                if (goal.deadline != null) ...[
                    const SizedBox(width: 8),
                    _DeadlineBadge(deadline: goal.deadline!),
                ],
            ],
        );
    }
}

class _DeadlineBadge extends StatelessWidget {

    const _DeadlineBadge({required this.deadline});

    final DateTime deadline;

    @override
    Widget build(BuildContext context) {
        final isOverdue = deadline.isBefore(DateTime.now());
        final label = DateFormat('d MMM', 'pl').format(deadline);
        return Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
                color: isOverdue
                        ? AppColors.overtimeRed.withValues(alpha: 0.2)
                        : AppColors.learningBlue.withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(6),
            ),
            child: Text(
                label,
                style: TextStyle(
                    color: isOverdue
                            ? AppColors.overtimeRed
                            : AppColors.learningBlue,
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                ),
            ),
        );
    }
}

class _Stats extends StatelessWidget {

    const _Stats({required this.goal});

    final LearningGoal goal;

    @override
    Widget build(BuildContext context) {
        final completedH = goal.completedMinutes ~/ 60;
        final completedM = goal.completedMinutes % 60;
        final targetH = goal.targetMinutes ~/ 60;
        final percent = (goal.progressPercent * 100).clamp(0, 100).round();

        return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
                Text(
                    '${completedH}h ${completedM}min z ${targetH}h',
                    style: const TextStyle(
                        color: AppColors.textSecondary,
                        fontSize: 13,
                    ),
                ),
                Text(
                    '$percent% ukończono',
                    style: const TextStyle(
                        color: AppColors.textSecondary,
                        fontSize: 13,
                    ),
                ),
            ],
        );
    }
}

class _Footer extends StatelessWidget {

    const _Footer({
        required this.goal,
        required this.isActive,
        required this.onStartSession,
        this.onStopSession,
    });

    final LearningGoal goal;

    final bool isActive;

    final VoidCallback onStartSession;

    final VoidCallback? onStopSession;

    @override
    Widget build(BuildContext context) {
        final remaining = goal.remaining;
        final remainH = remaining.inHours;
        final remainM = remaining.inMinutes % 60;

        return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
                Text(
                    'Zostało: ${remainH}h ${remainM}min',
                    style: const TextStyle(
                        color: AppColors.textDisabled,
                        fontSize: 12,
                    ),
                ),
                ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: isActive
                                ? AppColors.pauseGray
                                : AppColors.learningBlue,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                        ),
                    ),
                    icon: Icon(
                        isActive ? Icons.stop : Icons.play_arrow,
                        color: AppColors.textPrimary,
                        size: 18,
                    ),
                    label: Text(
                        isActive ? 'Stop' : 'Sesja',
                        style: const TextStyle(color: AppColors.textPrimary),
                    ),
                    onPressed: isActive ? onStopSession : onStartSession,
                ),
            ],
        );
    }
}
