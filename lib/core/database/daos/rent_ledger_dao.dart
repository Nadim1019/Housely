// lib/core/database/daos/rent_ledger_dao.dart

import 'package:drift/drift.dart';
import 'package:housely/core/database/app_database.dart';
import 'package:housely/core/database/tables/rent_ledger_table.dart';

part 'rent_ledger_dao.g.dart';

/// DAO for managing rent payment entries and ledger streams.
@DriftAccessor(tables: [RentLedgerTable])
class RentLedgerDao extends DatabaseAccessor<AppDatabase>
    with _$RentLedgerDaoMixin {
  RentLedgerDao(super.db);

  /// Streams all rent payment records ordered by ID descending.
  Stream<List<RentLedgerRecord>> watchAllLedgerEntries() {
    return (select(rentLedgerTable)
      ..orderBy([(t) => OrderingTerm.desc(t.id)]))
        .watch();
  }

  /// Streams payment records for a specific tenant.
  Stream<List<RentLedgerRecord>> watchLedgerByTenant(int tenantId) {
    return (select(rentLedgerTable)
      ..where((t) => t.tenantId.equals(tenantId))
      ..orderBy([(t) => OrderingTerm.desc(t.id)]))
        .watch();
  }

  /// Streams records filtered by payment status (e.g., 'Paid', 'Pending', 'Overdue').
  Stream<List<RentLedgerRecord>> watchLedgerByStatus(String status) {
    return (select(rentLedgerTable)
      ..where((t) => t.status.equals(status))
      ..orderBy([(t) => OrderingTerm.desc(t.id)]))
        .watch();
  }

  /// Inserts a new rent ledger payment record.
  Future<int> insertLedgerEntry(RentLedgerTableCompanion entry) {
    return into(rentLedgerTable).insert(entry);
  }

  /// Updates an existing payment entry.
  Future<bool> updateLedgerEntry(RentLedgerTableCompanion entry) {
    return update(rentLedgerTable).replace(entry);
  }

  /// Deletes a ledger entry by ID.
  Future<int> deleteLedgerEntry(int id) {
    return (delete(rentLedgerTable)..where((t) => t.id.equals(id))).go();
  }
}