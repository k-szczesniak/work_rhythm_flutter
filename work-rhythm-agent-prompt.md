# Work Rhythm — Instrukcja dla Agenta AI (Scaffold Prompt)

## Jak używać tego dokumentu

Ten plik to kompleksowa instrukcja dla agenta AI (Cursor Agent, Claude, GitHub Copilot Workspace, Aider)
do wygenerowania szkieletu aplikacji Flutter "Work Rhythm".

**Zalecane użycie:**
1. Otwórz agenta AI w pustym folderze projektu
2. Dołącz ten plik jako kontekst systemowy / instrukcję
3. Uruchom agenta z poleceniem startowym z sekcji "Polecenie startowe"
4. Iteruj fazami — nie generuj wszystkiego naraz

---

## Polecenie startowe (wklej do agenta)

```
Jesteś doświadczonym Flutter developerem. Twoim zadaniem jest wygenerowanie aplikacji
mobilnej "Work Rhythm" zgodnie z poniższą specyfikacją. Generuj kod etapami — zacznij
od Fazy 1 (architektura + baza danych). Zawsze stosuj Clean Architecture (data/domain/presentation),
Riverpod do state managementu, Drift do bazy SQLite. Kod pisz w Darcie, stosuj null safety,
używaj immutable state z freezed. Przed każdą fazą wymień pliki które zamierzasz utworzyć,
poczekaj na potwierdzenie, potem generuj.
```

---

## Specyfikacja aplikacji

### Nazwa i opis
- **Nazwa:** Work Rhythm
- **Platforma:** Flutter (Android + iOS)
- **Język UI:** Polski
- **Język kodu:** Angielski (zmienne, klasy, komentarze)
- **Motyw:** Dark mode domyślny, Material Design 3, Dynamic Color (Android 12+)

### Problem który rozwiązuje
Pracownicy zdalni tracą świadomość ile faktycznie przepracowali godzin netto.
Obowiązki domowe przerywają pracę, a brak fizycznego biura sprawia że nadgodziny
są niezauważalne. Aplikacja śledzi czas brutto i pozwala ręcznie oznaczać rozproszenia,
obliczając czas netto. Dodatkowo wspiera planowanie czasu nauki własnej.

---

## Stack technologiczny (wersje obowiązkowe)

```yaml
# pubspec.yaml — użyj dokładnie tych wersji
dependencies:
  flutter:
    sdk: flutter
  flutter_riverpod: ^2.5.1
  riverpod_annotation: ^2.3.5
  drift: ^2.18.0
  sqlite3_flutter_libs: ^0.5.24
  path_provider: ^2.1.3
  path: ^1.9.0
  flutter_foreground_task: ^8.10.0
  flutter_local_notifications: ^18.0.0
  timezone: ^0.9.4
  permission_handler: ^11.3.1
  go_router: ^14.2.7
  fl_chart: ^0.68.0
  intl: ^0.19.0
  share_plus: ^9.0.0
  home_widget: ^0.5.0
  dynamic_color: ^1.7.0
  equatable: ^2.0.5
  freezed_annotation: ^2.4.4
  json_annotation: ^4.9.0

dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^4.0.0
  build_runner: ^2.4.10
  drift_dev: ^2.18.0
  riverpod_generator: ^2.4.3
  freezed: ^2.5.2
  json_serializable: ^6.8.0
  flutter_launcher_icons: ^0.14.1
  custom_lint: ^0.6.4
  riverpod_lint: ^2.3.10
```

---

## Wymagana struktura projektu

Agent MUSI wygenerować dokładnie tę strukturę folderów:

