// lib/features/documents/presentation/widgets/document_form_fields.dart

import 'package:flutter/material.dart';

/// Reusable input fields widget for recording document metadata.
class DocumentFormFields extends StatelessWidget {
  /// Text controller managing the document title input.
  final TextEditingController titleController;

  /// Text controller managing the physical or local file path input.
  final TextEditingController filePathController;

  /// Text controller managing the associated property ID input.
  final TextEditingController propertyIdController;

  /// Selected category string value.
  final String selectedCategory;

  /// Callback fired when document category option changes.
  final ValueChanged<String?> onCategoryChanged;

  /// Constructs a [DocumentFormFields] instance.
  const DocumentFormFields({
    super.key,
    required this.titleController,
    required this.filePathController,
    required this.propertyIdController,
    required this.selectedCategory,
    required this.onCategoryChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: titleController,
          decoration: const InputDecoration(labelText: 'Document Title'),
          validator: (val) => val == null || val.isEmpty ? 'Required' : null,
        ),
        const SizedBox(height: 12.0),
        DropdownButtonFormField<String>(
          initialValue: selectedCategory,
          decoration: const InputDecoration(labelText: 'Category'),
          items: const [
            DropdownMenuItem(value: 'Lease', child: Text('Lease')),
            DropdownMenuItem(value: 'Tax', child: Text('Tax')),
            DropdownMenuItem(value: 'Insurance', child: Text('Insurance')),
            DropdownMenuItem(value: 'Permit', child: Text('Permit')),
          ],
          onChanged: onCategoryChanged,
        ),
        const SizedBox(height: 12.0),
        TextFormField(
          controller: filePathController,
          decoration: const InputDecoration(labelText: 'File Path / URI'),
          validator: (val) => val == null || val.isEmpty ? 'Required' : null,
        ),
        const SizedBox(height: 12.0),
        TextFormField(
          controller: propertyIdController,
          decoration: const InputDecoration(labelText: 'Property ID (Optional)'),
          keyboardType: TextInputType.number,
        ),
      ],
    );
  }
}