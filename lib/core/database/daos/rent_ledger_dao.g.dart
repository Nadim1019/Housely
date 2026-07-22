// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rent_ledger_dao.dart';

// ignore_for_file: type=lint
mixin _$RentLedgerDaoMixin on DatabaseAccessor<AppDatabase> {
  $PropertiesTableTable get propertiesTable => attachedDatabase.propertiesTable;
  $TenantsTableTable get tenantsTable => attachedDatabase.tenantsTable;
  $RentLedgerTableTable get rentLedgerTable => attachedDatabase.rentLedgerTable;
  RentLedgerDaoManager get managers => RentLedgerDaoManager(this);
}

class RentLedgerDaoManager {
  final _$RentLedgerDaoMixin _db;
  RentLedgerDaoManager(this._db);
  $$PropertiesTableTableTableManager get propertiesTable =>
      $$PropertiesTableTableTableManager(
          _db.attachedDatabase, _db.propertiesTable);
  $$TenantsTableTableTableManager get tenantsTable =>
      $$TenantsTableTableTableManager(_db.attachedDatabase, _db.tenantsTable);
  $$RentLedgerTableTableTableManager get rentLedgerTable =>
      $$RentLedgerTableTableTableManager(
          _db.attachedDatabase, _db.rentLedgerTable);
}