```
lib/
├── data/
│   ├── datasources/
│   │   ├── database.dart              # AppDatabase z Drift
│   │   ├── tables.dart                # Definicje tabel Drift
│   │   └── daos/
│   │       ├── work_session_dao.dart
│   │       ├── distraction_dao.dart
│   │       ├── learning_dao.dart
│   │       └── config_dao.dart
│   ├── models/                        # DTOs (generowane przez freezed)
│   │   ├── work_session_model.dart
│   │   ├── distraction_model.dart
│   │   └── learning_model.dart
│   └── repositories/
│       ├── work_session_repository_impl.dart
│       ├── distraction_repository_impl.dart
│       ├── learning_repository_impl.dart
│       └── config_repository_impl.dart
├── domain/
│   ├── entities/
│   │   ├── work_session.dart
│   │   ├── distraction_entry.dart
│   │   ├── learning_goal.dart
│   │   ├── learning_session.dart
│   │   └── daily_report.dart
│   ├── repositories/                  # Abstrakcyjne interfejsy
│   │   ├── i_work_session_repository.dart
│   │   ├── i_distraction_repository.dart
│   │   ├── i_learning_repository.dart
│   │   └── i_config_repository.dart
│   └── usecases/
│       ├── work/
│       │   ├── start_work_session.dart
│       │   ├── pause_work_session.dart
│       │   ├── stop_work_session.dart
│       │   └── add_distraction.dart
│       ├── learning/
│       │   ├── create_learning_goal.dart
│       │   ├── start_learning_session.dart
│       │   └── stop_learning_session.dart
│       └── reports/
│           ├── get_daily_report.dart
│           └── get_weekly_report.dart
├── presentation/
│   ├── screens/
│   │   ├── timer/
│   │   │   └── timer_screen.dart
│   │   ├── learning/
│   │   │   ├── learning_screen.dart
│   │   │   └── add_goal_screen.dart
│   │   ├── reports/
│   │   │   └── reports_screen.dart
│   │   ├── settings/
│   │   │   └── settings_screen.dart
│   │   └── onboarding/
│   │       └── onboarding_screen.dart
│   ├── widgets/
│   │   ├── timer/
│   │   │   ├── circular_timer_display.dart
│   │   │   ├── daily_progress_bar.dart
│   │   │   └── distraction_bottom_sheet.dart
│   │   ├── learning/
│   │   │   ├── goal_card.dart
│   │   │   └── learning_progress_bar.dart
│   │   └── reports/
│   │       ├── timeline_painter.dart
│   │       └── weekly_bar_chart.dart
│   ├── viewmodels/
│   │   ├── timer_viewmodel.dart
│   │   ├── learning_viewmodel.dart
│   │   └── reports_viewmodel.dart
│   └── theme/
│       ├── app_theme.dart
│       └── app_colors.dart
├── services/
│   ├── foreground_service/
│   │   ├── timer_handler.dart
│   │   └── foreground_service_manager.dart
│   └── notification/
│       ├── notification_service.dart
│       └── notification_scheduler.dart
├── core/
│   ├── constants/
│   │   ├── app_constants.dart
│   │   └── notification_channels.dart
│   ├── extensions/
│   │   ├── duration_extensions.dart
│   │   └── datetime_extensions.dart
│   └── providers/
│       └── repository_providers.dart
└── main.dart
```

---

## Faza 1 — Architektura i baza danych

### Polecenie dla agenta:
```
Wygeneruj Fazę 1: architekturę projektu i bazę danych.
Utwórz: pubspec.yaml, strukturę folderów, wszystkie pliki z warstwy data/ i domain/.
Zacznij od tabel Drift i encji domenowych.
```

### Wymagane tabele Drift (tables.dart):

```dart
// Wszystkie tabele muszą być zaimplementowane dokładnie tak:

class WorkSessions extends Table {
  IntColumn get id => integer().autoIncrement()();
  DateTimeColumn get startTime => dateTime()();
  DateTimeColumn get endTime => dateTime().nullable()();
  TextColumn get status => text().withDefault(const Constant('RUNNING'))();
  // status: RUNNING | PAUSED | STOPPED
  IntColumn get grossSeconds => integer().withDefault(const Constant(0))();
  IntColumn get netSeconds => integer().withDefault(const Constant(0))();
}

class DistractionEntries extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get sessionId => integer().references(WorkSessions, #id)();
  TextColumn get category => text()();
  // category: HOME | CHILD | PHONE | SHOPPING | OTHER
  IntColumn get durationSeconds => integer()();
  DateTimeColumn get timestamp => dateTime()();
}

class LearningGoals extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  IntColumn get targetMinutes => integer()();
  DateTimeColumn get deadline => dateTime().nullable()();
  TextColumn get description => text().nullable()();
  DateTimeColumn get createdAt => dateTime()();
  BoolColumn get isActive => boolean().withDefault(const Constant(true))();
}

class LearningSessions extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get goalId => integer().references(LearningGoals, #id)();
  DateTimeColumn get startTime => dateTime()();
  DateTimeColumn get endTime => dateTime().nullable()();
  IntColumn get durationSeconds => integer().withDefault(const Constant(0))();
  TextColumn get status => text().withDefault(const Constant('RUNNING'))();
  // status: RUNNING | STOPPED
}

class AppConfigs extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get targetHours => integer().withDefault(const Constant(8))();
  IntColumn get activityReminderMinutes => integer().withDefault(const Constant(90))();
  IntColumn get overtimeNotificationIntervalMinutes => integer().withDefault(const Constant(30))();
  BoolColumn get overtimeNotificationsEnabled => boolean().withDefault(const Constant(true))();
  BoolColumn get activityRemindersEnabled => boolean().withDefault(const Constant(true))();
  TextColumn get customCategories => text().nullable()();
  // customCategories: JSON array np. ["Spacer", "Gotowanie"]
}
```

