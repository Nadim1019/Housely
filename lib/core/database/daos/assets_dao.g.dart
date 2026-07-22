// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'assets_dao.dart';

// ignore_for_file: type=lint
mixin _$AssetsDaoMixin on DatabaseAccessor<AppDatabase> {
  $PropertiesTableTable get propertiesTable => attachedDatabase.propertiesTable;
  $AssetsTableTable get assetsTable => attachedDatabase.assetsTable;
  AssetsDaoManager get managers => AssetsDaoManager(this);
}

class AssetsDaoManager {
  final _$AssetsDaoMixin _db;
  AssetsDaoManager(this._db);
  $$PropertiesTableTableTableManager get propertiesTable =>
      $$PropertiesTableTableTableManager(
          _db.attachedDatabase, _db.propertiesTable);
  $$AssetsTableTableTableManager get assetsTable =>
      $$AssetsTableTableTableManager(_db.attachedDatabase, _db.assetsTable);
}
