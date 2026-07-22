// lib/core/database/tables/documents_table.dart

import 'package:drift/drift.dart';
import 'package:housely/core/database/tables/properties_table.dart';

/// Drift table definition for storing document vault file metadata.
/// Manages lease copies, tax records, property insurance, and permits.
@DataClassName('PropertyDocument')
class DocumentsTable extends Table {
  /// Unique identifier for the document entry.
  IntColumn get id => integer().autoIncrement()();

  /// Optional foreign key linking to a property unit (null for global docs).
  IntColumn get propertyId =>
      integer().nullable().references(PropertiesTable, #id)();

  /// User-defined title for the document.
  TextColumn get documentTitle => text().withLength(min: 1, max: 100)();

  /// Document classification (e.g., 'Lease', 'Tax', 'Insurance', 'Permit').
  TextColumn get category => text().withDefault(const Constant('Lease'))();

  /// Local storage path or file URI for the physical document file.
  TextColumn get filePath => text()();

  /// File extension or mime type (e.g., 'pdf', 'png', 'jpg').
  TextColumn get fileType => text().nullable()();

  /// Optional expiration or renewal deadline for the document.
  DateTimeColumn get expiryDate => dateTime().nullable()();

  /// Timestamp when the document was uploaded or recorded.
  DateTimeColumn get uploadedAt =>
      dateTime().withDefault(currentDateAndTime)();
}