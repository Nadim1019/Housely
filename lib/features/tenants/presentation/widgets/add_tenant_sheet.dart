// lib/features/tenants/presentation/widgets/add_tenant_sheet.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:drift/drift.dart' as drift;
import 'package:housely/core/database/database_provider.dart';
import 'package:housely/core/database/app_database.dart';

/// Modal sheet widget for creating and persisting new tenant records in Drift.
class AddTenantSheet extends ConsumerStatefulWidget {
  /// Constructs an [AddTenantSheet] instance.
  const AddTenantSheet({super.key});

  @override
  ConsumerState<AddTenantSheet> createState() => _AddTenantSheetState();
}

class _AddTenantSheetState extends ConsumerState<AddTenantSheet> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _propertyIdController = TextEditingController();
  final _depositController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _propertyIdController.dispose();
    _depositController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      final dao = ref.read(tenantsDaoProvider);
      final now = DateTime.now();

      final newTenant = TenantsTableCompanion.insert(
        fullName: _nameController.text.trim(),
        phoneNumber: _phoneController.text.trim(),
        propertyId: int.parse(_propertyIdController.text.trim()),
        leaseStartDate: now,
        leaseEndDate: now.add(const Duration(days: 365)),
        securityDeposit: drift.Value(
          double.tryParse(_depositController.text.trim()) ?? 0.0,
        ),
      );

      dao.insertTenant(newTenant);
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
            Text('Add New Tenant', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 16.0),
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Full Name'),
              validator: (val) => val == null || val.isEmpty ? 'Required' : null,
            ),
            const SizedBox(height: 12.0),
            TextFormField(
              controller: _phoneController,
              decoration: const InputDecoration(labelText: 'Phone Number'),
              keyboardType: TextInputType.phone,
              validator: (val) => val == null || val.isEmpty ? 'Required' : null,
            ),
            const SizedBox(height: 12.0),
            TextFormField(
              controller: _propertyIdController,
              decoration: const InputDecoration(labelText: 'Property Unit ID'),
              keyboardType: TextInputType.number,
              validator: (val) => val == null || val.isEmpty ? 'Required' : null,
            ),
            const SizedBox(height: 12.0),
            TextFormField(
              controller: _depositController,
              decoration: const InputDecoration(labelText: 'Security Deposit (\$)'),
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
            ),
            const SizedBox(height: 24.0),
            ElevatedButton(onPressed: _submitForm, child: const Text('Save Tenant')),
          ],
        ),
      ),
    );
  }
}