// lib/features/expenses/presentation/widgets/add_expense_sheet.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:drift/drift.dart' as drift;
import 'package:housely/core/database/database_provider.dart';
import 'package:housely/core/database/app_database.dart';

/// Modal sheet for property owners to record operational building expenses.
class AddExpenseSheet extends ConsumerStatefulWidget {
  /// Constructs an [AddExpenseSheet] instance.
  const AddExpenseSheet({super.key});

  @override
  ConsumerState<AddExpenseSheet> createState() => _AddExpenseSheetState();
}

class _AddExpenseSheetState extends ConsumerState<AddExpenseSheet> {
  final _formKey = GlobalKey<FormState>();
  final _categoryController = TextEditingController();
  final _amountController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _propertyIdController = TextEditingController();

  @override
  void dispose() {
    _categoryController.dispose();
    _amountController.dispose();
    _descriptionController.dispose();
    _propertyIdController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      final dao = ref.read(expensesDaoProvider);
      final propId = int.tryParse(_propertyIdController.text.trim());

      final newExpense = ExpensesTableCompanion.insert(
        category: _categoryController.text.trim(),
        amount: double.parse(_amountController.text.trim()),
        expenseDate: DateTime.now(),
        propertyId: drift.Value(propId),
        description: drift.Value(
          _descriptionController.text.trim().isEmpty ? null : _descriptionController.text.trim(),
        ),
      );

      dao.insertExpense(newExpense);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Record Operational Expense', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 16.0),
            TextFormField(
              controller: _categoryController,
              decoration: const InputDecoration(labelText: 'Category (e.g. Taxes, Utilities)'),
              validator: (val) => val == null || val.isEmpty ? 'Required' : null,
            ),
            const SizedBox(height: 12.0),
            TextFormField(
              controller: _amountController,
              decoration: const InputDecoration(labelText: 'Amount (\$)'),
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              validator: (val) {
                if (val == null || val.isEmpty) return 'Required';
                if (double.tryParse(val) == null) return 'Must be a valid number';
                return null;
              },
            ),
            const SizedBox(height: 12.0),
            TextFormField(
              controller: _descriptionController,
              decoration: const InputDecoration(labelText: 'Description / Vendor Info'),
            ),
            const SizedBox(height: 12.0),
            TextFormField(
              controller: _propertyIdController,
              decoration: const InputDecoration(labelText: 'Property Unit ID (Optional)'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 24.0),
            ElevatedButton(onPressed: _submitForm, child: const Text('Save Expense')),
          ],
        ),
      ),
    );
  }
}