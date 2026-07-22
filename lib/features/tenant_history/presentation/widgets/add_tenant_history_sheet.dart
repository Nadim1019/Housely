// lib/features/tenant_history/presentation/widgets/add_tenant_history_sheet.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:drift/drift.dart' as drift;
import 'package:housely/core/database/database_provider.dart';
import 'package:housely/core/database/app_database.dart';
import 'package:housely/features/tenant_history/presentation/widgets/tenant_history_form_fields.dart';

/// Modal sheet component for archiving former tenant records into Drift.
class AddTenantHistorySheet extends ConsumerStatefulWidget {
  /// Constructs an [AddTenantHistorySheet] instance.
  const AddTenantHistorySheet({super.key});

  @override
  ConsumerState<AddTenantHistorySheet> createState() => _AddTenantHistorySheetState();
}

class _AddTenantHistorySheetState extends ConsumerState<AddTenantHistorySheet> {
  final _formKey = GlobalKey<FormState>();
  final _propertyIdController = TextEditingController();
  final _nameController = TextEditingController();
  final _depositController = TextEditingController();
  final _notesController = TextEditingController();

  @override
  void dispose() {
    _propertyIdController.dispose();
    _nameController.dispose();
    _depositController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      final dao = ref.read(tenantHistoryDaoProvider);
      final now = DateTime.now();

      final newRecord = TenantHistoryTableCompanion.insert(
        propertyId: int.parse(_propertyIdController.text.trim()),
        tenantName: _nameController.text.trim(),
        moveInDate: now.subtract(const Duration(days: 365)),
        moveOutDate: now,
        depositReturned: drift.Value(
          double.tryParse(_depositController.text.trim()) ?? 0.0,
        ),
        departureNotes: drift.Value(
          _notesController.text.trim().isEmpty ? null : _notesController.text.trim(),
        ),
      );

      dao.insertHistoryRecord(newRecord);
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
            Text('Archive Tenancy Record', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 16.0),
            TenantHistoryFormFields(
              propertyIdController: _propertyIdController,
              nameController: _nameController,
              depositController: _depositController,
              notesController: _notesController,
            ),
            const SizedBox(height: 24.0),
            ElevatedButton(onPressed: _submitForm, child: const Text('Archive Record')),
          ],
        ),
      ),
    );
  }
}