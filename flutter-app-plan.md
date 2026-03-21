# Plan Developmentu: Work Rhythm — Aplikacja Flutter do Kontroli Rytmu Pracy

## Overview

Aplikacja mobilna (Android + iOS) do śledzenia czasu pracy zdalnej, rozproszenia i celów nauki z systemem powiadomień i raportami. Budowana w **Flutter** jako projekt nauki tej technologii.

**Główne features:**
- Timer pracy z možliwością oznaczania rozproszenia (kategorie: dom, dziecko, telefon, inne)
- Tryyb nauki — osobne cele i sesje nauki
- Powiadomienia — nadgodziny, przypomnienia o ruchu, progress nauki
- Raporty — timeline dzienia, statystyki tygodniowe, wizualizacje

---

## Architektura projektu

```
lib/
├── data/
│   ├── datasources/        # Drift (SQLite), lokalne repozytoria
│   ├── models/             # Modele danych
│   └── repositories/       # Warstwa dostępu do danych
├── domain/
│   ├── entities/           # Encje biznesowe
│   ├── repositories/       # Interfejsy repozytoriów
│   └── usecases/           # Logika biznesowa
├── presentation/
│   ├── screens/            # Pełne ekrany (pages)
│   ├── widgets/            # Komponenty UI (custom widgets)
│   ├── viewmodels/         # Riverpod Notifiers (state management)
│   └── theme/              # Kolory, style, Material Design tokens
├── services/
│   ├── foreground_service/ # Timer w tle (flutter_foreground_task)
│   └── notification/       # Powiadomienia (flutter_local_notifications)
└── main.dart               # Entry point aplikacji
```

**State management:** Riverpod (reactive, bezpieczny typowo)
**Database:** Drift (SQLite, generowanie kodu)
**Nawigacja:** go_router (deklaratywna, obsługuje deep linking)

---

## Kluczowe paczki

```yaml
dependencies:
  flutter:
    sdk: flutter
  
  # State Management
  riverpod: ^2.x
  flutter_riverpod: ^2.x
  
  # Database
  drift: ^2.x
  sqlite3_flutter_libs: ^0.5.x
  
  # Background Service & Notifications
  flutter_foreground_task: ^8.x
  flutter_local_notifications: ^18.x
  timezone: ^0.9.x
  
  # Navigation
  go_router: ^14.x
  
  # Charts & Visualization
  fl_chart: ^0.65.x
  
  # Utilities
  intl: ^0.19.x
  share_plus: ^7.x
  home_widget: ^0.5.x
  dynamic_color: ^1.7.x
  flutter_launcher_icons: ^0.13.x
  
dev_dependencies:
  flutter_test:
    sdk: flutter
  build_runner: ^2.x
  drift_dev: ^2.x
  custom_lint: ^0.6.x
```

---

## Faza 0 — Dart + Flutter Basics (1 tydzień)

**Cel:** Zapoznać się z Dartem, widgetami i hot reload — bez presji projektu.

**Do nauczenia się:**
- Dart: typy (`int`, `String`, `List<T>`, `Map<K, V>`), `var`, `final`, `const`
- Null safety (`late`, `?`, `!`)
- `async/await`, `Future<T>`, `Stream<T>`
- Widgety: `StatelessWidget`, `StatefulWidget`, lifecycle (`initState`, `dispose`)
- Hot reload w VS Code / Android Studio
- Koncepcja: immutability, widgety jako drzewa

