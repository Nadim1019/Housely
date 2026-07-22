// lib/core/database/tables/rent_ledger_table.dart

import 'package:drift/drift.dart';
import 'properties_table.dart';
import 'tenants_table.dart';

/// Drift table definition for logging monthly rent payments and receipts.
/// Keeps a historical ledger of payments per property unit and tenant.
@DataClassName('RentLedgerRecord')
class RentLedgerTable extends Table {
  /// Unique identifier for the rent record entry.
  IntColumn get id => integer().autoIncrement()();

  /// Foreign key linking to the property unit.
  IntColumn get propertyId =>
      integer().references(PropertiesTable, #id)();

  /// Foreign key linking to the associated tenant.
  IntColumn get tenantId =>
      integer().references(TenantsTable, #id)();

  /// Target year and month for the rent payment (e.g., "2026-07").
  TextColumn get periodMonth => text().withLength(min: 7, max: 7)();

  /// Amount due for the period.
  RealColumn get amountDue => real()();

  /// Amount actually paid by tenant.
  RealColumn get amountPaid => real().withDefault(const Constant(0.0))();

  /// Payment status (e.g., 'Paid', 'Pending', 'Overdue').
  TextColumn get status => text().withDefault(const Constant('Pending'))();

  /// Actual date when payment was received.
  DateTimeColumn get paymentDate => dateTime().nullable()();

  /// Payment channel used (e.g., 'bKash', 'Bank Transfer', 'Cash').
  TextColumn get paymentMethod => text().nullable()();

  /// Local path to digital payment receipt or screenshot image.
  TextColumn get receiptPath => text().nullable()();
}