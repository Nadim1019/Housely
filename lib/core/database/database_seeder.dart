// lib/core/database/database_seeder.dart

import 'package:drift/drift.dart';
import 'package:housely/core/database/app_database.dart';

/// Utility class to populate mock local data for UI development.
class DatabaseSeeder {
  final AppDatabase db;

  DatabaseSeeder(this.db);

  /// Seeds mock records across properties, rent, and expenses.
  Future<void> seedAll() async {
    // 1. Seed Properties
    final prop1 = await db.into(db.propertiesTable).insert(
      PropertiesTableCompanion.insert(
        name: 'Unit 101-A',
        address: '123 Main Street',
        monthlyRent: 1200.00,
        isOccupied: const Value(true),
      ),
    );

    final prop2 = await db.into(db.propertiesTable).insert(
      PropertiesTableCompanion.insert(
        name: 'Unit 202-B',
        address: '123 Main Street',
        monthlyRent: 1450.00,
        isOccupied: const Value(false),
      ),
    );

    // 2. Seed Rent Ledger
    await db.into(db.rentLedgerTable).insert(
      RentLedgerTableCompanion.insert(
        propertyId: prop1,
        tenantId: 1,
        amountDue: 1200.00,
        amountPaid: const Value(1200.00),
        periodMonth: '2026-07',
        status: const Value('Paid'),
      ),
    );

    // 3. Seed Maintenance Request
    await db.into(db.maintenanceTable).insert(
      MaintenanceTableCompanion.insert(
        propertyId: prop1,
        problemDescription: 'Leaking kitchen sink pipe dripping underneath',
        status: const Value('In Progress'),
      ),
    );

    // 4. Seed Expense
    await db.into(db.expensesTable).insert(
      ExpensesTableCompanion.insert(
        propertyId: Value(prop2),
        amount: 150.00,
        expenseDate: DateTime.now(),
        category: 'Maintenance',
      ),
    );
  }
}