**Zasoby:**
- [flutter.dev/learn](https://flutter.dev/learn) — oficjalny tutorial
- Kurs "Flutter & Dart - The Complete Guide" (Udemy) — Angela Yu lub Maximilian Schwarzmüller
- YouTube: Academind, Traversy Media — Flutter basics

**Deliverables:**
- Uruchomiony emulator/urządzenie Android
- Pierwszy flutter app ("Hello World" z przyciskiem zmieniającym tekst)

---

## Faza 1 — Projekt, architektura i baza danych (2–3 tygodnie)

**Cel:** Skonfigurować projekt, strukturę folderów, bazę danych i repozytoria — logika bez UI.

### Kroki:

1. **Inicjalizacja projektu**
   ```bash
   flutter create work_rhythm
   cd work_rhythm
   ```

2. **Struktura folderów** — stwórz foldery jak w Architektura projektu powyżej

3. **Konfiguracja Drift (SQLite)**
   - Dodaj `drift` i `sqlite3_flutter_libs` do `pubspec.yaml`
   - Stwórz `lib/data/datasources/database.dart` — główna klasa `AppDatabase extends GeneratedDatabase`
   - Zdefiniuj tabele jako klasy z `@DataClassName` i `@TableName`:

   ```dart
   // lib/data/datasources/tables.dart
   class WorkSessions extends Table {
     IntColumn get id => integer().autoIncrement()();
     DateTimeColumn get startTime => dateTime()();
     DateTimeColumn get endTime => dateTime().nullable()();
     TextColumn get status => text()(); // RUNNING, PAUSED, STOPPED
     
     @override
     Set<Column> get primaryKey => {id};
   }

   class DistractionEntries extends Table {
     IntColumn get id => integer().autoIncrement()();
     IntColumn get sessionId => integer()();
     TextColumn get category => text()(); // HOME, CHILD, PHONE, OTHER
     IntColumn get durationSeconds => integer()(); // czas rozproszenia w sekundach
     DateTimeColumn get timestamp => dateTime()();
   }

   class LearningGoals extends Table {
     IntColumn get id => integer().autoIncrement()();
     TextColumn get name => text()();
     IntColumn get targetMinutes => integer()(); // łączny cel w minutach
     DateTimeColumn get deadline => dateTime().nullable()();
     TextColumn get description => text().nullable()();
     DateTimeColumn get createdAt => dateTime()();
   }

   class LearningSessions extends Table {
     IntColumn get id => integer().autoIncrement()();
     IntColumn get goalId => integer()();
     DateTimeColumn get startTime => dateTime()();
     DateTimeColumn get endTime => dateTime().nullable()();
     TextColumn get status => text()();
   }

   class DailyConfigs extends Table {
     IntColumn get id => integer().autoIncrement()();
     DateTimeColumn get date => dateTime()();
     IntColumn get targetHours => integer()(); // domyślnie 8
     IntColumn get reminderIntervalMinutes => integer()(); // domyślnie 30
     TextColumn get categories => text()(); // JSON lista kategorii rozproszeń
   }
   ```

   - Uruchom `flutter pub run build_runner build` — generuje DAO i modele

4. **Repozytoria**
   - `WorkSessionRepository` — obsługuje create, update, list sesji pracy
   - `DistractionRepository` — dodawanie i listowanie rozproszeń
   - `LearningRepository` — zarządzanie celami i sesjami nauki
   - `ConfigRepository` — odczyt/zapis ustawień

5. **Use cases** (domain layer)
   ```dart
   // lib/domain/usecases/start_work_session.dart
   class StartWorkSessionUseCase {
     final WorkSessionRepository repository;
     
     Future<int> call() async {
       return await repository.startSession();
     }
   }

   // lib/domain/usecases/add_distraction.dart
   class AddDistractionUseCase {
     final DistractionRepository repository;
     
     Future<void> call({
       required int sessionId,
       required String category,
       required int durationSeconds,
     }) async {
       return await repository.addDistraction(
         sessionId: sessionId,
         category: category,
         durationSeconds: durationSeconds,
       );
     }
   }
   ```

6. **Testy jednostkowe**
   - Test liczenia czasu netto: czas brutto − suma rozproszeń
   - Test validacji kategorii rozproszeń

**Lekcja Fluttera:** Dart generowanie kodu (`build_runner`), `async/await`, null safety

**Deliverables:**
- Projekt z poprawnie skonfigurowaną bazą Drift
- Działające repozytoria z CRUD operacjami
- Jednostkowe testy logiki biznesowej

---

## Faza 2 — Foreground Service i silnik timera (2 tygodnie)

**Cel:** Timer działa w tle, aktualizuje UI, persystuje stan, obsługuje powiadomienie persistent.

### Kroki:

1. **Konfiguracja uprawnień Android**
   ```xml
   <!-- android/app/src/main/AndroidManifest.xml -->
   <uses-permission android:name="android.permission.FOREGROUND_SERVICE" />
   <uses-permission android:name="android.permission.POST_NOTIFICATIONS" />
   <uses-permission android:name="android.permission.BATTERY_STATS" />
   ```

2. **Implementacja TimerHandler**
   ```dart
   // lib/services/foreground_service/timer_handler.dart
   class TimerHandler extends TaskHandler {
     @override
     Future<void> onStart(DateTime timestamp, TaskStarter starter) async {
       // Inicjalizacja timera
       print('Timer started at $timestamp');
     }

     @override
     Future<void> onRepeatEvent(DateTime timestamp) async {
       // Wywoływane co sekundę
       // 1. Odczytaj aktualną sesję z bazy
       // 2. Zwiększ czas netto
       // 3. Co 30 sekund: persistuj do bazy
       // 4. Wyślij notyfikację do UI (FlutterForegroundTask.sendDataToMain)
       // 5. Aktualizuj persistent notification co minutę
     }

     @override
     void onDestroy(DateTime timestamp) async {
       // Cleanup — zapisz stan ostateczny do bazy
       print('Timer destroyed');
     }
   }
   ```

3. **Persistent Notification**
   - Dwa akcje: "Pauza" i "Rozproszony"
   - Aktualizowana co minutę z aktualnym timerem
   - Klik na notifikację otwiera app

4. **TimerViewModel (Riverpod)**
   ```dart
   // lib/presentation/viewmodels/timer_viewmodel.dart
   final timerProvider = StateNotifierProvider<TimerNotifier, TimerState>((ref) {
     return TimerNotifier(ref);
   });

   class TimerNotifier extends StateNotifier<TimerState> {
     final Ref ref;
     
     TimerNotifier(this.ref) : super(TimerState.initial());

     Future<void> startSession() async {
       // Uruchom Foreground Service
       // Aktualizuj state
     }

     Future<void> pauseSession() async {
       // Pauzuj timer
     }

     Future<void> addDistraction(String category, int durationSeconds) async {
       // Dodaj rozposzenie do bazy
       // Aktualizuj licznik netto
     }
   }
   ```

5. **Obsługa uprawnień**
   - Poproś użytkownika o wyłączenie Battery Optimization dla aplikacji (critical dla niezawodności timera)
   - Obsługa na różnych wersjach Androida (API 26+)

6. **Testy**
   - Timer rzeczywiście działa co sekundę
   - Rozposzenie odejmuje się od czasu netto
   - Persistent state survives app kill/crash

**Lekcja Fluttera:** Izolaty, `flutter_foreground_task`, komunikacja między threadami, Riverpod StateNotifier

**Deliverables:**
- Timer działa w tle nawet gdy aplikacja jest zminimalizowana
- Persistent notification z aktualnymi danymi
- Rozposzenie prawidłowo odliczane

---

## Faza 3 — Główny UI i ekran timera (2 tygodnie)

**Cel:** Piękny i funkcjonalny ekran timera, nawigacja między ekranami, bottom sheet dla rozproszeń.

### Kroki:

1. **Konfiguracja go_router**
   ```dart
   // lib/presentation/router/app_router.dart
   final routerProvider = Provider((ref) {
     return GoRouter(
       routes: [
         GoRoute(
           path: '/',
           builder: (context, state) => const TimerScreen(),
         ),
         GoRoute(
           path: '/learn',
           builder: (context, state) => const LearningScreen(),
         ),
         GoRoute(
           path: '/reports',
           builder: (context, state) => const ReportsScreen(),
         ),
         GoRoute(
           path: '/settings',
           builder: (context, state) => const SettingsScreen(),
         ),
       ],
     );
   });
   ```

2. **TimerScreen (główny ekran)**
   - Duży zegar (CustomPainter lub zwykły Text z `Theme.of(context).textTheme.displayLarge`)
   - Animowany pasek postępu (dzienny: X godzin z Y godzin)
   - Duży przycisk START / PAUZA
   - Przycisk "Byłem rozproszony" otwierający bottom sheet
   - Dolna nawigacja: Timer | Nauka | Raporty | Ustawienia

   ```dart
   // lib/presentation/screens/timer_screen.dart
   class TimerScreen extends ConsumerWidget {
     @override
     Widget build(BuildContext context, WidgetRef ref) {
       final timerState = ref.watch(timerProvider);
       final formattedTime = _formatTime(timerState.netSeconds);

       return Scaffold(
         appBar: AppBar(title: const Text('Work Rhythm')),
         body: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
             Text(
               formattedTime,
               style: Theme.of(context).textTheme.displayLarge,
             ),
             const SizedBox(height: 24),
             LinearProgressIndicator(
               value: timerState.progressToday,
               minHeight: 8,
             ),
             const SizedBox(height: 32),
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
               children: [
                 ElevatedButton(
                   onPressed: () => ref.read(timerProvider.notifier).startSession(),
                   child: const Text('Start'),
                 ),
                 ElevatedButton(
                   onPressed: () => _showDistractionBottomSheet(context, ref),
                   child: const Text('Byłem rozproszony'),
                 ),
               ],
             ),
           ],
         ),
         bottomNavigationBar: BottomNavigationBar(
           items: const [
             BottomNavigationBarItem(icon: Icon(Icons.timer), label: 'Timer'),
             BottomNavigationBarItem(icon: Icon(Icons.school), label: 'Nauka'),
             BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: 'Raporty'),
             BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Ustawienia'),
           ],
           onTap: (index) => _navigateTo(context, index),
         ),
       );
     }

     void _showDistractionBottomSheet(BuildContext context, WidgetRef ref) {
       showModalBottomSheet(
         context: context,
         builder: (context) => DistractionBottomSheet(
           onSubmit: (category, duration) {
             ref.read(timerProvider.notifier).addDistraction(category, duration);
             Navigator.pop(context);
           },
         ),
       );
     }
   }
   ```

3. **DistractionBottomSheet**
   - Suwak od 5 do 60 minut
   - Radio buttons / grid iconów dla kategorii (🏠 Dom, 👶 Dziecko, 📞 Telefon, 🛒 Zakupy, Inne)
   - Przycisk "Zatwierdź"

4. **Ekrany placeholder** (do pełnienia miejsce)
   - LearningScreen
   - ReportsScreen
   - SettingsScreen

5. **Styling**
   - Material 3 design tokens (kolory, typography)
   - Responsywny layout (adaptuję się do różnych rozmiarów ekranów)

**Lekcja Fluttera:** `CustomPainter` (opcjonalnie dla zaawansowanego zegara), animacje (`AnimatedContainer`), `BottomSheet`, Material You design tokens, Riverpod `watch`

**Deliverables:**
- Piękny, funkcjonalny ekran timera
- Nawigacja między 4 głównymi ekranami
- Bottom sheet z kategoriami rozproszeń

---

## Faza 4 — System powiadomień (1–2 tygodnie)

**Cel:** Inteligentne, konfigurowane powiadomienia — brak odrywające uwagę, ale dość informacyjne.

### Kroki:

1. **Konfiguracja flutter_local_notifications**
   ```dart
   // lib/services/notification/notification_service.dart
   class NotificationService {
     static final FlutterLocalNotificationsPlugin _plugin =
         FlutterLocalNotificationsPlugin();

     static Future<void> init() async {
       const androidSettings = AndroidInitializationSettings('app_icon');
       const iosSettings = DarwinInitializationSettings();
       
       await _plugin.initialize(
         const InitializationSettings(
           android: androidSettings,
           iOS: iosSettings,
         ),
       );

       // Utwórz kanały
       await _createNotificationChannels();
     }

     static Future<void> _createNotificationChannels() async {
       // Persistent channel dla aktualnego timera
       const persistentChannel = AndroidNotificationChannel(
         id: 'persistent_timer',
         name: 'Aktualny timer',
         importance: Importance.min,
       );

       // Achievement channel dla osiągnięć
       const achievementChannel = AndroidNotificationChannel(
         id: 'achievement',
         name: 'Osiągnięcia',
         importance: Importance.default,
       );

       // Warning channel dla nadgodzin
       const warningChannel = AndroidNotificationChannel(
         id: 'warning',
         name: 'Ostrzeżenia',
         importance: Importance.high,
       );

       // Reminder channel dla aktywności fizycznej
       const reminderChannel = AndroidNotificationChannel(
         id: 'reminder',
         name: 'Przypomnienia',
         importance: Importance.default,
       );

       await _plugin.resolvePlatformSpecificImplementation<
           AndroidFlutterLocalNotificationsPlugin>()
           ?.createNotificationChannels([
             persistentChannel,
             achievementChannel,
             warningChannel,
             reminderChannel,
           ]);
     }
   }
   ```

2. **Typy powiadomień do zaimplementowania**

   a) **Persistent (ongoing) — Timer w pasku powiadomień**
   ```dart
   static Future<void> showPersistentTimer(
     String formattedTime,
     String progressText,
   ) async {
     const details = NotificationDetails(
       android: AndroidNotificationDetails(
         'persistent_timer',
         'Aktualny timer',
         ongoing: true,
         showProgress: true,
         maxProgress: 100,
         progress: 50,
         actions: [
           AndroidNotificationAction(
             'pause_action',
             'Pauza',
           ),
           AndroidNotificationAction(
             'distraction_action',
             'Byłem rozproszony',
           ),
         ],
       ),
     );

     await _plugin.show(
       999, // notification id
       'Work Rhythm',
       formattedTime,
       details,
     );
   }
   ```

   b) **Cel osiągnięty (8h netto)**
   ```dart
   static Future<void> showGoalAchieved() async {
     const details = NotificationDetails(
       android: AndroidNotificationDetails(
         'achievement',
         'Osiągnięcia',
         importance: Importance.default,
       ),
     );

     await _plugin.show(
       1,
       '✅ Cel dnia przepracowany!',
       'Świetnie! Przepracowałeś dzisiaj 8 godzin netto.',
       details,
     );
   }
   ```

   c) **Nadgodziny (co 30 minut po 8h)**
   ```dart
   static Future<void> showOvertimeWarning(
     int overtimeMinutes,
   ) async {
     final message = 'Nadgodziny: już +${overtimeMinutes}min ponad plan';
     
     const details = NotificationDetails(
       android: AndroidNotificationDetails(
         'warning',
         'Ostrzeżenia',
         importance: Importance.high,
         priority: Priority.high,
       ),
     );

     await _plugin.show(
       2,
       '⚠️ Nadgodziny',
       message,
       details,
     );
   }
   ```

   d) **Aktywność fizyczna (90 minut bez interakcji)**
   ```dart
   static Future<void> showActivityReminder() async {
     const details = NotificationDetails(
       android: AndroidNotificationDetails(
         'reminder',
         'Przypomnienia',
         importance: Importance.default,
       ),
     );

     await _plugin.show(
       3,
       '🏃 Pora na ruch!',
       'Nie poruszałeś się od 90 minut. Weź 10-minutową przerwę.',
       details,
     );
   }
   ```

