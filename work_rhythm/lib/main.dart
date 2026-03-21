import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_foreground_task/flutter_foreground_task.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/router/app_router.dart';
import 'presentation/theme/app_theme.dart';
import 'services/foreground_service/foreground_service_manager.dart';
import 'services/foreground_service/timer_handler.dart';
import 'services/notification/notification_scheduler.dart';
import 'services/notification/notification_service.dart';

// Register the task handler entry point before any isolate work.
@pragma('vm:entry-point')
void _startTimerHandlerEntryPoint() {
    FlutterForegroundTask.setTaskHandler(TimerHandler());
}

void main() async {
    WidgetsFlutterBinding.ensureInitialized();
    await ForegroundServiceManager.init();
    runApp(
        const ProviderScope(
            child: WorkRhythmApp(),
        ),
    );
}

class WorkRhythmApp extends ConsumerStatefulWidget {

    const WorkRhythmApp({super.key});

    @override
    ConsumerState<WorkRhythmApp> createState() => _WorkRhythmAppState();
}

class _WorkRhythmAppState extends ConsumerState<WorkRhythmApp> {

    @override
    void initState() {
        super.initState();
        // Kick off async init after the first frame so the ProviderScope is ready.
        WidgetsBinding.instance.addPostFrameCallback((_) {
            ref.read(notificationServiceProvider).init();
            ref.read(notificationSchedulerProvider).start();
        });
    }

    @override
    Widget build(BuildContext context) {
        final router = ref.watch(routerProvider);

        return DynamicColorBuilder(
            builder: (ColorScheme? lightDynamic, ColorScheme? darkDynamic) {
                return MaterialApp.router(
                    title: 'Work Rhythm',
                    debugShowCheckedModeBanner: false,
                    theme: AppTheme.light(lightDynamic),
                    darkTheme: AppTheme.dark(darkDynamic),
                    themeMode: ThemeMode.dark,
                    routerConfig: router,
                );
            },
        );
    }
}
