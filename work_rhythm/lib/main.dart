import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
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
            theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(
                    seedColor: const Color(0xFF4CAF50),
                    brightness: Brightness.dark,
                ),
                useMaterial3: true,
            ),
            home: const Scaffold(
                body: Center(
                    child: Text(
                        'Work Rhythm — Faza 1 gotowa',
                        style: TextStyle(color: Colors.white),
                    ),
                ),
            ),
        );
    }
}
