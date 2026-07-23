// lib/features/maintenance/presentation/widgets/add_maintenance_sheet.dart

import 'package:drift/drift.dart' as drift;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:housely/core/database/app_database.dart';
import 'package:housely/core/database/database_provider.dart';

/// Modal bottom sheet widget enabling users to log new maintenance requests.
///
/// Captures problem description, priority level, and target property ID,
/// persisting entries into [MaintenanceTable].
class AddMaintenanceSheet extends ConsumerStatefulWidget {
  /// Constructs an [AddMaintenanceSheet] instance.
  const AddMaintenanceSheet({super.key});

  @override
  ConsumerState<AddMaintenanceSheet> createState() => _AddMaintenanceSheetState();
}

class _AddMaintenanceSheetState extends ConsumerState<AddMaintenanceSheet> {
  /// Global key validating internal text fields before submission.
  final _formKey = GlobalKey<FormState>();

  /// Form field controllers managing maintenance log inputs.
  final _descriptionController = TextEditingController();
  final _propertyIdController = TextEditingController(text: '1');
  String _selectedPriority = 'Medium';

  @override
  void dispose() {
    _descriptionController.dispose();
    _propertyIdController.dispose();
    super.dispose();
  }

  /// Inserts a new maintenance ticket into the database engine.
  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;

    final db = ref.read(databaseProvider);
    final propertyId = int.tryParse(_propertyIdController.text.trim()) ?? 1;

    await db.into(db.maintenanceTable).insert(
      MaintenanceTableCompanion.insert(
        propertyId: propertyId,
        problemDescription: _descriptionController.text.trim(),
        status: const drift.Value('Pending'),
        requestDate: drift.Value(DateTime.now()),
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
            Text('New Maintenance Request', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 16),
            TextFormField(
              controller: _descriptionController,
              decoration: const InputDecoration(labelText: 'Problem Description'),
              validator: (v) => v == null || v.trim().isEmpty ? 'Required' : null,
            ),
            const SizedBox(height: 12),
            DropdownButtonFormField<String>(
              initialValue: _selectedPriority,
              decoration: const InputDecoration(labelText: 'Priority Level'),
              items: ['Low', 'Medium', 'High', 'Emergency']
                  .map((p) => DropdownMenuItem(value: p, child: Text(p)))
                  .toList(),
              onChanged: (val) {
                if (val != null) setState(() => _selectedPriority = val);
              },
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
              child: const Text('Submit Request'),
            ),
          ],
        ),
      ),
    );
  }
}