// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tenant_history_dao.dart';

// ignore_for_file: type=lint
mixin _$TenantHistoryDaoMixin on DatabaseAccessor<AppDatabase> {
  $PropertiesTableTable get propertiesTable => attachedDatabase.propertiesTable;
  $TenantHistoryTableTable get tenantHistoryTable =>
      attachedDatabase.tenantHistoryTable;
  TenantHistoryDaoManager get managers => TenantHistoryDaoManager(this);
}

class TenantHistoryDaoManager {
  final _$TenantHistoryDaoMixin _db;
  TenantHistoryDaoManager(this._db);
  $$PropertiesTableTableTableManager get propertiesTable =>
      $$PropertiesTableTableTableManager(
          _db.attachedDatabase, _db.propertiesTable);
  $$TenantHistoryTableTableTableManager get tenantHistoryTable =>
      $$TenantHistoryTableTableTableManager(
          _db.attachedDatabase, _db.tenantHistoryTable);
}
