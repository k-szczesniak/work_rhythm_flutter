import 'package:flutter/material.dart';
import 'package:flutter_foreground_task/flutter_foreground_task.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'services/foreground_service/foreground_service_manager.dart';
import 'services/foreground_service/timer_handler.dart';

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

class WorkRhythmApp extends StatelessWidget {
    const WorkRhythmApp({super.key});

    @override
    Widget build(BuildContext context) {
        return MaterialApp(
            title: 'Work Rhythm',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(
                    seedColor: const Color(0xFF4CAF50),
                    brightness: Brightness.dark,
                ),
                useMaterial3: true,
            ),
            home: const Scaffold(
                backgroundColor: Color(0xFF0F1117),
                body: Center(
                    child: Text(
                        'Work Rhythm — Faza 2 gotowa',
                        style: TextStyle(color: Colors.white),
                    ),
                ),
            ),
        );
    }
}
