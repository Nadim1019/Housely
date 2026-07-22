// lib/core/database/tables/tenant_history_table.dart

import 'package:drift/drift.dart';
import 'properties_table.dart';

/// Drift table definition for keeping historical tenancy logs per unit.
/// Archives past tenancy records when tenants move out of an apartment.
@DataClassName('TenantHistory')
class TenantHistoryTable extends Table {
  /// Unique identifier for the historical tenancy record.
  IntColumn get id => integer().autoIncrement()();

  /// Foreign key linking the history record to the target property unit.
  IntColumn get propertyId =>
      integer().references(PropertiesTable, #id)();

  /// Full name of the former tenant.
  TextColumn get tenantName => text().withLength(min: 1, max: 100)();

  /// Date when the tenancy officially started.
  DateTimeColumn get moveInDate => dateTime()();

  /// Date when the tenant vacated the property.
  DateTimeColumn get moveOutDate => dateTime()();

  /// Security deposit amount settled or refunded upon departure.
  RealColumn get depositReturned => real().withDefault(const Constant(0.0))();

  /// Additional departure notes, tenancy summary, or checkout condition.
  TextColumn get departureNotes => text().nullable()();
}