import 'package:intl/intl.dart';

extension DateTimeExtensions on DateTime {

    bool isSameDay(DateTime other) {
        return year == other.year && month == other.month && day == other.day;
    }

    DateTime get startOfDay => DateTime(year, month, day);

    DateTime get endOfDay =>
            DateTime(year, month, day, 23, 59, 59, 999);

    String toFormattedTime() => DateFormat('HH:mm').format(this);

    String toFormattedDate() => DateFormat('dd.MM.yyyy').format(this);

    String toFormattedDateTime() => DateFormat('dd.MM.yyyy HH:mm').format(this);

    /// Returns Monday of the week containing this date.
    DateTime get weekStart {
        final daysFromMonday = weekday - 1;
        return subtract(Duration(days: daysFromMonday)).startOfDay;
    }
}
