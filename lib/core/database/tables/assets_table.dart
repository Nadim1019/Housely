// lib/core/database/tables/assets_table.dart

import 'package:drift/drift.dart';
import 'properties_table.dart';

/// Drift table definition for tracking appliances and furniture per unit.
/// Helps landlords maintain asset inventories, warranties, and conditions.
@DataClassName('PropertyAsset')
class AssetsTable extends Table {
  /// Unique identifier for the asset item.
  IntColumn get id => integer().autoIncrement()();

  /// Foreign key linking the asset to a specific property unit.
  IntColumn get propertyId =>
      integer().references(PropertiesTable, #id)();

  /// Name of the asset item (e.g., "Inverter AC", "Samsung Fridge").
  TextColumn get assetName => text().withLength(min: 1, max: 100)();

  /// Category classification (e.g., 'Appliance', 'Furniture', 'Electronics').
  TextColumn get category => text().withDefault(const Constant('Appliance'))();

  /// Estimated current monetary value or purchase cost.
  RealColumn get purchasePrice => real().nullable()();

  /// Date when the asset was purchased.
  DateTimeColumn get purchaseDate => dateTime().nullable()();

  /// Expiration date for the brand or store warranty.
  DateTimeColumn get warrantyExpiry => dateTime().nullable()();

  /// Physical condition state (e.g., 'New', 'Good', 'Needs Repair').
  TextColumn get condition => text().withDefault(const Constant('Good'))();

  /// Historical service, repair, or maintenance logs.
  TextColumn get serviceHistory => text().nullable()();
}