3. **NotificationScheduler (Riverpod)**
   ```dart
   // lib/services/notification/notification_scheduler.dart
   final notificationSchedulerProvider = StateNotifierProvider<
       NotificationScheduler,
       void>((ref) {
     return NotificationScheduler();
   });

   class NotificationScheduler extends StateNotifier<void> {
     Timer? _overtimeTimer;
     Timer? _activityTimer;

     Future<void> startMonitoring(TimerState timerState) async {
       // Monitoruj nadgodziny
       _overtimeTimer?.cancel();
       _overtimeTimer = Timer.periodic(Duration(minutes: 30), (_) {
         if (timerState.netSeconds > 8 * 3600) {
           final overtimeMinutes =
               (timerState.netSeconds - 8 * 3600) ~/ 60;
           NotificationService.showOvertimeWarning(overtimeMinutes);
         }
       });

       // Monitoruj brak aktywności
       _activityTimer?.cancel();
       _activityTimer = Timer.periodic(Duration(minutes: 90), (_) {
         NotificationService.showActivityReminder();
       });
     }

     void stopMonitoring() {
       _overtimeTimer?.cancel();
       _activityTimer?.cancel();
     }
   }
   ```

4. **Integracja z TimerViewModel**
   - Po rozpoczęciu sesji: uruchom scheduler powiadomień
   - Co 60 sekund: aktualizuj persistent notification
   - Po dodaniu rozproszenia: sprawdź czy trigger nadgodzin/aktywności
   - Po zatrzymaniu sesji: wyłącz schedulery

