// lib/core/database/daos/tenant_history_dao.dart

import 'package:drift/drift.dart';
import 'package:housely/core/database/app_database.dart';
import 'package:housely/core/database/tables/tenant_history_table.dart';

part 'tenant_history_dao.g.dart';

/// Data Access Object (DAO) for managing archived tenant records in [TenantHistoryTable].
///
/// Provides read streams and write operations to audit past tenancies, track move-in/move-out
/// history, and log security deposit settlements across property units.
@DriftAccessor(tables: [TenantHistoryTable])
class TenantHistoryDao extends DatabaseAccessor<AppDatabase>
    with _$TenantHistoryDaoMixin {
  TenantHistoryDao(super.db);

  /// Streams all archived tenancy records ordered by move-out date descending.
  ///
  /// Useful for global historical reports and property auditing across all units.
  Stream<List<TenantHistory>> watchAllHistoryRecords() {
    return (select(tenantHistoryTable)
      ..orderBy([(t) => OrderingTerm.desc(t.moveOutDate)]))
        .watch();
  }

  /// Streams past tenancy records associated with a specific property unit.
  ///
  /// Filters records matching [propertyId] sorted by move-out date descending.
  Stream<List<TenantHistory>> watchHistoryByProperty(int propertyId) {
    return (select(tenantHistoryTable)
      ..where((t) => t.propertyId.equals(propertyId))
      ..orderBy([(t) => OrderingTerm.desc(t.moveOutDate)]))
        .watch();
  }

  /// Inserts a new tenant history entry into the archive upon unit checkout.
  ///
  /// Accepts a [TenantHistoryTableCompanion] containing move-in, move-out, and deposit details.
  /// Returns the auto-incremented primary key [id] of the inserted record.
  Future<int> insertHistoryRecord(TenantHistoryTableCompanion record) {
    return into(tenantHistoryTable).insert(record);
  }

  /// Deletes a specific tenant history record from the database by its [id].
  ///
  /// Returns the number of affected rows (1 if successful, 0 if not found).
  Future<int> deleteHistoryRecord(int id) {
    return (delete(tenantHistoryTable)..where((t) => t.id.equals(id))).go();
  }
}