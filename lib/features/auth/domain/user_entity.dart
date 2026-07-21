import 'package:housely/core/database/tables.dart';

class UserEntity {
  final String id;
  final String name;
  final String email;
  final UserRole role;
  final String? unitNumber;
  final DateTime createdAt;

  const UserEntity({
    required this.id,
    required this.name,
    required this.email,
    required this.role,
    this.unitNumber,
    required this.createdAt,
  });

  bool get isOwner => role == UserRole.owner;
  bool get isResident => role == UserRole.resident;

  UserEntity copyWith({
    String? id,
    String? name,
    String? email,
    UserRole? role,
    String? unitNumber,
    DateTime? createdAt,
  }) {
    return UserEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      role: role ?? this.role,
      unitNumber: unitNumber ?? this.unitNumber,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}