5. **Testy**
   - Powiadomienie persistent pokazuje się prawidłowo
   - Nadgodziny triggerują się po 8h + X
   - Reminder aktywności pojawia się co 90 minut

**Lekcja Fluttera:** `flutter_local_notifications`, notification channels, background task scheduling, Riverpod StateNotifier dla side effects

**Deliverables:**
- Działające powiadomienia na wszystkie 4 typy
- Persistent timer w pasku notification
- Konfiguracja kanałów Android

---

## Faza 5 — Tryb nauki (1–2 tygodnie)

**Cel:** Osobny tryb czasowy dla nauki ze swoimi celami i raportami.

### Kroki:

1. **LearningGoal i LearningSession encje** (już w Fazie 1, teraz tylko UI)

2. **LearningViewModel (Riverpod)**
   ```dart
   // lib/presentation/viewmodels/learning_viewmodel.dart
   final learningGoalsProvider = FutureProvider.autoDispose<List<LearningGoal>>((ref) {
     return ref.watch(learningRepositoryProvider).getActiveGoals();
   });

   final currentLearningSessionProvider =
       StateNotifierProvider<CurrentLearningSession, LearningSessionState>((ref) {
     return CurrentLearningSession(ref);
   });

   class CurrentLearningSession extends StateNotifier<LearningSessionState> {
     final Ref ref;

     Future<void> startSession(int goalId) async {
       // Zatrzymaj work timer
       await ref.read(timerProvider.notifier).pauseSession();
       
       // Uruchom learning timer
       // Timer zapisywany do bazy w trybie LEARNING
     }

     Future<void> stopSession() async {
       // Zapisz sesję nauki
       // Wznów work timer jeśli był aktywny
     }
   }
   ```

