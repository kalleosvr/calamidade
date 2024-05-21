import 'entity.dart';

class Address extends Entity {
  // TODO - backend em desacordo com o Figma
  final String label;
  final String cep;
  final String state;
  //
  final String street;
  final String complement;
  final String number;
  final String city;
  final double locationLatitude;
  final double locationLongitude;
  final int userId;

  Address(
    super.id, {
    required this.label,
    required this.cep,
    required this.state,
    required this.street,
    required this.complement,
    required this.number,
    required this.city,
    required this.locationLatitude,
    required this.locationLongitude,
    required this.userId,
  });
}
