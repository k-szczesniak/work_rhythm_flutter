import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../theme/app_colors.dart';

class LearningScreen extends ConsumerWidget {

    const LearningScreen({super.key});

    @override
    Widget build(BuildContext context, WidgetRef ref) {
        return const Scaffold(
            backgroundColor: AppColors.background,
            body: Center(
                child: Text(
                    'Tryb nauki — Faza 5',
                    style: TextStyle(color: AppColors.textSecondary),
                ),
            ),
        );
    }
}
