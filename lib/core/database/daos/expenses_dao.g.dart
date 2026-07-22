// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expenses_dao.dart';

// ignore_for_file: type=lint
mixin _$ExpensesDaoMixin on DatabaseAccessor<AppDatabase> {
  $PropertiesTableTable get propertiesTable => attachedDatabase.propertiesTable;
  $ExpensesTableTable get expensesTable => attachedDatabase.expensesTable;
  ExpensesDaoManager get managers => ExpensesDaoManager(this);
}

class ExpensesDaoManager {
  final _$ExpensesDaoMixin _db;
  ExpensesDaoManager(this._db);
  $$PropertiesTableTableTableManager get propertiesTable =>
      $$PropertiesTableTableTableManager(
          _db.attachedDatabase, _db.propertiesTable);
  $$ExpensesTableTableTableManager get expensesTable =>
      $$ExpensesTableTableTableManager(_db.attachedDatabase, _db.expensesTable);
}
