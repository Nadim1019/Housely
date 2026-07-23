// lib/features/expenses/presentation/pages/expenses_screen.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:housely/core/database/database_provider.dart';
import 'package:housely/features/expenses/presentation/widgets/add_expense_sheet.dart';

/// Screen component rendering a real-time reactive list of logged property expenses.
///
/// Listens to live queries on [ExpensesTable] via [StreamBuilder] and provides
/// action hooks to trigger the creation bottom sheet.
class ExpensesScreen extends ConsumerWidget {
  /// Constructs an [ExpensesScreen] instance.
  const ExpensesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final db = ref.watch(databaseProvider);
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Expenses Log')),
      body: StreamBuilder(
        stream: db.select(db.expensesTable).watch(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          final expenses = snapshot.data ?? [];
          if (expenses.isEmpty) {
            return const Center(child: Text('No expense logs found. Tap + to add.'));
          }
          return ListView.builder(
            padding: const EdgeInsets.all(12.0),
            itemCount: expenses.length,
            itemBuilder: (context, index) {
              final exp = expenses[index];
              return Card(
                elevation: 0,
                margin: const EdgeInsets.only(bottom: 8.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  side: BorderSide(
                    color: theme.colorScheme.outlineVariant.withValues(alpha: 0.5),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          color: theme.colorScheme.errorContainer,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Icon(
                          Icons.receipt_long,
                          color: theme.colorScheme.onErrorContainer,
                        ),
                      ),
                      const SizedBox(width: 12.0),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              exp.category,
                              style: theme.textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 4.0),
                            Text(
                              'Date: ${exp.expenseDate.toString().split(' ')[0]}',
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: theme.colorScheme.outline,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        '\$${exp.amount.toStringAsFixed(2)}',
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: theme.colorScheme.error,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (_) => const AddExpenseSheet(),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}