3. **LearningScreen**
   - Lista celów z paskami postępu
   - Informacje: nazwa celu, łączny czas, deadline, procent realizacji
   - Przycisk "+ Nowy cel"
   - Przycisk "Uruchom sesjię" (zmienia ekran na active learning timer)

4. **LearningGoalForm**
   - Pole tekstowe na nazwę
   - Picker na ilość godzin
   - Date picker na deadline
   - Walidacja pól

5. **ActiveLearningScreen** (podczas trwającej sesji)
   - Nazwa aktualnego celu
   - Timer sesji
   - Przycisk "Stop sesję"
   - Zostałoでいる do celu: "Remaining: 13h 30min"

6. **Home Widget (Android widget na ekranie głównym)**
   - Pokazuje aktualny cel nauki
   - Pasek postępu
   - Przycisk "Uruchom" otwierający app

7. **Integracja z powiadomieniami**
   - Po osiągnięciu celu nauki: powiadomienie "Gratulacje! Ukończyłeś XYZ"
   - Reminder nauki: "Pamiętaj o nauce — zostało XYZ do celu"

**Lekcja Fluttera:** `FutureProvider`, `TextEditingController`, data/time pickers, home_widget dla Android Widget, Riverpod dependencies

**Deliverables:**
- CRUD operacje na celach nauki
- Osobny timer nauki (niezależny od work timera)
- Home widget pokazujący postęp

