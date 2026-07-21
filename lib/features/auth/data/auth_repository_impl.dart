import 'package:drift/drift.dart';
import 'package:housely/core/database/app_database.dart';
import 'package:housely/core/database/tables.dart';
import 'package:housely/features/auth/domain/auth_repository.dart';
import 'package:housely/features/auth/domain/user_entity.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AppDatabase _db;
  String? _activeUserId;

  AuthRepositoryImpl(this._db);

  @override
  Stream<UserEntity?> watchAuthenticatedUser() {
    return _db.select(_db.usersTable).watch().map((users) {
      if (_activeUserId == null || users.isEmpty) return null;
      try {
        final match = users.firstWhere((u) => u.id == _activeUserId);
        return _mapToEntity(match);
      } catch (_) {
        return null;
      }
    });
  }

  @override
  Future<UserEntity> loginMock({
    required String email,
    required UserRole role,
  }) async {
    final existing = await (_db.select(_db.usersTable)
      ..where((u) => u.email.equals(email)))
        .getSingleOrNull();

    if (existing != null) {
      _activeUserId = existing.id;
      return _mapToEntity(existing);
    }

    final id = DateTime.now().millisecondsSinceEpoch.toString();
    final newUser = UsersTableCompanion.insert(
      id: id,
      name: role == UserRole.owner ? 'Property Owner' : 'Resident Unit 4B',
      email: email,
      role: role,
      unitNumber: Value(role == UserRole.resident ? '4B' : null),
    );

    await _db.into(_db.usersTable).insert(newUser);
    _activeUserId = id;

    final created = await (_db.select(_db.usersTable)
      ..where((u) => u.id.equals(id)))
        .getSingle();

    return _mapToEntity(created);
  }

  @override
  Future<void> logout() async {
    _activeUserId = null;
  }

  @override
  Future<UserEntity?> getCurrentUser() async {
    if (_activeUserId == null) return null;
    final match = await (_db.select(_db.usersTable)
      ..where((u) => u.id.equals(_activeUserId!)))
        .getSingleOrNull();
    return match != null ? _mapToEntity(match) : null;
  }

  UserEntity _mapToEntity(UserTableData row) {
    return UserEntity(
      id: row.id,
      name: row.name,
      email: row.email,
      role: row.role,
      unitNumber: row.unitNumber,
      createdAt: row.createdAt,
    );
  }
}