### Wymagane encje domenowe:

```dart
// domain/entities/work_session.dart
@freezed
class WorkSession with _$WorkSession {
  const factory WorkSession({
    required int id,
    required DateTime startTime,
    DateTime? endTime,
    required WorkSessionStatus status,
    required int grossSeconds,
    required int netSeconds,
  }) = _WorkSession;

  const WorkSession._();

  Duration get grossDuration => Duration(seconds: grossSeconds);
  Duration get netDuration => Duration(seconds: netSeconds);
  double progressToGoal(int targetHours) => netSeconds / (targetHours * 3600);
}

enum WorkSessionStatus { running, paused, stopped }

// domain/entities/distraction_entry.dart
@freezed
class DistractionEntry with _$DistractionEntry {
  const factory DistractionEntry({
    required int id,
    required int sessionId,
    required DistractionCategory category,
    required int durationSeconds,
    required DateTime timestamp,
  }) = _DistractionEntry;
}

enum DistractionCategory {
  home('🏠 Dom'),
  child('👶 Dziecko'),
  phone('📞 Telefon'),
  shopping('🛒 Zakupy'),
  other('💬 Inne');

  const DistractionCategory(this.label);
  final String label;
}

// domain/entities/learning_goal.dart
@freezed
class LearningGoal with _$LearningGoal {
  const factory LearningGoal({
    required int id,
    required String name,
    required int targetMinutes,
    DateTime? deadline,
    String? description,
    required DateTime createdAt,
    required bool isActive,
    @Default(0) int completedMinutes,
  }) = _LearningGoal;

  const LearningGoal._();

  double get progressPercent =>
      targetMinutes > 0 ? completedMinutes / targetMinutes : 0.0;
  Duration get remaining =>
      Duration(minutes: (targetMinutes - completedMinutes).clamp(0, targetMinutes));
}

// domain/entities/daily_report.dart
@freezed
class DailyReport with _$DailyReport {
  const factory DailyReport({
    required DateTime date,
    required List<TimelineBlock> timeline,
    required int totalNetMinutes,
    required int totalGrossMinutes,
    required Map<String, int> distractionsByCategory,
    required int learningMinutes,
  }) = _DailyReport;
}

@freezed
class TimelineBlock with _$TimelineBlock {
  const factory TimelineBlock({
    required DateTime startTime,
    required DateTime endTime,
    required TimelineBlockType type,
    String? category,
  }) = _TimelineBlock;
}

enum TimelineBlockType { work, distraction, learning, pause }
```

### Wymagane interfejsy repozytoriów:

```dart
// domain/repositories/i_work_session_repository.dart
abstract class IWorkSessionRepository {
  Future<WorkSession> startSession();
  Future<WorkSession> pauseSession(int sessionId);
  Future<WorkSession> resumeSession(int sessionId);
  Future<WorkSession> stopSession(int sessionId);
  Future<WorkSession?> getActiveSession();
  Future<List<WorkSession>> getSessionsForDate(DateTime date);
  Future<void> updateNetSeconds(int sessionId, int netSeconds);
}

// domain/repositories/i_distraction_repository.dart
abstract class IDistractionRepository {
  Future<DistractionEntry> addDistraction({
    required int sessionId,
    required DistractionCategory category,
    required int durationSeconds,
  });
  Future<List<DistractionEntry>> getDistractionsForSession(int sessionId);
  Future<List<DistractionEntry>> getDistractionsForDate(DateTime date);
  Future<int> getTotalDistractionSeconds(int sessionId);
}

// domain/repositories/i_learning_repository.dart
abstract class ILearningRepository {
  Future<List<LearningGoal>> getActiveGoals();
  Future<LearningGoal> createGoal({
    required String name,
    required int targetMinutes,
    DateTime? deadline,
    String? description,
  });
  Future<LearningSession> startSession(int goalId);
  Future<LearningSession> stopSession(int sessionId);
  Future<LearningSession?> getActiveSession();
  Future<int> getCompletedMinutesForGoal(int goalId);
}
```

