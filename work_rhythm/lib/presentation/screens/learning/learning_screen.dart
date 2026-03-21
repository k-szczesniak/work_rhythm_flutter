import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../theme/app_colors.dart';
import '../../viewmodels/learning_viewmodel.dart';
import '../../widgets/learning/goal_card.dart';

class LearningScreen extends ConsumerWidget {

    const LearningScreen({super.key});

    @override
    Widget build(BuildContext context, WidgetRef ref) {
        final learningAsync = ref.watch(learningViewmodelProvider);

        return Scaffold(
            backgroundColor: AppColors.background,
            appBar: AppBar(
                backgroundColor: AppColors.background,
                title: const Text(
                    'Nauka',
                    style: TextStyle(
                        color: AppColors.textPrimary,
                        fontWeight: FontWeight.w700,
                    ),
                ),
                actions: [
                    IconButton(
                        icon: const Icon(
                            Icons.add,
                            color: AppColors.learningBlue,
                        ),
                        onPressed: () => context.push('/learn/add'),
                    ),
                ],
            ),
            body: learningAsync.when(
                loading: () => const Center(
                    child: CircularProgressIndicator(
                        color: AppColors.learningBlue,
                    ),
                ),
                error: (err, _) => Center(
                    child: Text(
                        'Błąd: $err',
                        style: const TextStyle(color: AppColors.overtimeRed),
                    ),
                ),
                data: (state) => _LearningBody(state: state),
            ),
        );
    }
}

class _LearningBody extends ConsumerWidget {

    const _LearningBody({required this.state});

    final LearningState state;

    @override
    Widget build(BuildContext context, WidgetRef ref) {
        final notifier = ref.read(learningViewmodelProvider.notifier);

        if (state.goals.isEmpty) {
            return Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                        const Icon(
                            Icons.school_outlined,
                            color: AppColors.textDisabled,
                            size: 64,
                        ),
                        const SizedBox(height: 16),
                        const Text(
                            'Brak celów nauki',
                            style: TextStyle(
                                color: AppColors.textSecondary,
                                fontSize: 16,
                            ),
                        ),
                        const SizedBox(height: 8),
                        TextButton(
                            onPressed: () => context.push('/learn/add'),
                            child: const Text(
                                'Dodaj pierwszy cel',
                                style: TextStyle(color: AppColors.learningBlue),
                            ),
                        ),
                    ],
                ),
            );
        }

        return RefreshIndicator(
            color: AppColors.learningBlue,
            onRefresh: notifier.refresh,
            child: ListView.separated(
                padding: const EdgeInsets.all(16),
                itemCount: state.goals.length,
                separatorBuilder: (_, __) => const SizedBox(height: 12),
                itemBuilder: (context, index) {
                    final goal = state.goals[index];
                    final isActive = state.activeSession?.goalId == goal.id;

                    return GoalCard(
                        goal: goal,
                        isActive: isActive,
                        onStartSession: () => notifier.startSession(goal.id),
                        onStopSession: isActive ? notifier.stopSession : null,
                    );
                },
            ),
        );
    }
}
