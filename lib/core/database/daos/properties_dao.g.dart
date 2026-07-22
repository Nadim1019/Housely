// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'properties_dao.dart';

// ignore_for_file: type=lint
mixin _$PropertiesDaoMixin on DatabaseAccessor<AppDatabase> {
  $PropertiesTableTable get propertiesTable => attachedDatabase.propertiesTable;
  PropertiesDaoManager get managers => PropertiesDaoManager(this);
}

class PropertiesDaoManager {
  final _$PropertiesDaoMixin _db;
  PropertiesDaoManager(this._db);
  $$PropertiesTableTableTableManager get propertiesTable =>
      $$PropertiesTableTableTableManager(
          _db.attachedDatabase, _db.propertiesTable);
}