---

## Faza 2 — Foreground Service i TimerViewModel

### Polecenie dla agenta:
```
Wygeneruj Fazę 2: Foreground Service i TimerViewModel.
Utwórz: timer_handler.dart, foreground_service_manager.dart, timer_viewmodel.dart.
Timer musi działać w tle, aktualizować persistent notification co minutę,
i komunikować się z UI przez FlutterForegroundTask.sendDataToMain().
```

### Wymagany TimerState:

```dart
// presentation/viewmodels/timer_viewmodel.dart

@freezed
class TimerState with _$TimerState {
  const factory TimerState({
    @Default(TimerMode.idle) TimerMode mode,
    // mode: idle | running | paused | stopped
    int? activeSessionId,
    @Default(0) int grossSeconds,
    @Default(0) int netSeconds,
    @Default(0) int targetSeconds, // cel dzienny w sekundach (domyślnie 8*3600)
    @Default(false) bool goalReached,
    @Default(false) bool hasOvertime,
    @Default(0) int overtimeSeconds,
    DateTime? sessionStart,
  }) = _TimerState;

  const TimerState._();

  double get progress => targetSeconds > 0 ? netSeconds / targetSeconds : 0.0;
  String get formattedNetTime {
    final h = netSeconds ~/ 3600;
    final m = (netSeconds % 3600) ~/ 60;
    final s = netSeconds % 60;
    return '${h.toString().padLeft(2, '0')}:${m.toString().padLeft(2, '0')}:${s.toString().padLeft(2, '0')}';
  }
}

enum TimerMode { idle, running, paused, stopped }
```

### Wymagana konfiguracja Foreground Service:

```dart
// services/foreground_service/foreground_service_manager.dart

class ForegroundServiceManager {
  static Future<void> init() async {
    FlutterForegroundTask.init(
      androidNotificationOptions: AndroidNotificationOptions(
        channelId: 'work_rhythm_persistent',
        channelName: 'Work Rhythm — Timer',
        channelDescription: 'Aktywny licznik czasu pracy',
        channelImportance: NotificationChannelImportance.MIN,
        priority: NotificationPriority.MIN,
        buttons: [
          const NotificationButton(id: 'btn_pause', text: 'Pauza'),
          const NotificationButton(id: 'btn_distraction', text: 'Rozproszony'),
        ],
      ),
      iosNotificationOptions: const IOSNotificationOptions(
        showNotification: true,
        playSound: false,
      ),
      foregroundTaskOptions: const ForegroundTaskOptions(
        eventAction: ForegroundTaskEventAction.repeat(1000),
        autoRunOnBoot: true,
        allowWakeLock: true,
        allowWifiLock: true,
      ),
    );
  }
}
```

---

## Faza 3 — Ekran główny (Timer Screen)

### Polecenie dla agenta:
```
Wygeneruj Fazę 3: główny ekran aplikacji.
Utwórz: timer_screen.dart, circular_timer_display.dart, daily_progress_bar.dart,
distraction_bottom_sheet.dart, app_theme.dart, main.dart z go_router.
Zastosuj Material Design 3 z dark mode, kolory jak w specyfikacji.
```

### Wymagane kolory (app_colors.dart):

```dart
class AppColors {
  // Tła
  static const background = Color(0xFF0F1117);
  static const surface = Color(0xFF1A1D26);
  static const surfaceVariant = Color(0xFF252836);

  // Akcenty
  static const workGreen = Color(0xFF4CAF50);      // aktywna praca
  static const distractionOrange = Color(0xFFFF9800); // rozproszenie
  static const learningBlue = Color(0xFF2196F3);   // nauka
  static const pauseGray = Color(0xFF616161);      // pauza/przerwa

  // Tekst
  static const textPrimary = Color(0xFFFFFFFF);
  static const textSecondary = Color(0xFF9E9E9E);
  static const textDisabled = Color(0xFF424242);

  // Overtime
  static const overtimeRed = Color(0xFFEF5350);

  // Success
  static const successGold = Color(0xFFFFD700);
}
```

