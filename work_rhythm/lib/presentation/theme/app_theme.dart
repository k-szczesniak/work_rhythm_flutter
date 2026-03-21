import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTheme {

    AppTheme._();

    static ThemeData dark([ColorScheme? dynamicScheme]) {
        final scheme = dynamicScheme ??
                ColorScheme.fromSeed(
                    seedColor: AppColors.workGreen,
                    brightness: Brightness.dark,
                );

        return ThemeData(
            useMaterial3: true,
            colorScheme: scheme.copyWith(
                surface: AppColors.surface,
                onSurface: AppColors.textPrimary,
            ),
            scaffoldBackgroundColor: AppColors.background,
            appBarTheme: const AppBarTheme(
                backgroundColor: AppColors.surface,
                foregroundColor: AppColors.textPrimary,
                elevation: 0,
                centerTitle: false,
                titleTextStyle: TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                ),
            ),
            bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                backgroundColor: AppColors.surface,
                selectedItemColor: AppColors.workGreen,
                unselectedItemColor: AppColors.textSecondary,
                type: BottomNavigationBarType.fixed,
                elevation: 8,
            ),
            cardTheme: CardThemeData(
                color: AppColors.surfaceVariant,
                elevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                ),
            ),
            elevatedButtonTheme: ElevatedButtonThemeData(
                style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.workGreen,
                    foregroundColor: AppColors.textPrimary,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 14,
                    ),
                    textStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                    ),
                ),
            ),
            outlinedButtonTheme: OutlinedButtonThemeData(
                style: OutlinedButton.styleFrom(
                    foregroundColor: AppColors.distractionOrange,
                    side: const BorderSide(color: AppColors.distractionOrange),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 14,
                    ),
                    textStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                    ),
                ),
            ),
            textTheme: const TextTheme(
                displayLarge: TextStyle(color: AppColors.textPrimary),
                displayMedium: TextStyle(color: AppColors.textPrimary),
                headlineLarge: TextStyle(color: AppColors.textPrimary),
                headlineMedium: TextStyle(color: AppColors.textPrimary),
                titleLarge: TextStyle(color: AppColors.textPrimary),
                titleMedium: TextStyle(color: AppColors.textSecondary),
                bodyLarge: TextStyle(color: AppColors.textPrimary),
                bodyMedium: TextStyle(color: AppColors.textSecondary),
                labelLarge: TextStyle(color: AppColors.textPrimary),
            ),
            sliderTheme: SliderThemeData(
                activeTrackColor: AppColors.workGreen,
                inactiveTrackColor: AppColors.surfaceVariant,
                thumbColor: AppColors.workGreen,
                overlayColor: AppColors.workGreen.withAlpha(30),
            ),
            switchTheme: SwitchThemeData(
                thumbColor: WidgetStateProperty.resolveWith(
                    (states) => states.contains(WidgetState.selected)
                            ? AppColors.workGreen
                            : AppColors.textSecondary,
                ),
                trackColor: WidgetStateProperty.resolveWith(
                    (states) => states.contains(WidgetState.selected)
                            ? AppColors.workGreen.withAlpha(80)
                            : AppColors.surfaceVariant,
                ),
            ),
        );
    }

    static ThemeData light([ColorScheme? dynamicScheme]) {
        final scheme = dynamicScheme ??
                ColorScheme.fromSeed(
                    seedColor: AppColors.workGreen,
                    brightness: Brightness.light,
                );
        return ThemeData(
            useMaterial3: true,
            colorScheme: scheme,
        );
    }
}
