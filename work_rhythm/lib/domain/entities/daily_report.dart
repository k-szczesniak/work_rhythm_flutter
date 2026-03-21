import 'package:freezed_annotation/freezed_annotation.dart';

part 'daily_report.freezed.dart';

enum TimelineBlockType { work, distraction, learning, pause }

@freezed
class TimelineBlock with _$TimelineBlock {

    const factory TimelineBlock({
        required DateTime startTime,
        required DateTime endTime,
        required TimelineBlockType type,
        String? category,
    }) = _TimelineBlock;
}

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
