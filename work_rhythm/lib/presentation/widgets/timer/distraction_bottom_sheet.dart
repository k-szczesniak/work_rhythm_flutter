import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/entities/distraction_entry.dart';
import '../../viewmodels/timer_viewmodel.dart';
import '../../theme/app_colors.dart';

class DistractionBottomSheet extends ConsumerStatefulWidget {

    const DistractionBottomSheet({super.key});

    static Future<void> show(BuildContext context) {
        return showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            backgroundColor: AppColors.surface,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            builder: (_) => const DistractionBottomSheet(),
        );
    }

    @override
    ConsumerState<DistractionBottomSheet> createState() =>
            _DistractionBottomSheetState();
}

class _DistractionBottomSheetState
        extends ConsumerState<DistractionBottomSheet> {

    DistractionCategory _selectedCategory = DistractionCategory.other;

    double _durationMinutes = 5;

    @override
    Widget build(BuildContext context) {
        return Padding(
            padding: EdgeInsets.only(
                left: 24,
                right: 24,
                top: 24,
                bottom: MediaQuery.of(context).viewInsets.bottom + 24,
            ),
            child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                            const Text(
                                'Rozproszenie',
                                style: TextStyle(
                                    color: AppColors.textPrimary,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                ),
                            ),
                            IconButton(
                                icon: const Icon(
                                    Icons.close,
                                    color: AppColors.textSecondary,
                                ),
                                onPressed: () => Navigator.of(context).pop(),
                            ),
                        ],
                    ),
                    const SizedBox(height: 16),
                    const Text(
                        'Kategoria',
                        style: TextStyle(
                            color: AppColors.textSecondary,
                            fontSize: 13,
                        ),
                    ),
                    const SizedBox(height: 8),
                    Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: DistractionCategory.values.map((cat) {
                            final isSelected = cat == _selectedCategory;
                            return ChoiceChip(
                                label: Text(cat.label),
                                selected: isSelected,
                                onSelected: (_) =>
                                        setState(() => _selectedCategory = cat),
                                selectedColor: AppColors.distractionOrange,
                                backgroundColor: AppColors.surfaceVariant,
                                labelStyle: TextStyle(
                                    color: isSelected
                                            ? AppColors.textPrimary
                                            : AppColors.textSecondary,
                                ),
                            );
                        }).toList(),
                    ),
                    const SizedBox(height: 20),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                            const Text(
                                'Czas trwania',
                                style: TextStyle(
                                    color: AppColors.textSecondary,
                                    fontSize: 13,
                                ),
                            ),
                            Text(
                                '${_durationMinutes.round()} min',
                                style: const TextStyle(
                                    color: AppColors.textPrimary,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                ),
                            ),
                        ],
                    ),
                    Slider(
                        value: _durationMinutes,
                        min: 1,
                        max: 120,
                        divisions: 119,
                        onChanged: (v) =>
                                setState(() => _durationMinutes = v),
                        activeColor: AppColors.distractionOrange,
                        inactiveColor: AppColors.surfaceVariant,
                    ),
                    const SizedBox(height: 8),
                    SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.distractionOrange,
                            ),
                            onPressed: _submit,
                            child: const Text('Zapisz rozproszenie'),
                        ),
                    ),
                ],
            ),
        );
    }

    void _submit() {
        ref.read(timerViewmodelProvider.notifier).addDistraction(
            category: _selectedCategory,
            durationSeconds: (_durationMinutes * 60).round(),
        );
        Navigator.of(context).pop();
    }
}
