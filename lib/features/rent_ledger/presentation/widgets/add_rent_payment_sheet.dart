// lib/features/rent_ledger/presentation/widgets/add_rent_payment_sheet.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:drift/drift.dart' as drift;
import 'package:housely/core/database/database_provider.dart';
import 'package:housely/core/database/app_database.dart';
import 'package:housely/features/rent_ledger/presentation/widgets/rent_payment_form_fields.dart';

/// Modal sheet component for property owners to enter and save rent payments.
class AddRentPaymentSheet extends ConsumerStatefulWidget {
  /// Constructs an [AddRentPaymentSheet] instance.
  const AddRentPaymentSheet({super.key});

  @override
  ConsumerState<AddRentPaymentSheet> createState() => _AddRentPaymentSheetState();
}

class _AddRentPaymentSheetState extends ConsumerState<AddRentPaymentSheet> {
  final _formKey = GlobalKey<FormState>();
  final _propertyIdController = TextEditingController();
  final _tenantIdController = TextEditingController();
  final _amountController = TextEditingController();
  final _periodController = TextEditingController(text: '2026-07');
  String _status = 'Paid';
  String _method = 'Cash';

  @override
  void dispose() {
    _propertyIdController.dispose();
    _tenantIdController.dispose();
    _amountController.dispose();
    _periodController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      final dao = ref.read(rentLedgerDaoProvider);
      final amount = double.parse(_amountController.text.trim());

      final newEntry = RentLedgerTableCompanion.insert(
        propertyId: int.parse(_propertyIdController.text.trim()),
        tenantId: int.parse(_tenantIdController.text.trim()),
        periodMonth: _periodController.text.trim(),
        amountDue: amount,
        amountPaid: drift.Value(amount),
        status: drift.Value(_status),
        paymentDate: drift.Value(DateTime.now()),
        paymentMethod: drift.Value(_method),
      );

      dao.insertLedgerEntry(newEntry);
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
            Text('Log Rent Payment', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 16.0),
            RentPaymentFormFields(
              propertyIdController: _propertyIdController,
              tenantIdController: _tenantIdController,
              periodController: _periodController,
              amountController: _amountController,
              selectedMethod: _method,
              selectedStatus: _status,
              onMethodChanged: (val) => val != null ? setState(() => _method = val) : null,
              onStatusChanged: (val) => val != null ? setState(() => _status = val) : null,
            ),
            const SizedBox(height: 24.0),
            ElevatedButton(onPressed: _submitForm, child: const Text('Save Rent Entry')),
          ],
        ),
      ),
    );
  }
}