---

## Faza 6 — Raporty i wizualizacje (1–2 tygodnie)

**Cel:** Piękne, informacyjne raporty — timeline dnia, wykresy tygodniowe, statystyki.

### Kroki:

1. **ReportsViewModel (Riverpod)**
   ```dart
   // lib/presentation/viewmodels/reports_viewmodel.dart
   final dailyReportProvider =
       FutureProvider.family<DailyReport, DateTime>((ref, date) async {
     final repository = ref.watch(reportRepositoryProvider);
     return repository.getDailyReport(date);
   });

   final weeklyReportProvider =
       FutureProvider<WeeklyReport>((ref) async {
     final repository = ref.watch(reportRepositoryProvider);
     return repository.getWeeklyReport();
   });
   ```

   gdzie `DailyReport` zawiera:
   ```dart
   class DailyReport {
     final List<TimelineBlock> timeline; // [praca, rozposzenie, nauka, pauza]
     final int totalNetMinutes;
     final int totalGrossMinutes;
     final Map<String, int> distractionsByCategory;
     final int learningMinutes;
   }

   class TimelineBlock {
     final DateTime startTime;
     final DateTime endTime;
     final String type; // WORK, DISTRACTION, LEARNING, BREAK
     final String? category; // dla rozproszeń
   }
   ```

2. **DailyReportScreen**
   - **Timeline visualization** — CustomPainter rysujący kolorowe bloki na osi czasu
     ```dart
     class TimelineWidget extends StatelessWidget {
       final List<TimelineBlock> blocks;
       
       @override
       Widget build(BuildContext context) {
         return CustomPaint(
           painter: TimelinePainter(blocks),
           size: Size(double.infinity, 200),
         );
       }
     }
     ```
   - Legenda kolorów
   - Statystyki pod timelinerem: "5h 30min pracy | 40min rozproszeń | 2h nauki"
   - Tabela rozproszeń po kategorii
   - Przycisk "Eksportuj CSV"

3. **WeeklyReportScreen**
   - Wykres słupkowy (fl_chart) — czyste godziny pracy każdego dnia
   - Linia celu na 8 godzin
   - Statystyki: średnia, procent dni z osiągniętym celem
   - Tabela: dzień, czysta praca, rozproszenia, nauka

