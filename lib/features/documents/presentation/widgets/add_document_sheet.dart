// lib/features/documents/presentation/widgets/add_document_sheet.dart

import 'package:drift/drift.dart' as drift;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:housely/core/database/app_database.dart';
import 'package:housely/core/database/database_provider.dart';
import 'package:housely/features/documents/presentation/widgets/document_form_fields.dart';

/// Modal bottom sheet widget enabling users to log new property documents.
///
/// Features input fields for document title, file path, property ID, and category,
/// persisting entries via [documentsDaoProvider].
class AddDocumentSheet extends ConsumerStatefulWidget {
  /// Constructs an [AddDocumentSheet] instance.
  const AddDocumentSheet({super.key});

  @override
  ConsumerState<AddDocumentSheet> createState() => _AddDocumentSheetState();
}

class _AddDocumentSheetState extends ConsumerState<AddDocumentSheet> {
  /// Global key used to validate form input states prior to persistence.
  final _formKey = GlobalKey<FormState>();

  /// Text editing controllers managing input field values.
  final _titleController = TextEditingController();
  final _filePathController = TextEditingController();
  final _propertyIdController = TextEditingController();

  /// Holds the selected document category selection state.
  String _category = 'Lease';

  @override
  void dispose() {
    _titleController.dispose();
    _filePathController.dispose();
    _propertyIdController.dispose();
    super.dispose();
  }

  /// Validates input values and delegates document insertion to the DAO provider.
  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      final dao = ref.read(documentsDaoProvider);
      final propId = int.tryParse(_propertyIdController.text.trim());

      final newDoc = DocumentsTableCompanion.insert(
        documentTitle: _titleController.text.trim(),
        filePath: _filePathController.text.trim(),
        category: drift.Value(_category),
        propertyId: drift.Value(propId),
      );

      dao.insertDocument(newDoc);
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
            Text('Add Document Record', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 16.0),
            DocumentFormFields(
              titleController: _titleController,
              filePathController: _filePathController,
              propertyIdController: _propertyIdController,
              selectedCategory: _category,
              onCategoryChanged: (val) => val != null ? setState(() => _category = val) : null,
            ),
            const SizedBox(height: 24.0),
            ElevatedButton(onPressed: _submitForm, child: const Text('Save Document')),
          ],
        ),
      ),
    );
  }
}