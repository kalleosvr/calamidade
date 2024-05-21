import 'package:core_module/core_module.dart';

class AddressAdapter {
  static Map<String, dynamic> toJson(Address address) {
    return {
      'label': address.label,
      'CEP': address.cep,
      'state': address.state,
      'street': address.street,
      'complement': address.complement,
      'number': address.number,
      'city': address.city,
      'locationLatitude': address.locationLatitude,
      'locationLongitude': address.locationLongitude,
      'userId': address.userId,
    };
  }

  static Address fromJson(Map<String, dynamic> map) {
    return Address(
      int.parse(map['id']),
      label: map['label'],
      cep: map['CEP'],
      state: map['state'],
      street: map['street'],
      complement: map['complement'],
      number: map['number'],
      city: map['city'],
      locationLatitude: double.parse(map['locationLatitude']),
      locationLongitude: double.parse(map['locationLongitude']),
      userId: int.parse(map['userId']),
    );
  }
}
