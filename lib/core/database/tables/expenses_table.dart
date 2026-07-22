// lib/core/database/tables/expenses_table.dart

import 'package:drift/drift.dart';
import 'properties_table.dart';

/// Drift table definition for tracking building operational expenses.
/// Supports both overall property costs and unit-specific overheads.
@DataClassName('PropertyExpense')
class ExpensesTable extends Table {
  /// Unique identifier for the expense entry.
  IntColumn get id => integer().autoIncrement()();

  /// Optional foreign key linking to a unit (null for whole building).
  IntColumn get propertyId =>
      integer().nullable().references(PropertiesTable, #id)();

  /// Expense category (e.g., 'Cleaning', 'Security', 'Taxes', 'Utilities').
  TextColumn get category => text().withLength(min: 1, max: 50)();

  /// Amount spent on this expense item.
  RealColumn get amount => real()();

  /// Date when the expense was incurred.
  DateTimeColumn get expenseDate => dateTime()();

  /// Brief explanation or vendor details for the expense.
  TextColumn get description => text().nullable()();

  /// Local path to physical receipt photo or digital document.
  TextColumn get receiptPath => text().nullable()();
}