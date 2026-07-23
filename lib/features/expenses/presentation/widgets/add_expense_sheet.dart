// lib/features/expenses/presentation/widgets/add_expense_sheet.dart

import 'package:drift/drift.dart' as drift;
import 'package:flutter/material.dart';
import 'package:housely/core/database/app_database.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:housely/core/database/database_provider.dart';

/// Modal bottom sheet widget enabling users to log new operational expenses.
///
/// Features input fields for expense category, amount, and property ID,
/// persisting entries directly into the Drift persistence engine.
class AddExpenseSheet extends ConsumerStatefulWidget {
  /// Constructs an [AddExpenseSheet] instance.
  const AddExpenseSheet({super.key});

  @override
  ConsumerState<AddExpenseSheet> createState() => _AddExpenseSheetState();
}

class _AddExpenseSheetState extends ConsumerState<AddExpenseSheet> {
  /// Global form key used for field validation checks.
  final _formKey = GlobalKey<FormState>();

  /// Form field controllers managing input text states.
  final _amountController = TextEditingController();
  final _categoryController = TextEditingController();
  final _propertyIdController = TextEditingController(text: '1');

  @override
  void dispose() {
    _amountController.dispose();
    _categoryController.dispose();
    _propertyIdController.dispose();
    super.dispose();
  }

  /// Validates input parameters and inserts a new row into [ExpensesTable].
  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;

    final db = ref.read(databaseProvider);
    final amount = double.tryParse(_amountController.text.trim()) ?? 0.0;
    final propertyId = int.tryParse(_propertyIdController.text.trim()) ?? 1;

    await db.into(db.expensesTable).insert(
      ExpensesTableCompanion.insert(
        propertyId: drift.Value(propertyId),
        amount: amount,
        category: _categoryController.text.trim(),
        expenseDate: DateTime.now(),
      ),
    );

    if (mounted) Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom + 16,
        left: 16,
        right: 16,
        top: 24,
      ),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Log New Expense', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 16),
            TextFormField(
              controller: _categoryController,
              decoration: const InputDecoration(labelText: 'Category (e.g. Plumbing, Utilities)'),
              validator: (v) => v == null || v.trim().isEmpty ? 'Required' : null,
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _amountController,
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              decoration: const InputDecoration(labelText: 'Amount (\$)'),
              validator: (v) => v == null || v.trim().isEmpty ? 'Required' : null,
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _propertyIdController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Property ID'),
              validator: (v) => v == null || v.trim().isEmpty ? 'Required' : null,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _submit,
              child: const Text('Save Expense'),
            ),
          ],
        ),
      ),
    );
  }
}