### Wymagany layout TimerScreen:

```
TimerScreen layout (od góry do dołu):
1. AppBar: "Work Rhythm" + ikona ustawień po prawej
2. Środek ekranu (Expanded):
   a. CircularTimerDisplay — koło postępu z czasem netto w środku
      - Duży tekst: "05:23:14" (HH:MM:SS)
      - Mały tekst pod nim: "netto • cel: 8h"
      - Kolor łuku: zielony gdy normalne, czerwony gdy nadgodziny
   b. SizedBox(height: 24)
   c. DailyProgressBar — poziomy pasek 67% z tekstem "5h 23min z 8h"
   d. SizedBox(height: 8)
   e. Text prognoza: "Koniec pracy ok. 17:45" (szary, mały)
3. Przyciski akcji (Row):
   - ElevatedButton "▶ Start" / "⏸ Pauza" (zielony, duży)
   - OutlinedButton "⚡ Rozproszony" (pomarańczowy outline)
4. SizedBox(height: 16)
5. BottomNavigationBar: Timer | Nauka | Raporty | Ustawienia
```

### Wymagana nawigacja (app_router.dart):

```dart
final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/timer',
    routes: [
      ShellRoute(
        builder: (context, state, child) => MainScaffold(child: child),
        routes: [
          GoRoute(path: '/timer', builder: (_, __) => const TimerScreen()),
          GoRoute(path: '/learn', builder: (_, __) => const LearningScreen()),
          GoRoute(path: '/learn/add', builder: (_, __) => const AddGoalScreen()),
          GoRoute(path: '/reports', builder: (_, __) => const ReportsScreen()),
          GoRoute(path: '/settings', builder: (_, __) => const SettingsScreen()),
        ],
      ),
      GoRoute(path: '/onboarding', builder: (_, __) => const OnboardingScreen()),
    ],
  );
});
```

---

## Faza 4 — System powiadomień

### Polecenie dla agenta:
```
Wygeneruj Fazę 4: system powiadomień.
Utwórz: notification_service.dart i notification_scheduler.dart.
Zaimplementuj 5 typów powiadomień z osobnymi kanałami Android.
NotificationScheduler ma być Riverpod StateNotifier monitorujący TimerState.
```

### Wymagane kanały i typy:

```dart
// core/constants/notification_channels.dart
class NotificationChannels {
  static const persistentTimerId = 'work_rhythm_persistent';
  static const achievementId = 'work_rhythm_achievement';
  static const overtimeId = 'work_rhythm_overtime';
  static const activityId = 'work_rhythm_activity';
  static const learningId = 'work_rhythm_learning';
}

// Typy powiadomień do zaimplementowania:
// 1. showPersistentTimer(String netTime, double progress)
//    — id: 1, on-going, aktualizowany co minutę
//    — akcje: 'Pauza', 'Rozproszony'

// 2. showGoalAchieved(int targetHours)
//    — id: 2, jednorazowe po osiągnięciu celu
//    — tytuł: '✅ Cel dnia przepracowany!'
//    — body: 'Świetnie! Przepracowałeś ${targetHours}h netto.'

// 3. showOvertimeWarning(int overtimeMinutes)
//    — id: 3, powtarzalne co 30 min
//    — tytuł: '⚠️ Nadgodziny'
//    — body: 'Pracujesz już +${overtimeMinutes}min ponad plan'

// 4. showActivityReminder()
//    — id: 4, trigger po 90 min bezczynności
//    — tytuł: '🏃 Pora na ruch!'
//    — body: 'Nie ruszyłeś się od 90 minut. Weź krótką przerwę.'

// 5. showLearningReminder(String goalName, int remainingMinutes)
//    — id: 5, konfigurowalny czas
//    — tytuł: '📚 Pamiętaj o nauce'
//    — body: 'Cel "${goalName}" — zostało ${remainingMinutes}min do celu tygodniowego'
```

---

## Faza 5 — Tryb nauki

### Polecenie dla agenta:
```
Wygeneruj Fazę 5: tryb nauki.
Utwórz: learning_screen.dart, add_goal_screen.dart, goal_card.dart,
learning_viewmodel.dart.
Sesja nauki musi pauzować work timer jeśli jest aktywny.
Pokazuj pasek postępu i szacowany czas ukończenia celu.
```

