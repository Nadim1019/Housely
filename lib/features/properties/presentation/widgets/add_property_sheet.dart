// lib/features/properties/presentation/widgets/add_property_sheet.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:drift/drift.dart' as drift;
import 'package:housely/core/database/database_provider.dart';
import 'package:housely/core/database/app_database.dart';

/// Modal sheet component for validating and saving new properties into Drift.
class AddPropertySheet extends ConsumerStatefulWidget {
  /// Constructs an [AddPropertySheet] instance.
  const AddPropertySheet({super.key});

  @override
  ConsumerState<AddPropertySheet> createState() => _AddPropertySheetState();
}

class _AddPropertySheetState extends ConsumerState<AddPropertySheet> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _addressController = TextEditingController();
  final _rentController = TextEditingController();
  String _selectedType = 'Apartment';

  @override
  void dispose() {
    _nameController.dispose();
    _addressController.dispose();
    _rentController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      final dao = ref.read(propertiesDaoProvider);
      final newProperty = PropertiesTableCompanion.insert(
        name: _nameController.text.trim(),
        address: _addressController.text.trim(),
        propertyType: drift.Value(_selectedType),
        monthlyRent: double.parse(_rentController.text.trim()),
      );
      dao.insertProperty(newProperty);
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
            Text('Add New Property', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 16.0),
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Property Name (e.g. Unit 1A)'),
              validator: (val) => val == null || val.isEmpty ? 'Required' : null,
            ),
            const SizedBox(height: 12.0),
            TextFormField(
              controller: _addressController,
              decoration: const InputDecoration(labelText: 'Address'),
              validator: (val) => val == null || val.isEmpty ? 'Required' : null,
            ),
            const SizedBox(height: 12.0),
            DropdownButtonFormField<String>(
              initialValue: _selectedType,
              decoration: const InputDecoration(labelText: 'Property Type'),
              items: const [
                DropdownMenuItem(value: 'Apartment', child: Text('Apartment')),
                DropdownMenuItem(value: 'House', child: Text('House')),
                DropdownMenuItem(value: 'Commercial', child: Text('Commercial')),
              ],
              onChanged: (val) => val != null ? setState(() => _selectedType = val) : null,
            ),
            const SizedBox(height: 12.0),
            TextFormField(
              controller: _rentController,
              decoration: const InputDecoration(labelText: 'Monthly Rent (\$)'),
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              validator: (val) {
                if (val == null || val.isEmpty) return 'Required';
                if (double.tryParse(val) == null) return 'Must be a valid number';
                return null;
              },
            ),
            const SizedBox(height: 24.0),
            ElevatedButton(onPressed: _submitForm, child: const Text('Save Property')),
          ],
        ),
      ),
    );
  }
}