4. **CSV Export**
   ```dart
   // lib/services/export/csv_exporter.dart
   Future<void> exportDailyReportToCSV(DailyReport report) async {
     final csv = '''Data,Typ,Czas_start,Czas_koniec,Kategoria,Minuty
   ${report.timeline.map((block) => '${block.startTime},...').join('\n')}
   ''';
     
     // Zapisz do Downloads folder
     // Udostępnij przez share_plus
   }
   ```

5. **Integracja z fl_chart**
   ```dart
   import 'package:fl_chart/fl_chart.dart';

   class WeeklyBarChart extends StatelessWidget {
     final WeeklyReport report;

     @override
     Widget build(BuildContext context) {
       return BarChart(
         BarChartData(
           barGroups: _buildBarGroups(),
           // ...
         ),
       );
     }

     List<BarChartGroupData> _buildBarGroups() {
       return report.dailyHours.asMap().entries.map((e) {
         return BarChartGroupData(
           x: e.key,
           barRods: [
             BarChartRodData(
               toY: e.value.toDouble(),
               color: e.value >= 8 ? Colors.green : Colors.orange,
             ),
           ],
         );
       }).toList();
     }
   }
   ```

6. **Testy**
   - Timeline się prawidłowo renderuje
   - Statystyki są dokładne
   - CSV eksport zawiera prawidłowe dane

**Lekcja Fluttera:** `CustomPaint` dla zaawansowanej grafiki, `fl_chart` do wykresów, `share_plus` do eksportu, Riverpod `family` provider

**Deliverables:**
- Timeline dnia (CustomPaint)
- Wykresy tygodniowe (fl_chart)
- CSV export z share sheet

---

## Faza 7 — Polish i publikacja (1 tydzień)

**Cel:** Gotowa do wydania aplikacja na Google Play.

### Kroki:

1. **SettingsScreen**
   - Dzienny cel godzinowy (slider: 6–12 godzin)
   - Interwały powiadomień (Override dla każdego typu)
   - Kategorie rozproszeń (dodaj/usuń/edytuj)
   - Theme (Light/Dark auto)
   - Informacje o aplikacji

2. **Material You / Dynamic Color**
   ```dart
   // lib/presentation/theme/app_theme.dart
   ThemeData get lightTheme {
     final colorScheme = ColorScheme.fromSeed(
       seedColor: Colors.blue,
       brightness: Brightness.light,
     );
     
     return ThemeData(
       colorScheme: colorScheme,
       useMaterial3: true,
     );
   }
   ```
   - Na Androidzie 12+: automatycznie dostosuj kolory do wallpapera (`dynamic_color` package)

3. **Onboarding**
   - Ekran 1: "Witaj w Work Rhythm! 👋 Kontroluj swój dzień."
   - Ekran 2: "Śledzisz pracę, rozproszenia, naukę."
   - Ekran 3: "Powiadomienia żeby nie stracić czasu."
   - Przycisk "Zaczynamy!"

4. **Icon aplikacji**
   ```bash
   flutter pub run flutter_launcher_icons
   ```
   - Przygotuj 1024x1024 ikonę w `assets/icon.png`
   - flutter_launcher_icons automatycznie generuje wszystkie rozmiary

5. **Publikacja na Google Play**

   a) Konto developera (jednorazowo $25):
   ```
   https://play.google.com/console
   ```

   b) Wygeneruj signed APK:
   ```bash
   flutter build apk --release
   flutter build appbundle --release  # Preferowany format Google Play
   ```

   c) Upload na Google Play Console:
   - Utwórz aplikację
   - Uzupełnij opis, zrzuty ekranu
   - Prześlij app bundle
   - Złoż do review

6. **iOS (opcjonalnie)**
   - Xcode setup (Macbook required)
   - App Store Connect
   - Wydanie aplikacji

7. **Testy finalne**
   - Test na różnych rozmiarach ekranów (phone, tablet)
   - Test na różnych wersjach Androida (API 26+)
   - Performance test (battery drain, memory usage)

**Lekcja Fluttera:** Publikacja na store, signing APK, flavor/environment configurations

**Deliverables:**
- Aplikacja gotowa do wydania
- Profil na Google Play
- Opublikowana aplikacja

---

## Harmonogram całościowy

