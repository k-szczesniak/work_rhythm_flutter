import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../presentation/screens/timer/timer_screen.dart';
import '../../presentation/screens/learning/learning_screen.dart';
import '../../presentation/screens/learning/add_goal_screen.dart';
import '../../presentation/screens/reports/reports_screen.dart';
import '../../presentation/screens/settings/settings_screen.dart';
import '../../presentation/screens/onboarding/onboarding_screen.dart';
import '../../presentation/theme/app_colors.dart';

final routerProvider = Provider<GoRouter>((ref) {
    return GoRouter(
        initialLocation: '/timer',
        routes: [
            ShellRoute(
                builder: (context, state, child) => MainScaffold(child: child),
                routes: [
                    GoRoute(
                        path: '/timer',
                        builder: (_, __) => const TimerScreen(),
                    ),
                    GoRoute(
                        path: '/learn',
                        builder: (_, __) => const LearningScreen(),
                    ),
                    GoRoute(
                        path: '/learn/add',
                        builder: (_, __) => const AddGoalScreen(),
                    ),
                    GoRoute(
                        path: '/reports',
                        builder: (_, __) => const ReportsScreen(),
                    ),
                    GoRoute(
                        path: '/settings',
                        builder: (_, __) => const SettingsScreen(),
                    ),
                ],
            ),
            GoRoute(
                path: '/onboarding',
                builder: (_, __) => const OnboardingScreen(),
            ),
        ],
    );
});

class MainScaffold extends StatelessWidget {

    const MainScaffold({super.key, required this.child});

    final Widget child;

    static const List<_NavItem> _items = [
        _NavItem(label: 'Timer', icon: Icons.timer_outlined, path: '/timer'),
        _NavItem(label: 'Nauka', icon: Icons.school_outlined, path: '/learn'),
        _NavItem(label: 'Raporty', icon: Icons.bar_chart_outlined, path: '/reports'),
        _NavItem(label: 'Ustawienia', icon: Icons.settings_outlined, path: '/settings'),
    ];

    @override
    Widget build(BuildContext context) {
        final location = GoRouterState.of(context).uri.toString();
        final currentIndex = _currentIndex(location);

        return Scaffold(
            backgroundColor: AppColors.background,
            body: child,
            bottomNavigationBar: NavigationBar(
                backgroundColor: AppColors.surface,
                indicatorColor: AppColors.workGreen.withValues(alpha: 0.2),
                selectedIndex: currentIndex,
                onDestinationSelected: (index) =>
                        context.go(_items[index].path),
                destinations: _items.map((item) {
                    return NavigationDestination(
                        icon: Icon(item.icon, color: AppColors.textSecondary),
                        selectedIcon: Icon(item.icon, color: AppColors.workGreen),
                        label: item.label,
                    );
                }).toList(),
            ),
        );
    }

    int _currentIndex(String location) {
        for (var i = 0; i < _items.length; i++) {
            if (location.startsWith(_items[i].path)) {
                return i;
            }
        }
        return 0;
    }
}

class _NavItem {

    const _NavItem({
        required this.label,
        required this.icon,
        required this.path,
    });

    final String label;

    final IconData icon;

    final String path;
}
