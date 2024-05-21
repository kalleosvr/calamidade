import 'package:core_module/core_module.dart';

class UserEntity extends Entity {
  // Campos endpoint register
  final String email;
  final String password;
  final String firstName;
  final String lastName;
  final String document;
  final String phone;

  // Campos adicionais endpoint user
  final String? photoId;
  final UserRole role;
  final UserStatus status;

  UserEntity(
    super.id, {
    required this.email,
    required this.password,
    required this.firstName,
    required this.lastName,
    required this.document,
    required this.phone,
    this.photoId,
    required this.role,
    required this.status,
  });

  factory UserEntity.register
    ({required String email,
      required String password,
      required String firstName,
      required String lastName,
      required String document,
      required String phone}) {
    return UserEntity(
      -1,
      email: email,
      password: password,
      firstName: firstName,
      lastName: lastName,
      document: document,
      phone: phone,
      role: UserRole(id: '1', label: 'User'),
      status: UserStatus(id: '1', label: 'Active'),
    );
  }
}

// TODO - Decidir se vai utilizar class ou enum

class UserRole {
  final String id;
  final String label;

  UserRole({required this.id, required this.label});
}

class UserStatus {
  final String id;
  final String label;

  UserStatus({required this.id, required this.label});
}

// enum UserStatusEnum {
//   inactive('Inativo'),
//   active('Ativo');
//
//   final String label;
//
//   const UserStatusEnum(this.label);
//
//   static UserStatusEnum fromId(int id) {
//     switch (id) {
//       case 1:
//         return UserStatusEnum.active;
//       default:
//         return UserStatusEnum.inactive;
//     }
//   }
// }
//
// enum UserRoleEnum {
//   user('User'),
//   admin('Admin');
//
//   final String label;
//
//   const UserRoleEnum(this.label);
//
//   static UserRoleEnum fromId(int id) {
//     switch (id) {
//       case 1:
//         return UserRoleEnum.admin;
//       default:
//         return UserRoleEnum.user;
//     }
//   }
