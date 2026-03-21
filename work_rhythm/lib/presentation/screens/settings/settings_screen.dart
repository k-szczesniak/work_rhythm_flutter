import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../theme/app_colors.dart';

class SettingsScreen extends ConsumerWidget {

    const SettingsScreen({super.key});

    @override
    Widget build(BuildContext context, WidgetRef ref) {
        return const Scaffold(
            backgroundColor: AppColors.background,
            body: Center(
                child: Text(
                    'Ustawienia — Faza 7',
                    style: TextStyle(color: AppColors.textSecondary),
                ),
            ),
        );
    }
}
