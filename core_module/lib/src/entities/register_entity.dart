import 'entity.dart';

class RegisterEntity extends Entity {
  // Campos endpoint register
  final String email;
  final String password;
  final String firstName;
  final String lastName;
  final String document;
  final String phone;

  RegisterEntity(
    super.id, {
    required this.email,
    required this.password,
    required this.firstName,
    required this.lastName,
    required this.document,
    required this.phone,
  });
}