### Wymagany LearningState:

```dart
@freezed
class LearningState with _$LearningState {
  const factory LearningState({
    @Default([]) List<LearningGoal> goals,
    LearningSession? activeSession,
    LearningGoal? activeGoal,
    @Default(0) int currentSessionSeconds,
    @Default(false) bool isLoading,
    String? error,
  }) = _LearningState;
}
```

### Wymagany layout GoalCard:

```
GoalCard widget:
- Card z elevation, rounded corners (12px)
- Header Row: nazwa celu (bold) + badge deadline (jeśli jest)
- LinearProgressIndicator (niebieski, grubość 6px)
- Row stats: "Xh Ymin z Zh" po lewej | "DD% ukończono" po prawej
- Row dolny: Text "Zostało: Xh Ymin" | ElevatedButton "▶ Sesja" po prawej
```

---

## Faza 6 — Raporty

### Polecenie dla agenta:
```
Wygeneruj Fazę 6: ekran raportów.
Utwórz: reports_screen.dart, timeline_painter.dart, weekly_bar_chart.dart.
TimelinePainter musi rysować kolorowe bloki na osi czasu 00:00-23:59 za pomocą CustomPainter.
WeeklyBarChart używa fl_chart z linią celu 8h.
```

### Wymagany TimelinePainter:

```dart
// Specyfikacja CustomPainter dla timeline dnia:
// - Oś X: czas od startTime do endTime sesji (lub 9:00-18:00 domyślnie)
// - Wysokość canvasu: 80px
// - Bloki kolorowe:
//   WORK -> AppColors.workGreen
//   DISTRACTION -> AppColors.distractionOrange
//   LEARNING -> AppColors.learningBlue
//   PAUSE -> AppColors.pauseGray (50% opacity)
// - Każdy blok: zaokrąglone rogi (radius 4)
// - Oś czasu pod blokami: godziny co 1h (szare etykiety, mały font)
// - Tooltip po tapnięciu bloku: typ + czas trwania (opcjonalnie)
```

### Wymagany WeeklyBarChart:

```dart
// Specyfikacja fl_chart BarChart:
// - 7 słupków (pon-nie)
// - Kolor słupka:
//   < 8h -> AppColors.distractionOrange
//   >= 8h -> AppColors.workGreen
//   weekend -> AppColors.pauseGray
// - Linia pozioma (horizontal line) na y=8 (cel 8h), kolor biały 30% opacity, linia przerywana
// - Oś Y: 0-12h, co 2h
// - Oś X: etykiety "Pn Wt Śr Cz Pt Sb Nd"
// - Tooltip po tapnięciu: "Xh Ymin netto"
```

---

## Faza 7 — Settings i Polish

### Polecenie dla agenta:
```
Wygeneruj Fazę 7: ekran ustawień, onboarding i konfigurację AndroidManifest.
Utwórz: settings_screen.dart, onboarding_screen.dart, zaktualizuj AndroidManifest.xml.
Dodaj obsługę Dynamic Color (Android 12+) w app_theme.dart.
```

### Wymagane uprawnienia AndroidManifest.xml:

```xml
<!-- Wszystkie wymagane uprawnienia: -->
<uses-permission android:name="android.permission.FOREGROUND_SERVICE" />
<uses-permission android:name="android.permission.FOREGROUND_SERVICE_DATA_SYNC" />
<uses-permission android:name="android.permission.POST_NOTIFICATIONS" />
<uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED" />
<uses-permission android:name="android.permission.REQUEST_IGNORE_BATTERY_OPTIMIZATIONS" />
<uses-permission android:name="android.permission.WAKE_LOCK" />
<uses-permission android:name="android.permission.SCHEDULE_EXACT_ALARM" />

<!-- W <application>: -->
<service
    android:name="com.pravera.flutter_foreground_task.service.ForegroundService"
    android:foregroundServiceType="dataSync"
    android:stopWithTask="false" />

<receiver
    android:name="com.pravera.flutter_foreground_task.receiver.TaskRestartReceiver"
    android:exported="false">
  <intent-filter>
    <action android:name="android.intent.action.BOOT_COMPLETED" />
  </intent-filter>
</receiver>
```

### Wymagane sekcje SettingsScreen:

