// lib/features/assets/presentation/widgets/add_asset_sheet.dart

import 'package:drift/drift.dart' as drift;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:housely/core/database/app_database.dart';
import 'package:housely/core/database/database_provider.dart';

/// Modal bottom sheet widget enabling users to log new property assets.
///
/// Captures asset name, estimated value, condition status, and linked property ID,
/// saving records into the Drift database.
class AddAssetSheet extends ConsumerStatefulWidget {
  /// Constructs an [AddAssetSheet] instance.
  const AddAssetSheet({super.key});

  @override
  ConsumerState<AddAssetSheet> createState() => _AddAssetSheetState();
}

class _AddAssetSheetState extends ConsumerState<AddAssetSheet> {
  /// Form key used to handle validation across user input fields.
  final _formKey = GlobalKey<FormState>();

  /// Text editing controllers managing asset field state values.
  final _nameController = TextEditingController();
  final _valueController = TextEditingController();
  final _conditionController = TextEditingController(text: 'Good');
  final _propertyIdController = TextEditingController(text: '1');

  @override
  void dispose() {
    _nameController.dispose();
    _valueController.dispose();
    _conditionController.dispose();
    _propertyIdController.dispose();
    super.dispose();
  }

  /// Validates input values and inserts a new asset row into [AssetsTable].
  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;

    final db = ref.read(databaseProvider);
    final value = double.tryParse(_valueController.text.trim()) ?? 0.0;
    final propertyId = int.tryParse(_propertyIdController.text.trim()) ?? 1;

    await db.into(db.assetsTable).insert(
      AssetsTableCompanion.insert(
        propertyId: propertyId,
        assetName: _nameController.text.trim(),
        purchasePrice: drift.Value(value),
        condition: drift.Value(_conditionController.text.trim()),
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
            Text('Register New Asset', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 16),
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Asset Name (e.g. Washing Machine)'),
              validator: (v) => v == null || v.trim().isEmpty ? 'Required' : null,
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _valueController,
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              decoration: const InputDecoration(labelText: 'Estimated Value (\$)'),
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _conditionController,
              decoration: const InputDecoration(labelText: 'Condition (e.g. Good, Needs Repair)'),
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
              child: const Text('Save Asset'),
            ),
          ],
        ),
      ),
    );
  }
}