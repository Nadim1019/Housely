// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tenants_dao.dart';

// ignore_for_file: type=lint
mixin _$TenantsDaoMixin on DatabaseAccessor<AppDatabase> {
  $PropertiesTableTable get propertiesTable => attachedDatabase.propertiesTable;
  $TenantsTableTable get tenantsTable => attachedDatabase.tenantsTable;
  TenantsDaoManager get managers => TenantsDaoManager(this);
}

class TenantsDaoManager {
  final _$TenantsDaoMixin _db;
  TenantsDaoManager(this._db);
  $$PropertiesTableTableTableManager get propertiesTable =>
      $$PropertiesTableTableTableManager(
          _db.attachedDatabase, _db.propertiesTable);
  $$TenantsTableTableTableManager get tenantsTable =>
      $$TenantsTableTableTableManager(_db.attachedDatabase, _db.tenantsTable);
}
