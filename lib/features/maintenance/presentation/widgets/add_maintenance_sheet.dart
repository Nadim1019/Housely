// lib/features/maintenance/presentation/widgets/add_maintenance_sheet.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:drift/drift.dart' as drift;
import 'package:housely/core/database/database_provider.dart';
import 'package:housely/core/database/app_database.dart';

/// Modal sheet for landlords/owners to record property repair and maintenance logs.
class AddMaintenanceSheet extends ConsumerStatefulWidget {
  /// Constructs an [AddMaintenanceSheet] instance.
  const AddMaintenanceSheet({super.key});

  @override
  ConsumerState<AddMaintenanceSheet> createState() => _AddMaintenanceSheetState();
}

class _AddMaintenanceSheetState extends ConsumerState<AddMaintenanceSheet> {
  final _formKey = GlobalKey<FormState>();
  final _propertyIdController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _costController = TextEditingController();
  final _techController = TextEditingController();

  @override
  void dispose() {
    _propertyIdController.dispose();
    _descriptionController.dispose();
    _costController.dispose();
    _techController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      final dao = ref.read(maintenanceDaoProvider);
      final newRecord = MaintenanceTableCompanion.insert(
        propertyId: int.parse(_propertyIdController.text.trim()),
        problemDescription: _descriptionController.text.trim(),
        cost: drift.Value(double.tryParse(_costController.text.trim()) ?? 0.0),
        technicianInfo: drift.Value(
          _techController.text.trim().isEmpty ? null : _techController.text.trim(),
        ),
      );

      dao.insertRequest(newRecord);
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
            Text('Log Maintenance Record', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 16.0),
            TextFormField(
              controller: _propertyIdController,
              decoration: const InputDecoration(labelText: 'Property Unit ID'),
              keyboardType: TextInputType.number,
              validator: (val) => val == null || val.isEmpty ? 'Required' : null,
            ),
            const SizedBox(height: 12.0),
            TextFormField(
              controller: _descriptionController,
              decoration: const InputDecoration(labelText: 'Issue / Repair Description'),
              validator: (val) => val == null || val.isEmpty ? 'Required' : null,
            ),
            const SizedBox(height: 12.0),
            TextFormField(
              controller: _costController,
              decoration: const InputDecoration(labelText: 'Repair Cost (\$)'),
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
            ),
            const SizedBox(height: 12.0),
            TextFormField(
              controller: _techController,
              decoration: const InputDecoration(labelText: 'Technician / Vendor Info'),
            ),
            const SizedBox(height: 24.0),
            ElevatedButton(onPressed: _submitForm, child: const Text('Save Record')),
          ],
        ),
      ),
    );
  }
}