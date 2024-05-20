import 'package:core_module/core_module.dart';

class NewRequestEntity extends Entity {
  final String titleDescription;
  final String name;
  final String city;
  final String phone;
  final String date;
  final RequestStatusEnum status;
  final String requestedIncome;
  final String bank;
  final String agency;
  final String account;
  final String urlImage;
  final String description;

  NewRequestEntity(
    super.id, {
    required this.titleDescription,
    required this.name,
    required this.city,
    required this.phone,
    required this.date,
    required this.status,
    required this.requestedIncome,
    required this.bank,
    required this.agency,
    required this.account,
    required this.urlImage,
    required this.description,
  });
}
