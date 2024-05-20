import 'package:core_module/core_module.dart';
import 'package:dashboard/app/features/home/new_requests/interactor/entities/new_request_entity.dart';

class NewRequestAdapter {
  static NewRequestEntity fromJson(Map json) {
    return NewRequestEntity(
      json['id'] ?? -1,
      titleDescription: json['description'],
      date: json['date'],
      requestedIncome: json['requestedIncome'],
      name: json['name'],
      status: RequestStatusEnum.fromId(json['status']),
      city: json['city'],
      phone: json['phone'],
      bank: json['bank'],
      agency: json['agency'],
      account: json['account'],
      urlImage: json['urlImage'],
      description: json['description'],
    );
  }
}
