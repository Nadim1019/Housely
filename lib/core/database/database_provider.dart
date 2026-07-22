// lib/core/database/database_provider.dart

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:housely/core/database/app_database.dart';
import 'package:housely/core/database/daos/properties_dao.dart';
import 'package:housely/core/database/daos/tenants_dao.dart';
import 'package:housely/core/database/daos/rent_ledger_dao.dart';
import 'package:housely/core/database/daos/maintenance_dao.dart';
import 'package:housely/core/database/daos/expenses_dao.dart';
import 'package:housely/core/database/daos/assets_dao.dart';
import 'package:housely/core/database/daos/documents_dao.dart';
import 'package:housely/core/database/daos/tenant_history_dao.dart';

/// Singleton provider for the central [AppDatabase] instance.
///
/// Keeps the SQLite database connection alive across the app lifecycle.
final databaseProvider = Provider<AppDatabase>((ref) {
  final db = AppDatabase();
  ref.onDispose(() => db.close());
  return db;
});

/// Provider for [PropertiesDao] to perform CRUD operations on property units.
final propertiesDaoProvider = Provider<PropertiesDao>((ref) {
  return PropertiesDao(ref.watch(databaseProvider));
});

/// Provider for [TenantsDao] to manage active tenant profiles and contacts.
final tenantsDaoProvider = Provider<TenantsDao>((ref) {
  return TenantsDao(ref.watch(databaseProvider));
});

/// Provider for [RentLedgerDao] to track payments and transaction logs.
final rentLedgerDaoProvider = Provider<RentLedgerDao>((ref) {
  return RentLedgerDao(ref.watch(databaseProvider));
});

/// Provider for [MaintenanceDao] to manage maintenance and repair logs.
final maintenanceDaoProvider = Provider<MaintenanceDao>((ref) {
  return MaintenanceDao(ref.watch(databaseProvider));
});

/// Provider for [ExpensesDao] to log and stream property overhead costs.
final expensesDaoProvider = Provider<ExpensesDao>((ref) {
  return ExpensesDao(ref.watch(databaseProvider));
});

/// Provider for [AssetsDao] to track appliances and inventory items.
final assetsDaoProvider = Provider<AssetsDao>((ref) {
  return AssetsDao(ref.watch(databaseProvider));
});

/// Provider for [DocumentsDao] to access digital vault document metadata.
final documentsDaoProvider = Provider<DocumentsDao>((ref) {
  return DocumentsDao(ref.watch(databaseProvider));
});

/// Provider for [TenantHistoryDao] to query archived tenancy records.
final tenantHistoryDaoProvider = Provider<TenantHistoryDao>((ref) {
  return TenantHistoryDao(ref.watch(databaseProvider));
});