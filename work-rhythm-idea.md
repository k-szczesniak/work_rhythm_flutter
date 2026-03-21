# Work Rhythm — Idea i Wymagania Aplikacji

## Kontekst i problem

Praca zdalna zaburza naturalny rytm dnia pracy. Pracownik nie ma fizycznego oddzielenia biura od domu, przez co:
- Trudno ocenić ile faktycznie przepracował godzin netto
- Obowiązki domowe przerywają pracę i ciężko oszacować ich czas
- Brak przypomnień o przerwach i aktywności fizycznej prowadzi do siedzenia bez ruchu przez wiele godzin
- Nadgodziny są niezauważalne — nie ma dzwonka "koniec pracy"
- Samodzielna nauka po pracy wymaga osobnej dyscypliny

## Cel aplikacji

**Work Rhythm** to mobilna aplikacja dla osób pracujących zdalnie, która pomaga świadomie kontrolować dzienny rytm pracy, odpoczynku i nauki. Nie jest to narzędzie do nadzoru — to osobisty asystent rytmu dnia.

Aplikacja jest przeznaczona na **prywatny smartfon** użytkownika (nie wymaga instalacji na służbowym sprzęcie).

## Docelowi użytkownicy

- Pracownicy zdalni chcący sumiennie przepracować zakładane 8h netto
- Osoby które chcą śledzić ile czasu realnie poświęcają na samodzielną naukę
- Freelancerzy kontrolujący czas pracy dla klientów
- Każdy kto chce mieć świadomość swojego rytmu dnia

## Główne funkcjonalności

### 1. Timer pracy
- Start / Pauza / Stop sesji pracy
- Licznik czasu **netto** = czas brutto − czas rozproszeń
- Dzienny pasek postępu (np. 5h 30min z 8h celu)
- Prognozowany koniec dnia na podstawie aktualnego tempa
- Timer działa w tle (nawet gdy telefon jest uśpiony lub aplikacja zminimalizowana)

### 2. Tryb rozproszenia (Distraction Log)
Kluczowa funkcja wyróżniająca aplikację na rynku.

Użytkownik jednym kliknięciem może oznaczyć, że był rozproszony:
- Określa czas rozproszenia (suwak: 5 / 10 / 20 / 30 min lub własny)
- Wybiera kategorię rozproszenia:
  - 🏠 Obowiązki domowe
  - 👶 Dziecko / rodzina
  - 📞 Rozmowa telefoniczna
  - 🛒 Wyjście / zakupy
  - 💬 Inne

Aplikacja automatycznie odejmuje ten czas od licznika pracy i przesuwa prognozowany koniec dnia.

### 3. Tryb nauki (Learning Mode)
Osobny moduł do śledzenia czasu samodzielnej nauki — niezależny od timera pracy.

- Użytkownik tworzy **cel nauki** (np. "Flutter — 30h łącznie", deadline: 30 maja)
- Osobny timer dla sesji nauki
- Pasek postępu każdego celu (np. "6h 30min z 30h — 21%")
- Nie można liczyć czasu pracy i nauki jednocześnie — aplikacja automatycznie przełącza tryby
- Historia sesji nauki dla każdego celu

### 4. System powiadomień
Inteligentne, kontekstowe powiadomienia — nie nachalne, ale informacyjne:

| Typ | Trigger | Treść |
|---|---|---|
| Persistent (ongoing) | Zawsze podczas aktywnego timera | "⏱ 5h 30min netto \| Cel: 8h" |
| Cel osiągnięty | Po przepracowaniu X godzin netto | "✅ Cel dnia przepracowany! Dobra robota." |
| Nadgodziny | Co 30 min po przekroczeniu celu | "⚠️ Nadgodziny: już +45min ponad plan" |
| Aktywność fizyczna | Brak interakcji przez 90 min | "🏃 Rusz się! Siedzisz 90 minut bez przerwy." |
| Nauka | Konfigurowalny reminder | "📚 Pamiętaj o nauce — zostało 2h do celu tygodniowego" |

Każdy typ powiadomienia jest osobnym kanałem Android — użytkownik może wyłączyć wybrane typy.

### 5. Raport rytmu dnia
Codzienna wizualizacja jak wyglądał dzień — nie suche tabele, ale czytelny obraz:

- **Timeline dzienny** — kolorowe bloki na osi czasu:
  - 🟢 Praca netto
  - 🟠 Rozproszenia (z kategorią)
  - 🔵 Nauka
  - ⬜ Przerwy / poza sesją
- **Statystyki dnia**: czas netto, czas brutto, suma rozproszeń, najczęstsza kategoria rozproszenia, czas nauki
- **Raport tygodniowy**: wykres słupkowy (netto per dzień vs cel 8h), procent dni z osiągniętym celem
- **Eksport CSV** — share przez natywny share sheet systemu

### 6. Konfiguracja
Pełna personalizacja bez nadmiernej złożoności:
- Dzienny cel godzinowy (domyślnie 8h)
- Próg powiadomień o nadgodzinach
- Interwał przypomnienia o aktywności fizycznej (domyślnie 90 min)
- Kategorie rozproszeń (edytowalne przez użytkownika)
- Tryb ciemny / jasny (automatyczny)

## Czym aplikacja różni się od konkurencji

| Funkcja | Clockify | Toggl | RescueTime | Work Rhythm |
|---|---|---|---|---|
| Tryb rozproszenia z kategoriami | ❌ | ❌ | ❌ | ✅ |
| Czas netto (brutto − rozproszenia) | ❌ | ❌ | ⚠️ auto | ✅ ręczny |
| Tryb nauki z celami | ❌ | ❌ | ❌ | ✅ |
| Przypomnienie aktywności fizycznej | ❌ | ❌ | ❌ | ✅ |
| Powiadomienia o nadgodzinach | ❌ | ❌ | ⚠️ | ✅ |
| Timeline dzienny | ❌ | ❌ | ✅ | ✅ |
| Tylko prywatny telefon (nie firmowy) | ✅ | ✅ | ❌ | ✅ |

## Zasady UX

- **One-tap access** — najważniejsze akcje (Start, Rozproszony) dostępne bez wchodzenia w app
- **Minimal input** — dodanie rozproszenia to max 3 kliknięcia
- **Offline-first** — cały dane lokalne, żadne dane nie idą do zewnętrznych serwerów
- **Non-intrusive** — powiadomienia są informacyjne, nie alarmujące
- **Privacy by design** — dane zostają na urządzeniu użytkownika

## Zakres MVP (wersja 1.0)

Minimalny zestaw funkcji do pierwszego wydania:
1. ✅ Timer pracy z trybem rozproszenia
2. ✅ Powiadomienia: persistent, cel osiągnięty, nadgodziny, aktywność fizyczna
3. ✅ Podstawowy raport dzienny (statystyki tekstowe + timeline)
4. ✅ Konfiguracja celu dziennego

Funkcje wersji 2.0:
- Tryb nauki z celami
- Raport tygodniowy z wykresami
- CSV export
- Home Widget Android
