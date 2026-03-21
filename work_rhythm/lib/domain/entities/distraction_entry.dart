import 'package:freezed_annotation/freezed_annotation.dart';

part 'distraction_entry.freezed.dart';

enum DistractionCategory {
    home('🏠 Dom'),
    child('👶 Dziecko'),
    phone('📞 Telefon'),
    shopping('🛒 Zakupy'),
    other('💬 Inne');

    const DistractionCategory(this.label);

    final String label;

    static DistractionCategory fromString(String value) {
        return DistractionCategory.values.firstWhere(
            (e) => e.name.toUpperCase() == value.toUpperCase(),
            orElse: () => DistractionCategory.other,
        );
    }
}

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
