// lib/features/documents/presentation/screens/documents_screen.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:housely/core/database/database_provider.dart';
import 'package:housely/features/documents/presentation/widgets/add_document_sheet.dart';

/// StreamProvider watching real-time document entries from [DocumentsDao].
final documentsStreamProvider = StreamProvider((ref) {
  final documentsDao = ref.watch(documentsDaoProvider);
  return documentsDao.watchAllDocuments();
});

/// Screen component displaying property document metadata with live stream updates.
class DocumentsScreen extends ConsumerWidget {
  /// Constructs a [DocumentsScreen] instance.
  const DocumentsScreen({super.key});

  void _showAddSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => Padding(
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: const AddDocumentSheet(),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final docsAsync = ref.watch(documentsStreamProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Document Vault')),
      body: docsAsync.when(
        data: (documents) {
          if (documents.isEmpty) {
            return const Center(child: Text('No documents logged yet.'));
          }
          return ListView.builder(
            itemCount: documents.length,
            itemBuilder: (context, index) {
              final doc = documents[index];
              return ListTile(
                leading: const Icon(Icons.folder_shared),
                title: Text(doc.documentTitle),
                subtitle: Text('Category: ${doc.category}\nPath: ${doc.filePath}'),
                isThreeLine: true,
                trailing: doc.propertyId != null ? Chip(label: Text('Unit ${doc.propertyId}')) : null,
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Error: $err')),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddSheet(context),
        tooltip: 'Add Document',
        child: const Icon(Icons.note_add),
      ),
    );
  }
}