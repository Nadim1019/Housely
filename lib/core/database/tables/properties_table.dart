// lib/core/database/tables/properties_table.dart

import 'package:drift/drift.dart';

/// Drift table definition for managing property and apartment unit details.
/// Represents individual rental units owned and tracked by the landlord.
@DataClassName('PropertyUnit')
class PropertiesTable extends Table {
  /// Unique identifier for the property unit.
  IntColumn get id => integer().autoIncrement()();

  /// Name of the building or property complex.
  TextColumn get buildingName => text().withLength(min: 1, max: 100)();

  /// Apartment number or label (e.g., "Flat 302", "Unit A4").
  TextColumn get unitNumber => text().withLength(min: 1, max: 50)();

  /// Floor level where the unit is located.
  IntColumn get floorLevel => integer().withDefault(const Constant(1))();

  /// Total square footage or area size description.
  TextColumn get areaSize => text().nullable()();

  /// Standard monthly rent amount for this unit.
  RealColumn get monthlyRent => real()();

  /// Current occupancy status (e.g., 'Occupied', 'Vacant').
  TextColumn get status => text().withDefault(const Constant('Vacant'))();

  /// Local file paths for property photo gallery (comma-separated).
  TextColumn get photoPaths => text().nullable()();

  /// Timestamp when the property record was registered.
  DateTimeColumn get createdAt =>
      dateTime().withDefault(currentDateAndTime)();
}