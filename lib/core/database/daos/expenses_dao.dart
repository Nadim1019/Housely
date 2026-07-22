// lib/core/database/daos/expenses_dao.dart

import 'package:drift/drift.dart';
import 'package:housely/core/database/app_database.dart';
import 'package:housely/core/database/tables/expenses_table.dart';

part 'expenses_dao.g.dart';

/// DAO providing CRUD operations and streams for [ExpensesTable].
@DriftAccessor(tables: [ExpensesTable])
class ExpensesDao extends DatabaseAccessor<AppDatabase>
    with _$ExpensesDaoMixin {
  ExpensesDao(super.db);

  /// Streams all expense entries ordered by expense date descending.
  Stream<List<PropertyExpense>> watchAllExpenses() {
    return (select(expensesTable)
      ..orderBy([(t) => OrderingTerm.desc(t.expenseDate)]))
        .watch();
  }

  /// Streams expenses linked to a specific property unit.
  Stream<List<PropertyExpense>> watchExpensesByProperty(int propertyId) {
    return (select(expensesTable)
      ..where((t) => t.propertyId.equals(propertyId))
      ..orderBy([(t) => OrderingTerm.desc(t.expenseDate)]))
        .watch();
  }

  /// Inserts a new expense record.
  Future<int> insertExpense(ExpensesTableCompanion expense) {
    return into(expensesTable).insert(expense);
  }

  /// Updates an existing expense record.
  Future<bool> updateExpense(ExpensesTableCompanion expense) {
    return update(expensesTable).replace(expense);
  }

  /// Deletes an expense record by ID.
  Future<int> deleteExpense(int id) {
    return (delete(expensesTable)..where((t) => t.id.equals(id))).go();
  }
}