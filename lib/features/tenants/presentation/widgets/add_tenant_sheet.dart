// lib/features/tenants/presentation/widgets/add_tenant_sheet.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:housely/core/database/app_database.dart';
import 'package:housely/core/database/database_provider.dart';

/// Modal bottom sheet for creating a new tenant entry.
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
  final _propertyIdController = TextEditingController(text: '1');

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _propertyIdController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;

    final db = ref.read(databaseProvider);
    final now = DateTime.now();

    await db.into(db.tenantsTable).insert(
      TenantsTableCompanion.insert(
        propertyId: int.tryParse(_propertyIdController.text) ?? 1,
        fullName: _nameController.text.trim(),
        phoneNumber: _phoneController.text.trim(),
        leaseStartDate: now,
        leaseEndDate: now.add(const Duration(days: 365)),
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
            Text('Add New Tenant', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 16),
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Full Name'),
              validator: (v) => v == null || v.trim().isEmpty ? 'Required' : null,
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _phoneController,
              decoration: const InputDecoration(labelText: 'Phone Number'),
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
              child: const Text('Save Tenant'),
            ),
          ],
        ),
      ),
    );
  }
}