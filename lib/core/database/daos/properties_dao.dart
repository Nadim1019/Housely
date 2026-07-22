// lib/core/database/daos/properties_dao.dart

import 'package:drift/drift.dart';
import 'package:housely/core/database/app_database.dart';
import 'package:housely/core/database/tables/properties_table.dart';

part 'properties_dao.g.dart';

@DriftAccessor(tables: [PropertiesTable])
class PropertiesDao extends DatabaseAccessor<AppDatabase>
    with _$PropertiesDaoMixin {
  PropertiesDao(super.db);

  Stream<List<Property>> watchAllProperties() {
    return (select(propertiesTable)
      ..orderBy([(t) => OrderingTerm.desc(t.id)]))
        .watch();
  }

  Future<Property?> getPropertyById(int id) {
    return (select(propertiesTable)..where((t) => t.id.equals(id)))
        .getSingleOrNull();
  }

  Future<int> insertProperty(PropertiesTableCompanion property) {
    return into(propertiesTable).insert(property);
  }

  Future<bool> updateProperty(PropertiesTableCompanion property) {
    return update(propertiesTable).replace(property);
  }

  Future<int> deleteProperty(int id) {
    return (delete(propertiesTable)..where((t) => t.id.equals(id))).go();
  }
}