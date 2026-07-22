// lib/core/database/tables/maintenance_table.dart

import 'package:drift/drift.dart';
import 'properties_table.dart';

/// Drift table definition for tracking property repairs and maintenance issues.
/// Stores issue descriptions, repair costs, technician info, and invoices.
@DataClassName('MaintenanceRecord')
class MaintenanceTable extends Table {
  /// Unique identifier for the maintenance task.
  IntColumn get id => integer().autoIncrement()();

  /// Foreign key linking the repair record to a specific property unit.
  IntColumn get propertyId =>
      integer().references(PropertiesTable, #id)();

  /// Detailed description of the problem or repair request.
  TextColumn get problemDescription => text().withLength(min: 1)();

  /// Repair status (e.g., 'Pending', 'In Progress', 'Completed').
  TextColumn get status => text().withDefault(const Constant('Pending'))();

  /// Total cost incurred for the repair service.
  RealColumn get cost => real().withDefault(const Constant(0.0))();

  /// Contact or company name of the technician performing work.
  TextColumn get technicianInfo => text().nullable()();

  /// Date when the repair was requested or reported.
  DateTimeColumn get requestDate =>
      dateTime().withDefault(currentDateAndTime)();

  /// Date when the repair task was fully resolved.
  DateTimeColumn get completionDate => dateTime().nullable()();

  /// Local path to receipt or repair invoice image.
  TextColumn get invoicePath => text().nullable()();
}