import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../theme/app_colors.dart';

class ReportsScreen extends ConsumerWidget {

    const ReportsScreen({super.key});

    @override
    Widget build(BuildContext context, WidgetRef ref) {
        return const Scaffold(
            backgroundColor: AppColors.background,
            body: Center(
                child: Text(
                    'Raporty — Faza 6',
                    style: TextStyle(color: AppColors.textSecondary),
                ),
            ),
        );
    }
}
