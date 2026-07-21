import 'package:housely/core/database/tables.dart';
import 'package:housely/features/auth/domain/user_entity.dart';

abstract class AuthRepository {
  /// Stream of currently authenticated user state.
  Stream<UserEntity?> watchAuthenticatedUser();

  /// Authenticates user or creates demo credentials for test flow.
  Future<UserEntity> loginMock({
    required String email,
    required UserRole role,
  });

  /// Logs out the active user session.
  Future<void> logout();

  /// Retrieves cached local session user.
  Future<UserEntity?> getCurrentUser();
}