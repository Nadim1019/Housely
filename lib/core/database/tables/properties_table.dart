// lib/core/database/tables/properties_table.dart

import 'package:drift/drift.dart';

/// Drift table definition for managing housing/apartment property units.
@DataClassName('Property')
class PropertiesTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(min: 1, max: 100)();
  TextColumn get address => text()();
  TextColumn get propertyType => text().withDefault(const Constant('Apartment'))();
  RealColumn get monthlyRent => real()();
  BoolColumn get isOccupied => boolean().withDefault(const Constant(false))();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}