// lib/core/database/tables/tenants_table.dart

import 'package:drift/drift.dart';
import 'properties_table.dart';

/// Drift table definition for storing tenant profiles and lease details.
/// Linked directly to a specific property unit via [propertyId].
@DataClassName('Tenant')
class TenantsTable extends Table {
  /// Unique identifier for the tenant record.
  IntColumn get id => integer().autoIncrement()();

  /// Foreign key pointing to the assigned property unit.
  IntColumn get propertyId =>
      integer().references(PropertiesTable, #id)();

  /// Full legal name of the tenant.
  TextColumn get fullName => text().withLength(min: 1, max: 100)();

  /// Primary phone contact number.
  TextColumn get phoneNumber => text().withLength(min: 1, max: 30)();

  /// Start date of the tenancy lease.
  DateTimeColumn get leaseStartDate => dateTime()();

  /// Expiration date of the tenancy lease.
  DateTimeColumn get leaseEndDate => dateTime()();

  /// Security deposit amount collected at lease sign-up.
  RealColumn get securityDeposit => real().withDefault(const Constant(0.0))();

  /// Emergency contact phone or details.
  TextColumn get emergencyContact => text().nullable()();

  /// Additional notes or special lease terms.
  TextColumn get notes => text().nullable()();

  /// Timestamp when tenant was added.
  DateTimeColumn get createdAt =>
      dateTime().withDefault(currentDateAndTime)();
}