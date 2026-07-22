// lib/features/assets/presentation/widgets/add_asset_sheet.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:drift/drift.dart' as drift;
import 'package:housely/core/database/database_provider.dart';
import 'package:housely/core/database/app_database.dart';

/// Modal sheet component for logging new appliance and furniture assets in Drift.
class AddAssetSheet extends ConsumerStatefulWidget {
  /// Constructs an [AddAssetSheet] instance.
  const AddAssetSheet({super.key});

  @override
  ConsumerState<AddAssetSheet> createState() => _AddAssetSheetState();
}

class _AddAssetSheetState extends ConsumerState<AddAssetSheet> {
  final _formKey = GlobalKey<FormState>();
  final _propertyIdController = TextEditingController();
  final _nameController = TextEditingController();
  final _priceController = TextEditingController();
  String _category = 'Appliance';
  String _condition = 'Good';

  @override
  void dispose() {
    _propertyIdController.dispose();
    _nameController.dispose();
    _priceController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      final dao = ref.read(assetsDaoProvider);
      final newAsset = AssetsTableCompanion.insert(
        propertyId: int.parse(_propertyIdController.text.trim()),
        assetName: _nameController.text.trim(),
        category: drift.Value(_category),
        condition: drift.Value(_condition),
        purchasePrice: drift.Value(double.tryParse(_priceController.text.trim())),
      );

      dao.insertAsset(newAsset);
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
            Text('Add Inventory Asset', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 16.0),
            TextFormField(
              controller: _propertyIdController,
              decoration: const InputDecoration(labelText: 'Property Unit ID'),
              keyboardType: TextInputType.number,
              validator: (val) => val == null || val.isEmpty ? 'Required' : null,
            ),
            const SizedBox(height: 12.0),
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Asset Name (e.g. Inverter AC)'),
              validator: (val) => val == null || val.isEmpty ? 'Required' : null,
            ),
            const SizedBox(height: 12.0),
            DropdownButtonFormField<String>(
              initialValue: _category,
              decoration: const InputDecoration(labelText: 'Category'),
              items: const [
                DropdownMenuItem(value: 'Appliance', child: Text('Appliance')),
                DropdownMenuItem(value: 'Furniture', child: Text('Furniture')),
                DropdownMenuItem(value: 'Electronics', child: Text('Electronics')),
              ],
              onChanged: (val) => val != null ? setState(() => _category = val) : null,
            ),
            const SizedBox(height: 12.0),
            DropdownButtonFormField<String>(
              initialValue: _condition,
              decoration: const InputDecoration(labelText: 'Condition'),
              items: const [
                DropdownMenuItem(value: 'New', child: Text('New')),
                DropdownMenuItem(value: 'Good', child: Text('Good')),
                DropdownMenuItem(value: 'Needs Repair', child: Text('Needs Repair')),
              ],
              onChanged: (val) => val != null ? setState(() => _condition = val) : null,
            ),
            const SizedBox(height: 12.0),
            TextFormField(
              controller: _priceController,
              decoration: const InputDecoration(labelText: 'Purchase Price (\$)'),
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
            ),
            const SizedBox(height: 24.0),
            ElevatedButton(onPressed: _submitForm, child: const Text('Save Asset')),
          ],
        ),
      ),
    );
  }
}