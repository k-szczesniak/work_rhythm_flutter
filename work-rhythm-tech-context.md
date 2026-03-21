# Work Rhythm — Techniczny Kontekst Projektu

## Stack technologiczny

| Warstwa | Technologia | Uzasadnienie |
|---|---|---|
| Framework | Flutter (Dart) | Cross-platform Android + iOS, jedna baza kodu |
| State Management | Riverpod ^2.x | Type-safe, reactive, lepszy od Provider |
| Baza danych | Drift ^2.x (SQLite) | ORM z generowaniem kodu, odpowiednik Spring Data JPA |
| Nawigacja | go_router ^14.x | Deklaratywna, deep linking |
| Background Service | flutter_foreground_task ^8.x | Timer w tle na Androidzie |
| Powiadomienia | flutter_local_notifications ^18.x | Lokalne powiadomienia, kanały Android |
| Wykresy | fl_chart ^0.65.x | Timeline i wykresy słupkowe |
| Eksport | share_plus ^7.x | Natywny share sheet |
| Home Widget | home_widget ^0.5.x | Android widget na ekranie głównym |
| Styling | dynamic_color ^1.7.x | Material You / Android 12+ |

## Architektura projektu (Clean Architecture + MVVM)

```
lib/
├── data/
│   ├── datasources/
│   │   └── database.dart          # AppDatabase (Drift), tabele, DAO
│   ├── models/                    # Data Transfer Objects
│   └── repositories/              # Implementacje repozytoriów
│       ├── work_session_repository_impl.dart
│       ├── distraction_repository_impl.dart
│       ├── learning_repository_impl.dart
│       └── config_repository_impl.dart
├── domain/
│   ├── entities/                  # Czyste encje biznesowe (bez frameworka)
│   │   ├── work_session.dart
│   │   ├── distraction_entry.dart
│   │   ├── learning_goal.dart
│   │   └── learning_session.dart
│   ├── repositories/              # Interfejsy (abstrakcje)
│   └── usecases/                  # Logika biznesowa
│       ├── start_work_session.dart
│       ├── stop_work_session.dart
│       ├── add_distraction.dart
│       ├── calculate_net_time.dart
│       └── get_daily_report.dart
├── presentation/
│   ├── screens/
│   │   ├── timer_screen.dart
│   │   ├── learning_screen.dart
│   │   ├── reports_screen.dart
│   │   └── settings_screen.dart
│   ├── widgets/                   # Reużywalne komponenty UI
│   │   ├── distraction_bottom_sheet.dart
│   │   ├── timer_display.dart
│   │   ├── daily_progress_bar.dart
│   │   └── timeline_widget.dart   # CustomPainter timeline
│   ├── viewmodels/                # Riverpod Notifiers
│   │   ├── timer_viewmodel.dart
│   │   ├── learning_viewmodel.dart
│   │   └── reports_viewmodel.dart
│   └── theme/
│       └── app_theme.dart         # Material 3, kolory, typography
├── services/
│   ├── foreground_service/
│   │   └── timer_handler.dart     # TaskHandler (flutter_foreground_task)
│   └── notification/
│       ├── notification_service.dart   # Kanały, typy powiadomień
│       └── notification_scheduler.dart # Logika wyzwalaczy
└── main.dart
```

## Schemat bazy danych (Drift / SQLite)

```dart
// WorkSessions
class WorkSessions extends Table {
  IntColumn get id => integer().autoIncrement()();
  DateTimeColumn get startTime => dateTime()();
  DateTimeColumn get endTime => dateTime().nullable()();
  TextColumn get status => text()(); // RUNNING | PAUSED | STOPPED
  IntColumn get grossSeconds => integer().withDefault(const Constant(0))();
  IntColumn get netSeconds => integer().withDefault(const Constant(0))();
}

// DistractionEntries
class DistractionEntries extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get sessionId => integer().references(WorkSessions, #id)();
  TextColumn get category => text()(); // HOME | CHILD | PHONE | SHOPPING | OTHER
  IntColumn get durationSeconds => integer()();
  DateTimeColumn get timestamp => dateTime()();
}

// LearningGoals
class LearningGoals extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  IntColumn get targetMinutes => integer()();
  DateTimeColumn get deadline => dateTime().nullable()();
  TextColumn get description => text().nullable()();
  DateTimeColumn get createdAt => dateTime()();
  BoolColumn get isActive => boolean().withDefault(const Constant(true))();
}

// LearningSessions
class LearningSessions extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get goalId => integer().references(LearningGoals, #id)();
  DateTimeColumn get startTime => dateTime()();
  DateTimeColumn get endTime => dateTime().nullable()();
  IntColumn get durationSeconds => integer().withDefault(const Constant(0))();
  TextColumn get status => text()(); // RUNNING | STOPPED
}

// DailyConfigs
class DailyConfigs extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get targetHours => integer().withDefault(const Constant(8))();
  IntColumn get activityReminderMinutes => integer().withDefault(const Constant(90))();
  IntColumn get overtimeNotificationMinutes => integer().withDefault(const Constant(30))();
  TextColumn get customCategories => text().nullable()(); // JSON array
}
```

