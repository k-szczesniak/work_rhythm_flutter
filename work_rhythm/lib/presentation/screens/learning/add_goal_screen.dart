import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../theme/app_colors.dart';
import '../../viewmodels/learning_viewmodel.dart';

class AddGoalScreen extends ConsumerStatefulWidget {

    const AddGoalScreen({super.key});

    @override
    ConsumerState<AddGoalScreen> createState() => _AddGoalScreenState();
}

class _AddGoalScreenState extends ConsumerState<AddGoalScreen> {

    final _formKey = GlobalKey<FormState>();

    final _nameController = TextEditingController();

    final _descriptionController = TextEditingController();

    double _targetHours = 10;

    DateTime? _deadline;

    bool _isSaving = false;

    @override
    void dispose() {
        _nameController.dispose();
        _descriptionController.dispose();
        super.dispose();
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            backgroundColor: AppColors.background,
            appBar: AppBar(
                backgroundColor: AppColors.background,
                title: const Text(
                    'Nowy cel nauki',
                    style: TextStyle(color: AppColors.textPrimary),
                ),
                leading: IconButton(
                    icon: const Icon(Icons.close, color: AppColors.textSecondary),
                    onPressed: () => context.pop(),
                ),
            ),
            body: Form(
                key: _formKey,
                child: ListView(
                    padding: const EdgeInsets.all(24),
                    children: [
                        TextFormField(
                            controller: _nameController,
                            style: const TextStyle(color: AppColors.textPrimary),
                            decoration: const InputDecoration(
                                labelText: 'Nazwa celu',
                                labelStyle:
                                        TextStyle(color: AppColors.textSecondary),
                            ),
                            validator: (v) {
                                if (v == null || v.trim().isEmpty) {
                                    return 'Podaj nazwę celu';
                                }
                                return null;
                            },
                        ),
                        const SizedBox(height: 24),
                        TextFormField(
                            controller: _descriptionController,
                            style: const TextStyle(color: AppColors.textPrimary),
                            maxLines: 3,
                            decoration: const InputDecoration(
                                labelText: 'Opis (opcjonalnie)',
                                labelStyle:
                                        TextStyle(color: AppColors.textSecondary),
                            ),
                        ),
                        const SizedBox(height: 24),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                                const Text(
                                    'Cel (godziny)',
                                    style: TextStyle(
                                        color: AppColors.textSecondary,
                                        fontSize: 13,
                                    ),
                                ),
                                Text(
                                    '${_targetHours.round()}h',
                                    style: const TextStyle(
                                        color: AppColors.textPrimary,
                                        fontWeight: FontWeight.w600,
                                    ),
                                ),
                            ],
                        ),
                        Slider(
                            value: _targetHours,
                            min: 1,
                            max: 500,
                            divisions: 499,
                            onChanged: (v) =>
                                    setState(() => _targetHours = v),
                            activeColor: AppColors.learningBlue,
                            inactiveColor: AppColors.surfaceVariant,
                        ),
                        const SizedBox(height: 8),
                        ListTile(
                            contentPadding: EdgeInsets.zero,
                            title: Text(
                                _deadline == null
                                        ? 'Ustaw termin (opcjonalnie)'
                                        : 'Termin: ${DateFormat('d MMMM yyyy', 'pl').format(_deadline!)}',
                                style: const TextStyle(
                                    color: AppColors.textSecondary),
                            ),
                            trailing: const Icon(
                                Icons.calendar_today_outlined,
                                color: AppColors.learningBlue,
                            ),
                            onTap: _pickDeadline,
                        ),
                        const SizedBox(height: 32),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.learningBlue,
                                padding:
                                        const EdgeInsets.symmetric(vertical: 16),
                            ),
                            onPressed: _isSaving ? null : _submit,
                            child: _isSaving
                                    ? const SizedBox(
                                        height: 20,
                                        width: 20,
                                        child: CircularProgressIndicator(
                                            strokeWidth: 2,
                                            color: AppColors.textPrimary,
                                        ),
                                    )
                                    : const Text(
                                        'Zapisz cel',
                                        style: TextStyle(
                                            color: AppColors.textPrimary,
                                            fontSize: 16,
                                        ),
                                    ),
                        ),
                    ],
                ),
            ),
        );
    }

    Future<void> _pickDeadline() async {
        final picked = await showDatePicker(
            context: context,
            initialDate: DateTime.now().add(const Duration(days: 30)),
            firstDate: DateTime.now(),
            lastDate: DateTime.now().add(const Duration(days: 365 * 5)),
            builder: (context, child) => Theme(
                data: Theme.of(context).copyWith(
                    colorScheme: const ColorScheme.dark(
                        primary: AppColors.learningBlue,
                    ),
                ),
                child: child!,
            ),
        );
        if (picked != null) {
            setState(() => _deadline = picked);
        }
    }

    Future<void> _submit() async {
        if (!_formKey.currentState!.validate()) {
            return;
        }
        setState(() => _isSaving = true);
        await ref.read(learningViewmodelProvider.notifier).createGoal(
            name: _nameController.text.trim(),
            targetMinutes: (_targetHours * 60).round(),
            deadline: _deadline,
            description: _descriptionController.text.trim().isEmpty
                    ? null
                    : _descriptionController.text.trim(),
        );
        if (mounted) {
            context.pop();
        }
    }
}
