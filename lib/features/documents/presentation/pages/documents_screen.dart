// lib/features/documents/presentation/pages/documents_screen.dart

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
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Document Vault')),
      body: docsAsync.when(
        data: (documents) {
          if (documents.isEmpty) {
            return const Center(child: Text('No documents logged yet.'));
          }
          return ListView.builder(
            padding: const EdgeInsets.all(12.0),
            itemCount: documents.length,
            itemBuilder: (context, index) {
              final doc = documents[index];
              return Card(
                elevation: 0,
                margin: const EdgeInsets.only(bottom: 8.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  side: BorderSide(color: theme.colorScheme.outlineVariant.withValues(alpha: 0.5)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          color: theme.colorScheme.primaryContainer,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Icon(
                          Icons.description,
                          color: theme.colorScheme.onPrimaryContainer,
                        ),
                      ),
                      const SizedBox(width: 12.0),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              doc.documentTitle,
                              style: theme.textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 4.0),
                            Text(
                              'Category: ${doc.category}',
                              style: theme.textTheme.bodySmall,
                            ),
                            Text(
                              'Path: ${doc.filePath}',
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: theme.colorScheme.outline,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                      if (doc.propertyId != null)
                        Chip(
                          label: Text('Unit ${doc.propertyId}'),
                          backgroundColor: theme.colorScheme.surfaceContainerHighest,
                          side: BorderSide.none,
                          visualDensity: VisualDensity.compact,
                        ),
                    ],
                  ),
                ),
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