## Kluczowe modele domenowe

```dart
// domain/entities/work_session.dart
class WorkSession {
  final int id;
  final DateTime startTime;
  final DateTime? endTime;
  final WorkSessionStatus status;
  final int grossSeconds;
  final int netSeconds; // grossSeconds − suma rozproszeń

  Duration get grossDuration => Duration(seconds: grossSeconds);
  Duration get netDuration => Duration(seconds: netSeconds);
  double get progressToGoal => netSeconds / (goalHours * 3600); // 0.0 - 1.0+
}

enum WorkSessionStatus { running, paused, stopped }

// domain/entities/distraction_entry.dart
class DistractionEntry {
  final int id;
  final int sessionId;
  final DistractionCategory category;
  final int durationSeconds;
  final DateTime timestamp;
}

enum DistractionCategory { home, child, phone, shopping, other }

// domain/entities/learning_goal.dart
class LearningGoal {
  final int id;
  final String name;
  final int targetMinutes;
  final DateTime? deadline;
  final int completedMinutes; // suma z LearningSessions

  double get progressPercent => completedMinutes / targetMinutes; // 0.0 - 1.0+
  Duration get remaining => Duration(minutes: targetMinutes - completedMinutes);
  DateTime? get estimatedCompletion; // wyliczane na podstawie średniego tempa
}
```

## State Management — Riverpod providers

```dart
// Główne providery aplikacji

// Timer state
final timerProvider = StateNotifierProvider<TimerNotifier, TimerState>((ref) {
  return TimerNotifier(ref);
});

// Lista celów nauki
final learningGoalsProvider = FutureProvider.autoDispose<List<LearningGoal>>((ref) {
  return ref.watch(learningRepositoryProvider).getActiveGoals();
});

// Aktywna sesja nauki
final activeLearningSessionProvider =
    StateNotifierProvider<LearningSessionNotifier, LearningSessionState>((ref) {
  return LearningSessionNotifier(ref);
});

// Raport dzienny
final dailyReportProvider =
    FutureProvider.family<DailyReport, DateTime>((ref, date) {
  return ref.watch(reportRepositoryProvider).getDailyReport(date);
});

// Konfiguracja
final appConfigProvider = FutureProvider<AppConfig>((ref) {
  return ref.watch(configRepositoryProvider).getConfig();
});
```

## Foreground Service — kluczowe szczegóły

Paczka: `flutter_foreground_task`

```dart
// Konfiguracja startowa (wywoływana przy pierwszym uruchomieniu timera)
FlutterForegroundTask.init(
  androidNotificationOptions: AndroidNotificationOptions(
    channelId: 'work_rhythm_timer',
    channelName: 'Work Rhythm Timer',
    channelImportance: NotificationChannelImportance.MIN,
    priority: NotificationPriority.MIN,
    buttons: [
      const NotificationButton(id: 'pause', text: 'Pauza'),
      const NotificationButton(id: 'distraction', text: 'Rozproszony'),
    ],
  ),
  foregroundTaskOptions: const ForegroundTaskOptions(
    eventAction: ForegroundTaskEventAction.repeat(1000), // co sekundę
    autoRunOnBoot: true,
    allowWakeLock: true,
  ),
);
```

**Ważne:** Foreground Service wymaga uprawnień w `AndroidManifest.xml`:
```xml
<uses-permission android:name="android.permission.FOREGROUND_SERVICE" />
<uses-permission android:name="android.permission.FOREGROUND_SERVICE_DATA_SYNC" />
<uses-permission android:name="android.permission.POST_NOTIFICATIONS" />
<uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED" />
```

**Pułapka:** Battery Optimization na Androidzie może uśpić Foreground Service.
Rozwiązanie: poproś użytkownika o whitelist w `Settings > Battery > Unrestricted`.

Komunikacja Service ↔ UI:
```dart
// Z serwisu do UI
FlutterForegroundTask.sendDataToMain({'type': 'tick', 'netSeconds': 1234});

// Odbiór w UI
FlutterForegroundTask.addTaskDataCallback((data) {
  if (data['type'] == 'tick') {
    ref.read(timerProvider.notifier).onTick(data['netSeconds']);
  }
});
```

## System powiadomień — kanały Android

