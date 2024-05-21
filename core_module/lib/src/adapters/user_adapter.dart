import 'package:core_module/core_module.dart';

class UserAdapter {
  static Map<String, dynamic> toJson(UserEntity user) {
    return {
      'email': user.email,
      'password': user.password,
      'firstName': user.firstName,
      'lastName': user.lastName,
      'document': user.document,
      'phone': user.phone,
      // TODO - Alterar schema no backend para photoId
      'photo': {'id': user.photoId},
      'role': UserRoleAdapter.toJson(user.role),
      'status': UserStatusAdapter.toJson(user.status)
    };
  }

  static Map<String, dynamic> toRegisterJson(UserEntity user) {
    return {
      'email': user.email,
      'password': user.password,
      'firstName': user.firstName,
      'lastName': user.lastName,
      'document': user.document,
      'phone': user.phone,
    };
  }

  static UserEntity fromJson(Map<String, dynamic> json) {
    return UserEntity(
      json['id'],
      email: json['email'],
      password: json['password'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      document: json['document'],
      phone: json['phone'],
      // TODO - Alterar schema no backend para photoId
      photoId: json['photo']['id'],
      role: UserRoleAdapter.fromJson(json['role']),
      status: UserStatusAdapter.fromJson(json['status']),
    );
  }
}

class UserStatusAdapter {
  static Map<String, dynamic> toJson(UserStatus status) => {
        'id': status.id,
        'label': status.label,
      };

  static UserStatus fromJson(Map<String, dynamic> json) {
    return UserStatus(
      id: json['id'],
      label: json['label'],
    );
  }
}

class UserRoleAdapter {
  static Map<String, dynamic> toJson(UserRole role) => {
        'id': role.id,
        'label': role.label,
      };

  static UserRole fromJson(Map<String, dynamic> json) {
    return UserRole(
      id: json['id'],
      label: json['label'],
    );
  }
}
