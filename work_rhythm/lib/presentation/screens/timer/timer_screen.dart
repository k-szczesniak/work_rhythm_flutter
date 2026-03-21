import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../viewmodels/timer_viewmodel.dart';
import '../../widgets/timer/circular_timer_display.dart';
import '../../widgets/timer/daily_progress_bar.dart';
import '../../widgets/timer/distraction_bottom_sheet.dart';
import '../../theme/app_colors.dart';

class TimerScreen extends ConsumerWidget {

    const TimerScreen({super.key});

    @override
    Widget build(BuildContext context, WidgetRef ref) {
        final timerAsync = ref.watch(timerViewmodelProvider);
        final notifier = ref.read(timerViewmodelProvider.notifier);

        ref.listen<AsyncValue<TimerState>>(timerViewmodelProvider, (_, next) {
            final state = next.valueOrNull;
            if (state != null && state.openDistractionSheet) {
                notifier.acknowledgeDistractionSheet();
                DistractionBottomSheet.show(context);
            }
        });

        return Scaffold(
            backgroundColor: AppColors.background,
            appBar: AppBar(
                backgroundColor: AppColors.background,
                title: const Text(
                    'Work Rhythm',
                    style: TextStyle(
                        color: AppColors.textPrimary,
                        fontWeight: FontWeight.w700,
                    ),
                ),
                actions: [
                    IconButton(
                        icon: const Icon(
                            Icons.settings_outlined,
                            color: AppColors.textSecondary,
                        ),
                        onPressed: () => context.go('/settings'),
                    ),
                ],
            ),
            body: timerAsync.when(
                loading: () => const Center(
                    child: CircularProgressIndicator(color: AppColors.workGreen),
                ),
                error: (err, _) => Center(
                    child: Text(
                        'Błąd: $err',
                        style: const TextStyle(color: AppColors.overtimeRed),
                    ),
                ),
                data: (state) => _TimerBody(state: state, notifier: notifier),
            ),
        );
    }
}

class _TimerBody extends StatelessWidget {

    const _TimerBody({required this.state, required this.notifier});

    final TimerState state;

    final TimerViewmodel notifier;

    @override
    Widget build(BuildContext context) {
        return SafeArea(
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                    children: [
                        Expanded(
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                    CircularTimerDisplay(
                                        progress: state.progress,
                                        formattedTime: state.formattedNetTime,
                                        targetLabel: 'netto • cel: ${state.targetSeconds ~/ 3600}h',
                                        isOvertime: state.hasOvertime,
                                    ),
                                    const SizedBox(height: 24),
                                    DailyProgressBar(
                                        netSeconds: state.netSeconds,
                                        targetSeconds: state.targetSeconds,
                                        estimatedEndTime: state.estimatedEndTime,
                                    ),
                                ],
                            ),
                        ),
                        _ActionButtons(state: state, notifier: notifier),
                        const SizedBox(height: 16),
                    ],
                ),
            ),
        );
    }
}

class _ActionButtons extends StatelessWidget {

    const _ActionButtons({required this.state, required this.notifier});

    final TimerState state;

    final TimerViewmodel notifier;

    @override
    Widget build(BuildContext context) {
        final isRunning = state.mode == TimerMode.running;
        final isIdle = state.mode == TimerMode.idle || state.mode == TimerMode.stopped;

        return Row(
            children: [
                Expanded(
                    flex: 2,
                    child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: isRunning
                                    ? AppColors.pauseGray
                                    : AppColors.workGreen,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                        ),
                        icon: Icon(
                            isRunning ? Icons.pause : Icons.play_arrow,
                            color: AppColors.textPrimary,
                        ),
                        label: Text(
                            isRunning ? 'Pauza' : 'Start',
                            style: const TextStyle(
                                color: AppColors.textPrimary,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                            ),
                        ),
                        onPressed: () => _handlePrimaryAction(context, isRunning, isIdle),
                    ),
                ),
                const SizedBox(width: 12),
                Expanded(
                    child: OutlinedButton.icon(
                        style: OutlinedButton.styleFrom(
                            side: const BorderSide(color: AppColors.distractionOrange),
                            padding: const EdgeInsets.symmetric(vertical: 16),
                        ),
                        icon: const Icon(
                            Icons.bolt,
                            color: AppColors.distractionOrange,
                        ),
                        label: const Text(
                            'Rozproszony',
                            style: TextStyle(color: AppColors.distractionOrange),
                        ),
                        onPressed: state.mode == TimerMode.running
                                ? () => DistractionBottomSheet.show(context)
                                : null,
                    ),
                ),
            ],
        );
    }

    void _handlePrimaryAction(BuildContext context, bool isRunning, bool isIdle) {
        if (isIdle) {
            notifier.start();
        } else if (isRunning) {
            notifier.pause();
        } else {
            notifier.resume();
        }
    }
}
