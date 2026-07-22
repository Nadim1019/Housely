// lib/core/database/database_provider.dart

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:housely/core/database/app_database.dart';

/// Global Riverpod provider exposing the single [AppDatabase] instance.
/// Uses [autoDispose] with onDispose hook to properly close SQLite
/// connection when unused or during app teardown.
final appDatabaseProvider = Provider<AppDatabase>((ref) {
  final database = AppDatabase();

  ref.onDispose(() {
    database.close();
  });

  return database;
});