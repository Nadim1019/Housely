// lib/features/rent_ledger/presentation/widgets/rent_payment_form_fields.dart

import 'package:flutter/material.dart';

/// Reusable input fields widget for the rent payment creation form.
class RentPaymentFormFields extends StatelessWidget {
  /// Controller managing property ID input.
  final TextEditingController propertyIdController;

  /// Controller managing tenant ID input.
  final TextEditingController tenantIdController;

  /// Controller managing period month input.
  final TextEditingController periodController;

  /// Controller managing amount input.
  final TextEditingController amountController;

  /// Selected payment method state value.
  final String selectedMethod;

  /// Selected payment status state value.
  final String selectedStatus;

  /// Callback when payment method option changes.
  final ValueChanged<String?> onMethodChanged;

  /// Callback when payment status option changes.
  final ValueChanged<String?> onStatusChanged;

  /// Constructs a [RentPaymentFormFields] instance.
  const RentPaymentFormFields({
    super.key,
    required this.propertyIdController,
    required this.tenantIdController,
    required this.periodController,
    required this.amountController,
    required this.selectedMethod,
    required this.selectedStatus,
    required this.onMethodChanged,
    required this.onStatusChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: propertyIdController,
                decoration: const InputDecoration(labelText: 'Property ID'),
                keyboardType: TextInputType.number,
                validator: (val) => val == null || val.isEmpty ? 'Required' : null,
              ),
            ),
            const SizedBox(width: 12.0),
            Expanded(
              child: TextFormField(
                controller: tenantIdController,
                decoration: const InputDecoration(labelText: 'Tenant ID'),
                keyboardType: TextInputType.number,
                validator: (val) => val == null || val.isEmpty ? 'Required' : null,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12.0),
        TextFormField(
          controller: periodController,
          decoration: const InputDecoration(labelText: 'Period Month (e.g. 2026-07)'),
          validator: (val) => val == null || val.length != 7 ? 'Format: YYYY-MM' : null,
        ),
        const SizedBox(height: 12.0),
        TextFormField(
          controller: amountController,
          decoration: const InputDecoration(labelText: 'Amount Paid (\$)'),
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          validator: (val) {
            if (val == null || val.isEmpty) return 'Required';
            if (double.tryParse(val) == null) return 'Invalid amount';
            return null;
          },
        ),
        const SizedBox(height: 12.0),
        DropdownButtonFormField<String>(
          initialValue: selectedMethod,
          decoration: const InputDecoration(labelText: 'Payment Method'),
          items: const [
            DropdownMenuItem(value: 'Cash', child: Text('Cash')),
            DropdownMenuItem(value: 'bKash', child: Text('bKash')),
            DropdownMenuItem(value: 'Bank Transfer', child: Text('Bank Transfer')),
          ],
          onChanged: onMethodChanged,
        ),
        const SizedBox(height: 12.0),
        DropdownButtonFormField<String>(
          initialValue: selectedStatus,
          decoration: const InputDecoration(labelText: 'Status'),
          items: const [
            DropdownMenuItem(value: 'Paid', child: Text('Paid')),
            DropdownMenuItem(value: 'Pending', child: Text('Pending')),
            DropdownMenuItem(value: 'Overdue', child: Text('Overdue')),
          ],
          onChanged: onStatusChanged,
        ),
      ],
    );
  }
}