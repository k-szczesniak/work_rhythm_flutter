abstract class IConfigRepository {

    Future<int> getTargetHours();

    Future<int> getActivityReminderMinutes();

    Future<int> getOvertimeNotificationIntervalMinutes();

    Future<bool> isOvertimeNotificationsEnabled();

    Future<bool> isActivityRemindersEnabled();

    Future<List<String>> getCustomCategories();

    Future<void> setTargetHours(int hours);

    Future<void> setActivityReminderMinutes(int minutes);

    Future<void> setOvertimeNotificationIntervalMinutes(int minutes);

    Future<void> setOvertimeNotificationsEnabled(bool enabled);

    Future<void> setActivityRemindersEnabled(bool enabled);

    Future<void> setCustomCategories(List<String> categories);
}
