// lib/core/database/daos/assets_dao.dart

import 'package:drift/drift.dart';
import 'package:housely/core/database/app_database.dart';
import 'package:housely/core/database/tables/assets_table.dart';

part 'assets_dao.g.dart';

/// DAO providing CRUD operations and streams for property inventory in [AssetsTable].
@DriftAccessor(tables: [AssetsTable])
class AssetsDao extends DatabaseAccessor<AppDatabase> with _$AssetsDaoMixin {
  AssetsDao(super.db);

  /// Streams all assets across all properties ordered by asset name.
  Stream<List<PropertyAsset>> watchAllAssets() {
    return (select(assetsTable)
      ..orderBy([(t) => OrderingTerm.asc(t.assetName)]))
        .watch();
  }

  /// Streams inventory assets belonging to a specific property.
  Stream<List<PropertyAsset>> watchAssetsByProperty(int propertyId) {
    return (select(assetsTable)
      ..where((t) => t.propertyId.equals(propertyId))
      ..orderBy([(t) => OrderingTerm.asc(t.assetName)]))
        .watch();
  }

  /// Inserts a new asset inventory record.
  Future<int> insertAsset(AssetsTableCompanion asset) {
    return into(assetsTable).insert(asset);
  }

  /// Updates an existing asset entry.
  Future<bool> updateAsset(AssetsTableCompanion asset) {
    return update(assetsTable).replace(asset);
  }

  /// Deletes an asset record by ID.
  Future<int> deleteAsset(int id) {
    return (delete(assetsTable)..where((t) => t.id.equals(id))).go();
  }
}