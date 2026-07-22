// lib/features/tenant_history/presentation/widgets/tenant_history_form_fields.dart

import 'package:flutter/material.dart';

/// Reusable form fields for archiving past tenancy records.
class TenantHistoryFormFields extends StatelessWidget {
  /// Controller managing property ID input.
  final TextEditingController propertyIdController;

  /// Controller managing former tenant name input.
  final TextEditingController nameController;

  /// Controller managing deposit returned amount input.
  final TextEditingController depositController;

  /// Controller managing departure notes input.
  final TextEditingController notesController;

  /// Constructs a [TenantHistoryFormFields] instance.
  const TenantHistoryFormFields({
    super.key,
    required this.propertyIdController,
    required this.nameController,
    required this.depositController,
    required this.notesController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: propertyIdController,
          decoration: const InputDecoration(labelText: 'Property Unit ID'),
          keyboardType: TextInputType.number,
          validator: (val) => val == null || val.isEmpty ? 'Required' : null,
        ),
        const SizedBox(height: 12.0),
        TextFormField(
          controller: nameController,
          decoration: const InputDecoration(labelText: 'Former Tenant Name'),
          validator: (val) => val == null || val.isEmpty ? 'Required' : null,
        ),
        const SizedBox(height: 12.0),
        TextFormField(
          controller: depositController,
          decoration: const InputDecoration(labelText: 'Deposit Returned (\$)'),
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
        ),
        const SizedBox(height: 12.0),
        TextFormField(
          controller: notesController,
          decoration: const InputDecoration(labelText: 'Departure Notes / Condition'),
        ),
      ],
    );
  }
}