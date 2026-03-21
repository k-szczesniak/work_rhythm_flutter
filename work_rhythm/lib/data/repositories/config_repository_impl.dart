import 'dart:convert';

import 'package:drift/drift.dart';

import '../../domain/repositories/i_config_repository.dart';
import '../datasources/daos/config_dao.dart';
import '../datasources/database.dart';

class ConfigRepositoryImpl implements IConfigRepository {

    ConfigRepositoryImpl(this._dao);

    final ConfigDao _dao;

    @override
    Future<int> getTargetHours() async {
        final config = await _dao.getOrCreateConfig();
        return config.targetHours;
    }

    @override
    Future<int> getActivityReminderMinutes() async {
        final config = await _dao.getOrCreateConfig();
        return config.activityReminderMinutes;
    }

    @override
    Future<int> getOvertimeNotificationIntervalMinutes() async {
        final config = await _dao.getOrCreateConfig();
        return config.overtimeNotificationIntervalMinutes;
    }

    @override
    Future<bool> isOvertimeNotificationsEnabled() async {
        final config = await _dao.getOrCreateConfig();
        return config.overtimeNotificationsEnabled;
    }

    @override
    Future<bool> isActivityRemindersEnabled() async {
        final config = await _dao.getOrCreateConfig();
        return config.activityRemindersEnabled;
    }

    @override
    Future<List<String>> getCustomCategories() async {
        final config = await _dao.getOrCreateConfig();
        if (config.customCategories == null) {
            return [];
        }
        final decoded = jsonDecode(config.customCategories!) as List<dynamic>;
        return decoded.cast<String>();
    }

    @override
    Future<void> setTargetHours(int hours) async {
        final config = await _dao.getOrCreateConfig();
        await _dao.updateConfig(
            AppConfigsCompanion(
                id: Value(config.id),
                targetHours: Value(hours),
            ),
        );
    }

    @override
    Future<void> setActivityReminderMinutes(int minutes) async {
        final config = await _dao.getOrCreateConfig();
        await _dao.updateConfig(
            AppConfigsCompanion(
                id: Value(config.id),
                activityReminderMinutes: Value(minutes),
            ),
        );
    }

    @override
    Future<void> setOvertimeNotificationIntervalMinutes(int minutes) async {
        final config = await _dao.getOrCreateConfig();
        await _dao.updateConfig(
            AppConfigsCompanion(
                id: Value(config.id),
                overtimeNotificationIntervalMinutes: Value(minutes),
            ),
        );
    }

    @override
    Future<void> setOvertimeNotificationsEnabled(bool enabled) async {
        final config = await _dao.getOrCreateConfig();
        await _dao.updateConfig(
            AppConfigsCompanion(
                id: Value(config.id),
                overtimeNotificationsEnabled: Value(enabled),
            ),
        );
    }

    @override
    Future<void> setActivityRemindersEnabled(bool enabled) async {
        final config = await _dao.getOrCreateConfig();
        await _dao.updateConfig(
            AppConfigsCompanion(
                id: Value(config.id),
                activityRemindersEnabled: Value(enabled),
            ),
        );
    }

    @override
    Future<void> setCustomCategories(List<String> categories) async {
        final config = await _dao.getOrCreateConfig();
        await _dao.updateConfig(
            AppConfigsCompanion(
                id: Value(config.id),
                customCategories: Value(jsonEncode(categories)),
            ),
        );
    }
}
