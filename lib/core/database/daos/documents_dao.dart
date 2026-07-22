// lib/core/database/daos/documents_dao.dart

import 'package:drift/drift.dart';
import 'package:housely/core/database/app_database.dart';
import 'package:housely/core/database/tables/documents_table.dart';

part 'documents_dao.g.dart';

/// DAO providing CRUD operations and streams for stored documents in [DocumentsTable].
@DriftAccessor(tables: [DocumentsTable])
class DocumentsDao extends DatabaseAccessor<AppDatabase>
    with _$DocumentsDaoMixin {
  DocumentsDao(super.db);

  /// Streams all stored documents ordered by upload date descending.
  Stream<List<PropertyDocument>> watchAllDocuments() {
    return (select(documentsTable)
      ..orderBy([(t) => OrderingTerm.desc(t.uploadedAt)]))
        .watch();
  }

  /// Streams documents associated with a specific property.
  Stream<List<PropertyDocument>> watchDocumentsByProperty(int propertyId) {
    return (select(documentsTable)
      ..where((t) => t.propertyId.equals(propertyId))
      ..orderBy([(t) => OrderingTerm.desc(t.uploadedAt)]))
        .watch();
  }

  /// Inserts a new document metadata entry.
  Future<int> insertDocument(DocumentsTableCompanion document) {
    return into(documentsTable).insert(document);
  }

  /// Updates an existing document record.
  Future<bool> updateDocument(DocumentsTableCompanion document) {
    return update(documentsTable).replace(document);
  }

  /// Deletes a document record by ID.
  Future<int> deleteDocument(int id) {
    return (delete(documentsTable)..where((t) => t.id.equals(id))).go();
  }
}