| Faza | Tygodnie | Główna nauka | Deliverable |
|---|---|---|---|
| 0 — Dart Basics | 1 | Dart, widgety, hot reload | "Hello World" app |
| 1 — Architektura + DB | 2–3 | Drift, Riverpod, null safety | Działające repozytoria |
| 2 — Foreground Service | 2 | Izolaty, background service | Timer w tle |
| 3 — Main UI | 2 | Nawigacja, layouts, Material | Piękny ekran timera |
| 4 — Powiadomienia | 1–2 | Local notifications, scheduling | 4 typy powiadomień |
| 5 — Tryb nauki | 1–2 | Home widgets, state management | Cele i sesje nauki |
| 6 — Raporty | 1–2 | fl_chart, CustomPaint, export | Timeline i wykresy |
| 7 — Polish + Publish | 1 | Publikacja na Play Store | Live aplikacja |

**Łącznie: ~12–14 tygodni** pracy weekendowej (10–15 godzin tygodniowo)

**MVP (Fazy 0–4)** może być gotowy w **~7–8 tygodni** — potem możesz go wydać i zbierać feedback użytkowników.

---

## Kluczowe zagrożenia i mitigacje

| Zagrożenie | Mitygacja |
|---|---|
| Foreground Service nie działa na wszystkich Androidach | Spike w tygodniu 1 Fazy 2 — uruchom proof of concept, przetestuj na emulatorze API 26, 30, 33+ |
| Battery Optimization wyłącza timer | Poproś użytkownika o whitelist w ustawieniach (wymagane na każdym Androidzie) |
| Drift code generation się psuła | Czytaj błędy build_runnera, spróbuj `flutter clean && flutter pub get` |
| Custom UI (timeline) zbyt trudny | Użyj gotowych widgetów zamiast CustomPaint jeśli utkniesz |
| App crashuje przy zmianie orientacji ekranu | Testuj portrait + landscape od początku |

---

## Zasoby edukacyjne

### Flutter & Dart
- [flutter.dev](https://flutter.dev) — oficjalna dokumentacja
- [dart.dev](https://dart.dev) — Dart dokumentacja
- YouTube kanały: Academind, Traversy Media, Reso Coder, Code With Andrea
- Kursy: "Flutter & Dart - The Complete Guide" (Udemy), "Flutter by Google" (Coursera)

### Konkretne biblioteki
- [flutter_foreground_task](https://pub.dev/packages/flutter_foreground_task) — dokumentacja
- [Riverpod docs](https://riverpod.dev) — state management
- [Drift docs](https://drift.simonbinder.eu) — SQLite ORM
- [fl_chart docs](https://github.com/imaNNeoFighT/fl_chart) — wykresy

### Best practices
- [Effective Dart](https://dart.dev/guides/language/effective-dart) — style guide
- [Flutter Architecture Guide](https://docs.flutter.dev/app-architecture/guide)
- [Clean Architecture in Flutter](https://resocoder.com/flutter-clean-architecture)

---

## Notatki dla developera

- **Dart to Kotlin/Swift-like język** — ale bardziej przypomina JavaScript jeśli znasz TypeScript. Fokus na `async/await` i `null safety`.
- **Hot reload zmienia życie** — zaraz po edycji widgetu widzisz zmiany na emulatorze bez restartu.
- **Riverpod > Provider** — newer, bardziej type-safe, rekomendowany.
- **Drift zamiast SQLite raw** — генерирует kod, mniej errorów, dużo czystszej kodu.
- **CustomPaint jest fajny ale ma learning curve** — zacznij od gotowych widgetów, later optimize.
- **Android Background Services to mine pola** — Foreground Service jest wymagany, Battery Optimization musi być wyłączone.
- **Testuj na realnym urządzeniu** — emulator nie zawsze się zachowuje tak samo, szczególnie w kwestii background tasks.

---

## Po ukończeniu MVP

Możliwe kierunki rozwoju:
1. **Synchronizacja danych** — backup do chmury (Firebase Firestore)
2. **Analityka** — trendy: czy działam coraz lepiej czy gorzej?
3. **Integracja z Jira/GitHub** — auto-detect kontekstu pracy
4. **Apple Watch companion app** — timer na zegarku
5. **Dark mode zaawansowany** — Material You na wszystkich Androidach (Android 11 backport)
6. **Gamification** — badges, streaki, social sharing

---

**Powodzenia w projekcie! 🚀**

Masz pytania? Będę wspierał na każdym etapie — start z Fazy 0, zadbaj o fundamenty, a reszta pójdzie gładko.