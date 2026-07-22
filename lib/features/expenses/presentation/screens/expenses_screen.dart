// lib/features/expenses/presentation/screens/expenses_screen.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:housely/core/database/database_provider.dart';

/// Riverpod [StreamProvider] watching real-time operational expenses from [ExpensesDao].
final expensesStreamProvider = StreamProvider((ref) {
  final expensesDao = ref.watch(expensesDaoProvider);
  return expensesDao.watchAllExpenses();
});

/// Presentation screen for viewing, categorizing, and monitoring property overhead expenses.
class ExpensesScreen extends ConsumerWidget {
  /// Constructs an [ExpensesScreen] instance.
  const ExpensesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch real-time expense stream state
    final expensesAsync = ref.watch(expensesStreamProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Expenses'),
      ),
      body: expensesAsync.when(
        // Rendered when database stream successfully emits expense records
        data: (expenses) {
          if (expenses.isEmpty) {
            return const Center(
              child: Text('No expense records logged yet.'),
            );
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
        // Rendered during initial asynchronous stream setup
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
        // Rendered upon stream error
        error: (err, stack) => Center(
          child: Text('Error: $err'),
        ),
      ),
    );
  }
}