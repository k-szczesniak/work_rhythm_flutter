extension DurationExtensions on Duration {

    String toHoursMinutes() {
        final h = inHours;
        final m = inMinutes.remainder(60);
        if (h == 0) {
            return '${m}min';
        }
        return '${h}h ${m}min';
    }

    String toHhMmSs() {
        final h = inHours;
        final m = inMinutes.remainder(60);
        final s = inSeconds.remainder(60);
        return '${h.toString().padLeft(2, '0')}:'
            '${m.toString().padLeft(2, '0')}:'
            '${s.toString().padLeft(2, '0')}';
    }

    String toShortLabel() {
        final h = inHours;
        final m = inMinutes.remainder(60);
        if (h == 0) {
            return '${m}m';
        }
        if (m == 0) {
            return '${h}h';
        }
        return '${h}h ${m}m';
    }
}
