// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'maintenance_dao.dart';

// ignore_for_file: type=lint
mixin _$MaintenanceDaoMixin on DatabaseAccessor<AppDatabase> {
  $PropertiesTableTable get propertiesTable => attachedDatabase.propertiesTable;
  $MaintenanceTableTable get maintenanceTable =>
      attachedDatabase.maintenanceTable;
  MaintenanceDaoManager get managers => MaintenanceDaoManager(this);
}

class MaintenanceDaoManager {
  final _$MaintenanceDaoMixin _db;
  MaintenanceDaoManager(this._db);
  $$PropertiesTableTableTableManager get propertiesTable =>
      $$PropertiesTableTableTableManager(
          _db.attachedDatabase, _db.propertiesTable);
  $$MaintenanceTableTableTableManager get maintenanceTable =>
      $$MaintenanceTableTableTableManager(
          _db.attachedDatabase, _db.maintenanceTable);
}