| Channel ID | Ważność | Typ powiadomień |
|---|---|---|
| `persistent_timer` | MIN (nie przerywa) | Ongoing timer w pasku |
| `achievement` | DEFAULT | Cel osiągnięty, nauka ukończona |
| `overtime_warning` | HIGH | Nadgodziny co 30 min |
| `activity_reminder` | DEFAULT | Przypomnienie o ruchu |
| `learning_reminder` | LOW | Reminder o sesji nauki |

## Konfiguracja pubspec.yaml

```yaml
name: work_rhythm
description: Personal work rhythm tracker for remote workers
version: 1.0.0+1

environment:
  sdk: '>=3.0.0 <4.0.0'
  flutter: '>=3.10.0'

dependencies:
  flutter:
    sdk: flutter

  # State Management
  flutter_riverpod: ^2.5.1
  riverpod_annotation: ^2.3.5

  # Database
  drift: ^2.18.0
  sqlite3_flutter_libs: ^0.5.24
  path_provider: ^2.1.3
  path: ^1.9.0

  # Background & Notifications
  flutter_foreground_task: ^8.10.0
  flutter_local_notifications: ^18.0.0
  timezone: ^0.9.4
  permission_handler: ^11.3.1

  # Navigation
  go_router: ^14.2.7

  # Charts
  fl_chart: ^0.68.0

  # Utilities
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

## Konwencje kodowania

- **Język plików:** angielski (nazwy klas, zmiennych, komentarze w kodzie)
- **Język UI:** polski (teksty wyświetlane użytkownikowi)
- **Styl Dart:** `dart format`, przestrzegaj `effective_dart`
- **Nazewnictwo plików:** `snake_case.dart`
- **Nazewnictwo klas:** `PascalCase`
- **Nazewnictwo zmiennych/metod:** `camelCase`
- **Providery Riverpod:** suffix `Provider` (np. `timerProvider`, `learningGoalsProvider`)
- **ViewModels:** suffix `Notifier` (np. `TimerNotifier`)
- **Use cases:** rzeczownik + czasownik (np. `StartWorkSession`, `AddDistraction`)

## Zasady architektoniczne (dla AI assistanta)

1. **Logika biznesowa TYLKO w domain/usecases** — nie w widgetach ani ViewModelach
2. **Widgety są głupie** — pobierają state z Riverpod, nie wykonują logiki
3. **Repozytoria mają interfejsy** — implementacje w `data/`, interfejsy w `domain/`
4. **Jeden Foreground Service** — obsługuje zarówno work timer jak i learning timer (flaga trybu)
5. **Immutable state** — TimerState, LearningSessionState to immutable data classes (freezed)
6. **Testy dla use cases** — każdy use case ma testy jednostkowe

## Znane pułapki i rozwiązania

| Problem | Rozwiązanie |
|---|---|
| Foreground Service ubijany przez Doze mode | Wymagaj Battery Optimization whitelist od użytkownika |
| `build_runner` nie widzi zmian | `flutter clean && flutter pub get && flutter pub run build_runner build --delete-conflicting-outputs` |
| Drift DAO musi być abstract class | Generowane przez build_runner — nie twórz ręcznie |
| Riverpod `ref.watch` poza build() | Użyj `ref.read` w metodach, `ref.watch` tylko w `build()` |
| go_router nie odświeża po zmianie stanu | Użyj `refreshListenable` lub `redirect` z providerem |
| Timer resetuje się po rotacji ekranu | State w Riverpod (poza widgetem) — przetrwa rotację |

## Fazy developmentu (skrót)

| # | Faza | Tygodnie | Status |
|---|---|---|---|
| 0 | Dart + Flutter basics | 1 | ⬜ TODO |
| 1 | Architektura + Drift DB | 2–3 | ⬜ TODO |
| 2 | Foreground Service + Timer | 2 | ⬜ TODO |
| 3 | Główny UI + Timer screen | 2 | ⬜ TODO |
| 4 | System powiadomień | 1–2 | ⬜ TODO |
| 5 | Tryb nauki | 1–2 | ⬜ TODO |
| 6 | Raporty + wykresy | 1–2 | ⬜ TODO |
| 7 | Polish + Google Play | 1 | ⬜ TODO |

## Jak używać tego pliku z AI

Dołącz ten plik do kontekstu rozmowy gdy chcesz:
- Wygenerować nowy plik Dart dla konkretnej warstwy
- Zapytać o implementację konkretnego feature
- Debugować problem z konkretną paczką
- Poprosić o refactoring istniejącego kodu

Przykładowe prompty:
- *"Na podstawie kontekstu projektu, wygeneruj implementację TimerNotifier (Riverpod) dla fazy 2"*
- *"Zaimplementuj DistractionBottomSheet zgodnie z architekturą projektu"*
- *"Mam błąd w Drift DAO — oto kod i błąd: [...]. Jak naprawić?"*