```
SettingsScreen — ListTile sections:

Sekcja "Cel dzienny"
- [Slider] Dzienny cel pracy: 6h — 12h (krok 0.5h)
- [Slider] Próg nadgodzin (ostrzeżenie po X min): 0–60 min

Sekcja "Powiadomienia"
- [Switch] Powiadomienie o nadgodzinach
- [Switch] Przypomnienie o aktywności fizycznej
- [Slider] Co ile minut przypomnienie o ruchu: 30–180 min

Sekcja "Kategorie rozproszeń"
- Lista edytowalnych kategorii z ikonami
- Przycisk "Dodaj kategorię"

Sekcja "Wygląd"
- [SegmentedButton] Motyw: Systemowy | Jasny | Ciemny

Sekcja "O aplikacji"
- Wersja aplikacji
- Przycisk "Eksportuj wszystkie dane (CSV)"
- Przycisk "Wyczyść dane"
```

---

## Testy jednostkowe (wymagane)

### Polecenie dla agenta:
```
Wygeneruj testy jednostkowe dla use cases.
Każdy use case musi mieć osobny plik testowy z co najmniej 3 testami.
Używaj Mockito do mockowania repozytoriów.
```

```dart
// Wymagane testy:

// test/domain/usecases/add_distraction_test.dart
// - test: 'should subtract distraction time from net seconds'
// - test: 'should not subtract if session is stopped'
// - test: 'should throw if session not found'

// test/domain/usecases/start_work_session_test.dart
// - test: 'should create new session when no active session exists'
// - test: 'should throw if active session already exists'
// - test: 'should set status to RUNNING'

// test/domain/usecases/get_daily_report_test.dart
// - test: 'should return correct net time after distractions'
// - test: 'should build timeline blocks in chronological order'
// - test: 'should return empty report for day with no sessions'
```

---

## Checklist dla agenta po każdej fazie

Po wygenerowaniu każdej fazy, agent MUSI sprawdzić:

- [ ] Czy wszystkie importy są poprawne?
- [ ] Czy użyto null safety (`?`, `!`, `late`) poprawnie?
- [ ] Czy `freezed` klasy mają `@freezed` dekorator i `_$ClassName` mixin?
- [ ] Czy Riverpod providery są zdefiniowane na poziomie globalnym (nie w klasach)?
- [ ] Czy `ref.watch()` jest używane TYLKO w `build()` metodach?
- [ ] Czy `ref.read()` jest używane w metodach eventów (onPressed itp.)?
- [ ] Czy Drift DAO jest `abstract class`?
- [ ] Czy `build_runner` komendy są wymienione po generowaniu kodu?

### Komendy do uruchomienia po Fazie 1 i po każdej zmianie modeli:
```bash
flutter pub get
flutter pub run build_runner build --delete-conflicting-outputs
flutter analyze
flutter test
```

---

## Dodatkowe wytyczne dla agenta

1. **Nie używaj GetX ani BLoC** — tylko Riverpod
2. **Nie używaj StatefulWidget** tam gdzie można użyć ConsumerWidget + Riverpod
3. **Nie używaj shared_preferences** — config idzie do Drift (AppConfigs table)
4. **Nie używaj Navigator.push** — tylko go_router context.go() / context.push()
5. **Każdy ekran to ConsumerWidget** (lub ConsumerStatefulWidget jeśli potrzeba lifecycle)
6. **Kolory zawsze z AppColors** — nigdy hardcoded hex w widgetach
7. **Teksty UI zawsze po polsku** — zmienne i metody po angielsku
8. **Zawsze obsługuj loading i error state** — każdy FutureProvider ma obsługę AsyncValue
9. **Żadnych print()** w kodzie produkcyjnym — użyj `debugPrint()` lub usuń
10. **Ikona aplikacji:** zielony zegar z falą — opisz generację przez flutter_launcher_icons

---

## Przykładowy prompt iteracyjny (copy-paste dla każdej fazy)

```
Kontynuujemy projekt Work Rhythm. Aktualnie jesteśmy w [FAZA N].
[Dołącz: work-rhythm-tech-context.md]

Poprzednie fazy są ukończone. Wygeneruj teraz [OPIS FAZY].
Pamiętaj o:
- Clean Architecture (data/domain/presentation)
- Riverpod do state managementu
- Drift do bazy danych
- Null safety
- Polskim języku w UI

Zacznij od listy plików które zamierzasz wygenerować, poczekaj na mój "OK", 
potem generuj każdy plik osobno z pełną zawartością.
```
