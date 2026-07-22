// lib/core/database/daos/tenants_dao.dart

import 'package:drift/drift.dart';
import 'package:housely/core/database/app_database.dart';
import 'package:housely/core/database/tables/tenants_table.dart';

part 'tenants_dao.g.dart';

/// DAO providing CRUD operations and query streams for [TenantsTable].
@DriftAccessor(tables: [TenantsTable])
class TenantsDao extends DatabaseAccessor<AppDatabase>
    with _$TenantsDaoMixin {
  TenantsDao(super.db);

  /// Streams all tenants ordered by name alphabetically.
  Stream<List<Tenant>> watchAllTenants() {
    return (select(tenantsTable)
      ..orderBy([(t) => OrderingTerm.asc(t.fullName)]))
        .watch();
  }

  /// Streams tenants assigned to a specific property unit.
  Stream<List<Tenant>> watchTenantsByProperty(int propertyId) {
    return (select(tenantsTable)
      ..where((t) => t.propertyId.equals(propertyId)))
        .watch();
  }

  /// Fetches a single tenant by ID.
  Future<Tenant?> getTenantById(int id) {
    return (select(tenantsTable)..where((t) => t.id.equals(id)))
        .getSingleOrNull();
  }

  /// Inserts a new tenant.
  Future<int> insertTenant(TenantsTableCompanion tenant) {
    return into(tenantsTable).insert(tenant);
  }

  /// Updates an existing tenant record.
  Future<bool> updateTenant(TenantsTableCompanion tenant) {
    return update(tenantsTable).replace(tenant);
  }

  /// Deletes a tenant record.
  Future<int> deleteTenant(int id) {
    return (delete(tenantsTable)..where((t) => t.id.equals(id))).go();
  }
}