// lib/core/database/daos/maintenance_dao.dart

import 'package:drift/drift.dart';
import 'package:housely/core/database/app_database.dart';
import 'package:housely/core/database/tables/maintenance_table.dart';

part 'maintenance_dao.g.dart';

/// DAO providing CRUD operations and real-time streams for [MaintenanceTable].
@DriftAccessor(tables: [MaintenanceTable])
class MaintenanceDao extends DatabaseAccessor<AppDatabase>
    with _$MaintenanceDaoMixin {
  MaintenanceDao(super.db);

  /// Streams all maintenance requests ordered by request date descending.
  Stream<List<MaintenanceRecord>> watchAllRequests() {
    return (select(maintenanceTable)
      ..orderBy([(t) => OrderingTerm.desc(t.requestDate)]))
        .watch();
  }

  /// Streams maintenance requests for a specific property.
  Stream<List<MaintenanceRecord>> watchRequestsByProperty(int propertyId) {
    return (select(maintenanceTable)
      ..where((t) => t.propertyId.equals(propertyId))
      ..orderBy([(t) => OrderingTerm.desc(t.requestDate)]))
        .watch();
  }

  /// Streams requests by status (e.g., 'Pending', 'In Progress', 'Completed').
  Stream<List<MaintenanceRecord>> watchRequestsByStatus(String status) {
    return (select(maintenanceTable)
      ..where((t) => t.status.equals(status))
      ..orderBy([(t) => OrderingTerm.desc(t.requestDate)]))
        .watch();
  }

  /// Inserts a new maintenance record.
  Future<int> insertRequest(MaintenanceTableCompanion request) {
    return into(maintenanceTable).insert(request);
  }

  /// Updates an existing maintenance entry.
  Future<bool> updateRequest(MaintenanceTableCompanion request) {
    return update(maintenanceTable).replace(request);
  }

  /// Deletes a maintenance record by ID.
  Future<int> deleteRequest(int id) {
    return (delete(maintenanceTable)..where((t) => t.id.equals(id))).go();
  }
}