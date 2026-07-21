import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:housely/core/database/app_database.dart';
import 'package:housely/core/database/tables.dart';
import 'package:housely/features/auth/data/auth_repository_impl.dart';
import 'package:housely/features/auth/domain/auth_repository.dart';
import 'package:housely/features/auth/domain/user_entity.dart';

final appDatabaseProvider = Provider<AppDatabase>((ref) {
  final db = AppDatabase();
  ref.onDispose(() => db.close());
  return db;
});

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final db = ref.watch(appDatabaseProvider);
  return AuthRepositoryImpl(db);
});

final authStateProvider =
StreamNotifierProvider<AuthStateNotifier, UserEntity?>(
  AuthStateNotifier.new,
);

class AuthStateNotifier extends StreamNotifier<UserEntity?> {
  @override
  Stream<UserEntity?> build() {
    final repo = ref.watch(authRepositoryProvider);
    return repo.watchAuthenticatedUser();
  }

  Future<void> loginMock(String email, UserRole role) async {
    final repo = ref.read(authRepositoryProvider);
    final user = await repo.loginMock(email: email, role: role);
    state = AsyncData(user);
  }

  Future<void> logout() async {
    final repo = ref.read(authRepositoryProvider);
    await repo.logout();
    state = const AsyncData(null);
  }
}