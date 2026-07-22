// lib/core/database/app_database.dart

import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

import 'package:housely/core/database/tables/properties_table.dart';
import 'package:housely/core/database/tables/tenants_table.dart';
import 'package:housely/core/database/tables/rent_ledger_table.dart';
import 'package:housely/core/database/tables/assets_table.dart';
import 'package:housely/core/database/tables/maintenance_table.dart';
import 'package:housely/core/database/tables/expenses_table.dart';
import 'package:housely/core/database/tables/tenant_history_table.dart';
import 'package:housely/core/database/tables/documents_table.dart';

part 'app_database.g.dart';

/// Centralized Drift database for the Housely Property Management app.
/// Aggregates all database tables and manages the native SQLite connection.
@DriftDatabase(tables: [
  PropertiesTable,
  TenantsTable,
  RentLedgerTable,
  AssetsTable,
  MaintenanceTable,
  ExpensesTable,
  TenantHistoryTable,
  DocumentsTable,
])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}

/// Creates a lazy database connection to local SQLite file storage.
QueryExecutor _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'housely_database.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}