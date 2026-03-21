import 'package:drift/drift.dart';

import '../database.dart';
import '../tables.dart';

part 'config_dao.g.dart';

@DriftAccessor(tables: [AppConfigs])
class ConfigDao extends DatabaseAccessor<AppDatabase>
        with _$ConfigDaoMixin {

    ConfigDao(super.db);

    Future<AppConfigRow?> findConfig() {
        return (select(appConfigs)..limit(1)).getSingleOrNull();
    }

    Future<AppConfigRow> getOrCreateConfig() async {
        var config = await findConfig();
        if (config == null) {
            final id = await into(appConfigs).insert(const AppConfigsCompanion());
            config = await (select(appConfigs)..where((t) => t.id.equals(id)))
                    .getSingle();
        }
        return config;
    }

    Future<bool> updateConfig(AppConfigsCompanion entry) =>
            update(appConfigs).replace(entry);
}
