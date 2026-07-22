// lib/features/expenses/presentation/screens/expenses_screen.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:housely/core/database/database_provider.dart';
import 'package:housely/features/expenses/presentation/widgets/add_expense_sheet.dart';

/// StreamProvider watching real-time operational expense entries from [ExpensesDao].
final expensesStreamProvider = StreamProvider((ref) {
  final expensesDao = ref.watch(expensesDaoProvider);
  return expensesDao.watchAllExpenses();
});

/// Presentation screen for viewing and adding owner operational expenses.
class ExpensesScreen extends ConsumerWidget {
  /// Constructs an [ExpensesScreen] instance.
  const ExpensesScreen({super.key});

  void _showAddSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => Padding(
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: const AddExpenseSheet(),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final expensesAsync = ref.watch(expensesStreamProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Expenses')),
      body: expensesAsync.when(
        data: (expenses) {
          if (expenses.isEmpty) {
            return const Center(child: Text('No expense records logged yet.'));
          }
          return ListView.builder(
            itemCount: expenses.length,
            itemBuilder: (context, index) {
              final expense = expenses[index];
              return ListTile(
                leading: const Icon(Icons.receipt),
                title: Text(expense.category),
                subtitle: Text(
                  '${expense.description ?? "No description"}\nDate: ${expense.expenseDate.day}/${expense.expenseDate.month}/${expense.expenseDate.year}',
                ),
                isThreeLine: true,
                trailing: Text(
                  '\$${expense.amount.toStringAsFixed(2)}',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.red.shade700,
                  ),
                ),
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Error: $err')),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddSheet(context),
        tooltip: 'Log Expense',
        child: const Icon(Icons.add),
      ),
    );
  }
}