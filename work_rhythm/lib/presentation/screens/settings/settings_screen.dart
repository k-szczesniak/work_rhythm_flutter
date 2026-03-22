import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/providers/repository_providers.dart';
import '../../../domain/entities/distraction_entry.dart';
import '../../theme/app_colors.dart';

class SettingsScreen extends ConsumerStatefulWidget {

    const SettingsScreen({super.key});

    @override
    ConsumerState<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends ConsumerState<SettingsScreen> {

    // Cel dzienny
    double _targetHours = 8;
    double _overtimeThresholdMinutes = 15;

    // Powiadomienia
    bool _overtimeNotificationsEnabled = true;
    bool _activityRemindersEnabled = true;
    double _activityReminderMinutes = 90;

    // Kategorie
    List<String> _customCategories = [];

    // Wygląd
    int _themeIndex = 0; // 0=System, 1=Jasny, 2=Ciemny

    bool _loaded = false;

    static final List<String> _defaultCategoryLabels =
            DistractionCategory.values.map((c) => c.label).toList();

    @override
    void initState() {
        super.initState();
        _loadSettings();
    }

    Future<void> _loadSettings() async {
        final repo = ref.read(configRepositoryProvider);
        final results = await Future.wait([
            repo.getTargetHours(),
            repo.getActivityReminderMinutes(),
            repo.getOvertimeNotificationIntervalMinutes(),
            repo.isOvertimeNotificationsEnabled(),
            repo.isActivityRemindersEnabled(),
            repo.getCustomCategories(),
        ]);
        if (!mounted) {
            return;
        }
        setState(() {
            _targetHours = (results[0] as int).toDouble();
            _activityReminderMinutes = (results[1] as int).toDouble();
            _overtimeThresholdMinutes = (results[2] as int).toDouble();
            _overtimeNotificationsEnabled = results[3] as bool;
            _activityRemindersEnabled = results[4] as bool;
            _customCategories = List<String>.from(results[5] as List);
            _loaded = true;
        });
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            backgroundColor: AppColors.background,
            appBar: AppBar(
                backgroundColor: AppColors.background,
                title: const Text(
                    'Ustawienia',
                    style: TextStyle(
                        color: AppColors.textPrimary,
                        fontWeight: FontWeight.w700,
                    ),
                ),
            ),
            body: !_loaded
                    ? const Center(
                        child: CircularProgressIndicator(
                            color: AppColors.workGreen,
                        ),
                    )
                    : ListView(
                        children: [
                            const _SectionHeader(title: 'Cel dzienny'),
                            _sliderTile(
                                label: 'Dzienny cel pracy',
                                valueLabel: '${_targetHours.round()}h',
                                value: _targetHours,
                                min: 6,
                                max: 12,
                                divisions: 12,
                                onChanged: (v) =>
                                        setState(() => _targetHours = v),
                                onChangeEnd: (v) => ref
                                        .read(configRepositoryProvider)
                                        .setTargetHours(v.round()),
                            ),
                            _sliderTile(
                                label: 'Proc nadgodzin po',
                                valueLabel:
                                        '${_overtimeThresholdMinutes.round()} min',
                                value: _overtimeThresholdMinutes,
                                min: 0,
                                max: 60,
                                divisions: 60,
                                onChanged: (v) => setState(
                                    () => _overtimeThresholdMinutes = v,
                                ),
                                onChangeEnd: (v) => ref
                                        .read(configRepositoryProvider)
                                        .setOvertimeNotificationIntervalMinutes(
                                            v.round(),
                                        ),
                            ),
                            const _SectionHeader(title: 'Powiadomienia'),
                            SwitchListTile(
                                title: const Text(
                                    'Powiadomienie o nadgodzinach',
                                    style: TextStyle(
                                        color: AppColors.textPrimary,
                                    ),
                                ),
                                value: _overtimeNotificationsEnabled,
                                activeThumbColor: AppColors.workGreen,
                                onChanged: (v) {
                                    setState(
                                        () => _overtimeNotificationsEnabled = v,
                                    );
                                    ref
                                            .read(configRepositoryProvider)
                                            .setOvertimeNotificationsEnabled(v);
                                },
                            ),
                            SwitchListTile(
                                title: const Text(
                                    'Przypomnienie o aktywności',
                                    style: TextStyle(
                                        color: AppColors.textPrimary,
                                    ),
                                ),
                                value: _activityRemindersEnabled,
                                activeThumbColor: AppColors.workGreen,
                                onChanged: (v) {
                                    setState(
                                        () => _activityRemindersEnabled = v,
                                    );
                                    ref
                                            .read(configRepositoryProvider)
                                            .setActivityRemindersEnabled(v);
                                },
                            ),
                            if (_activityRemindersEnabled)
                                _sliderTile(
                                    label: 'Co ile minut przypomnienie',
                                    valueLabel:
                                            '${_activityReminderMinutes.round()} min',
                                    value: _activityReminderMinutes,
                                    min: 30,
                                    max: 180,
                                    divisions: 30,
                                    onChanged: (v) => setState(
                                        () => _activityReminderMinutes = v,
                                    ),
                                    onChangeEnd: (v) => ref
                                            .read(configRepositoryProvider)
                                            .setActivityReminderMinutes(
                                                v.round(),
                                            ),
                                ),
                            const _SectionHeader(title: 'Kategorie rozproszeń'),
                            ..._defaultCategoryLabels.map(
                                (label) => ListTile(
                                    leading: const Icon(
                                        Icons.label_outline,
                                        color: AppColors.distractionOrange,
                                    ),
                                    title: Text(
                                        label,
                                        style: const TextStyle(
                                            color: AppColors.textPrimary,
                                        ),
                                    ),
                                ),
                            ),
                            ..._customCategories.asMap().entries.map(
                                (entry) => ListTile(
                                    leading: const Icon(
                                        Icons.label_outline,
                                        color: AppColors.textSecondary,
                                    ),
                                    title: Text(
                                        entry.value,
                                        style: const TextStyle(
                                            color: AppColors.textPrimary,
                                        ),
                                    ),
                                    trailing: IconButton(
                                        icon: const Icon(
                                            Icons.delete_outline,
                                            color: AppColors.overtimeRed,
                                        ),
                                        onPressed: () =>
                                                _removeCategory(entry.key),
                                    ),
                                ),
                            ),
                            ListTile(
                                leading: const Icon(
                                    Icons.add,
                                    color: AppColors.workGreen,
                                ),
                                title: const Text(
                                    'Dodaj kategorię',
                                    style: TextStyle(
                                        color: AppColors.workGreen,
                                    ),
                                ),
                                onTap: _addCategory,
                            ),
                            const _SectionHeader(title: 'Wygląd'),
                            Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: 8,
                                ),
                                child: SegmentedButton<int>(
                                    style: SegmentedButton.styleFrom(
                                        selectedBackgroundColor:
                                                AppColors.workGreen,
                                    ),
                                    segments: const [
                                        ButtonSegment(
                                            value: 0,
                                            label: Text('Systemowy'),
                                        ),
                                        ButtonSegment(
                                            value: 1,
                                            label: Text('Jasny'),
                                        ),
                                        ButtonSegment(
                                            value: 2,
                                            label: Text('Ciemny'),
                                        ),
                                    ],
                                    selected: {_themeIndex},
                                    onSelectionChanged: (s) =>
                                            setState(() => _themeIndex = s.first),
                                ),
                            ),
                            const _SectionHeader(title: 'O aplikacji'),
                            const ListTile(
                                leading: Icon(
                                    Icons.info_outline,
                                    color: AppColors.textSecondary,
                                ),
                                title: Text(
                                    'Work Rhythm v1.0.0',
                                    style:
                                            TextStyle(color: AppColors.textPrimary),
                                ),
                            ),
                            ListTile(
                                leading: const Icon(
                                    Icons.download_outlined,
                                    color: AppColors.learningBlue,
                                ),
                                title: const Text(
                                    'Eksportuj wszystkie dane (CSV)',
                                    style:
                                            TextStyle(color: AppColors.textPrimary),
                                ),
                                onTap: () {
                                    // TODO: implement CSV export
                                },
                            ),
                            ListTile(
                                leading: const Icon(
                                    Icons.delete_forever_outlined,
                                    color: AppColors.overtimeRed,
                                ),
                                title: const Text(
                                    'Wyczyść dane',
                                    style:
                                            TextStyle(color: AppColors.overtimeRed),
                                ),
                                onTap: () => _confirmClearData(context),
                            ),
                            const SizedBox(height: 32),
                        ],
                    ),
        );
    }

    Widget _sliderTile({
        required String label,
        required String valueLabel,
        required double value,
        required double min,
        required double max,
        required int divisions,
        required ValueChanged<double> onChanged,
        required ValueChanged<double> onChangeEnd,
    }) {
        return ListTile(
            title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                    Text(
                        label,
                        style:
                                const TextStyle(color: AppColors.textPrimary),
                    ),
                    Text(
                        valueLabel,
                        style: const TextStyle(
                            color: AppColors.workGreen,
                            fontWeight: FontWeight.w600,
                        ),
                    ),
                ],
            ),
            subtitle: Slider(
                value: value,
                min: min,
                max: max,
                divisions: divisions,
                onChanged: onChanged,
                onChangeEnd: onChangeEnd,
                activeColor: AppColors.workGreen,
                inactiveColor: AppColors.surfaceVariant,
            ),
        );
    }

    Future<void> _addCategory() async {
        final controller = TextEditingController();
        final result = await showDialog<String>(
            context: context,
            builder: (ctx) => AlertDialog(
                backgroundColor: AppColors.surface,
                title: const Text(
                    'Nowa kategoria',
                    style: TextStyle(color: AppColors.textPrimary),
                ),
                content: TextField(
                    controller: controller,
                    style: const TextStyle(color: AppColors.textPrimary),
                    decoration: const InputDecoration(
                        hintText: 'Nazwa kategorii',
                        hintStyle: TextStyle(color: AppColors.textDisabled),
                    ),
                    autofocus: true,
                ),
                actions: [
                    TextButton(
                        onPressed: () => Navigator.pop(ctx),
                        child: const Text('Anuluj'),
                    ),
                    TextButton(
                        onPressed: () =>
                                Navigator.pop(ctx, controller.text.trim()),
                        child: const Text('Dodaj'),
                    ),
                ],
            ),
        );
        if (result != null && result.isNotEmpty) {
            setState(() => _customCategories.add(result));
            await ref
                    .read(configRepositoryProvider)
                    .setCustomCategories(_customCategories);
        }
    }

    Future<void> _removeCategory(int index) async {
        setState(() => _customCategories.removeAt(index));
        await ref
                .read(configRepositoryProvider)
                .setCustomCategories(_customCategories);
    }

    Future<void> _confirmClearData(BuildContext context) async {
        final confirmed = await showDialog<bool>(
            context: context,
            builder: (ctx) => AlertDialog(
                backgroundColor: AppColors.surface,
                title: const Text(
                    'Wyczyść dane',
                    style: TextStyle(color: AppColors.overtimeRed),
                ),
                content: const Text(
                    'Czy na pewno chcesz usunąć wszystkie dane? Tej operacji nie można cofnąć.',
                    style: TextStyle(color: AppColors.textSecondary),
                ),
                actions: [
                    TextButton(
                        onPressed: () => Navigator.pop(ctx, false),
                        child: const Text('Anuluj'),
                    ),
                    TextButton(
                        onPressed: () => Navigator.pop(ctx, true),
                        child: const Text(
                            'Usuń',
                            style: TextStyle(color: AppColors.overtimeRed),
                        ),
                    ),
                ],
            ),
        );
        if (confirmed == true) {
            // TODO: implement full data wipe
        }
    }
}

class _SectionHeader extends StatelessWidget {

    const _SectionHeader({required this.title});

    final String title;

    @override
    Widget build(BuildContext context) {
        return Padding(
            padding: const EdgeInsets.fromLTRB(16, 20, 16, 4),
            child: Text(
                title.toUpperCase(),
                style: const TextStyle(
                    color: AppColors.textDisabled,
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1.2,
                ),
            ),
        );
    }
}
