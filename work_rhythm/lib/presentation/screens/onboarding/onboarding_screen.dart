import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../theme/app_colors.dart';

class OnboardingScreen extends ConsumerStatefulWidget {

    const OnboardingScreen({super.key});

    @override
    ConsumerState<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends ConsumerState<OnboardingScreen> {

    int _currentPage = 0;

    final PageController _pageController = PageController();

    static const List<_OnboardingPage> _pages = [
        _OnboardingPage(
            icon: Icons.timer_outlined,
            color: AppColors.workGreen,
            title: 'Śledź czas pracy',
            description:
                    'Mierz czas brutto i netto. Aplikacja oblicza ile faktycznie przepracowałeś, odejmując rozproszenia.',
        ),
        _OnboardingPage(
            icon: Icons.bolt,
            color: AppColors.distractionOrange,
            title: 'Oznaczaj rozproszenia',
            description:
                    'Kiedy przerywasz pracę — dodaj rozproszenie. Wybierz kategorię i czas, a Work Rhythm obliczy czas netto.',
        ),
        _OnboardingPage(
            icon: Icons.school_outlined,
            color: AppColors.learningBlue,
            title: 'Planuj naukę',
            description:
                    'Twórz cele nauki i śledź postęp. Nauka automatycznie pauzuje timer pracy.',
        ),
        _OnboardingPage(
            icon: Icons.bar_chart_outlined,
            color: AppColors.successGold,
            title: 'Analizuj raporty',
            description:
                    'Przeglądaj dzienne i tygodniowe raporty. Oś czasu i wykresy pokażą Twoje wzorce pracy.',
        ),
    ];

    @override
    void dispose() {
        _pageController.dispose();
        super.dispose();
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            backgroundColor: AppColors.background,
            body: SafeArea(
                child: Column(
                    children: [
                        Expanded(
                            child: PageView.builder(
                                controller: _pageController,
                                itemCount: _pages.length,
                                onPageChanged: (i) =>
                                        setState(() => _currentPage = i),
                                itemBuilder: (_, i) =>
                                        _PageContent(page: _pages[i]),
                            ),
                        ),
                        _BottomBar(
                            pageCount: _pages.length,
                            currentPage: _currentPage,
                            onNext: _nextPage,
                            onFinish: _finish,
                        ),
                    ],
                ),
            ),
        );
    }

    void _nextPage() {
        _pageController.nextPage(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
        );
    }

    void _finish() {
        context.go('/timer');
    }
}

class _PageContent extends StatelessWidget {

    const _PageContent({required this.page});

    final _OnboardingPage page;

    @override
    Widget build(BuildContext context) {
        return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                    Container(
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                            color: page.color.withValues(alpha: 0.12),
                            shape: BoxShape.circle,
                        ),
                        child: Icon(
                            page.icon,
                            color: page.color,
                            size: 56,
                        ),
                    ),
                    const SizedBox(height: 40),
                    Text(
                        page.title,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            color: AppColors.textPrimary,
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                        ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                        page.description,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            color: AppColors.textSecondary,
                            fontSize: 15,
                            height: 1.5,
                        ),
                    ),
                ],
            ),
        );
    }
}

class _BottomBar extends StatelessWidget {

    const _BottomBar({
        required this.pageCount,
        required this.currentPage,
        required this.onNext,
        required this.onFinish,
    });

    final int pageCount;

    final int currentPage;

    final VoidCallback onNext;

    final VoidCallback onFinish;

    @override
    Widget build(BuildContext context) {
        final isLast = currentPage == pageCount - 1;

        return Padding(
            padding: const EdgeInsets.fromLTRB(24, 0, 24, 32),
            child: Column(
                children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                            pageCount,
                            (i) => AnimatedContainer(
                                duration: const Duration(milliseconds: 200),
                                margin: const EdgeInsets.symmetric(horizontal: 4),
                                width: i == currentPage ? 20 : 8,
                                height: 8,
                                decoration: BoxDecoration(
                                    color: i == currentPage
                                            ? AppColors.workGreen
                                            : AppColors.surfaceVariant,
                                    borderRadius: BorderRadius.circular(4),
                                ),
                            ),
                        ),
                    ),
                    const SizedBox(height: 24),
                    SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.workGreen,
                                padding:
                                        const EdgeInsets.symmetric(vertical: 16),
                            ),
                            onPressed: isLast ? onFinish : onNext,
                            child: Text(
                                isLast ? 'Zacznij' : 'Dalej',
                                style: const TextStyle(
                                    color: AppColors.textPrimary,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                ),
                            ),
                        ),
                    ),
                ],
            ),
        );
    }
}

class _OnboardingPage {

    const _OnboardingPage({
        required this.icon,
        required this.color,
        required this.title,
        required this.description,
    });

    final IconData icon;

    final Color color;

    final String title;

    final String description;
}
