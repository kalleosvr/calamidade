import 'package:core_module/core_module.dart';

class RequestAdapter {
  Map<String, dynamic> toJson(RequestEntity request) {
    return {
      'title': request.title,
      'description': request.description,
      'amount': request.amount,
      'status': request.status.index,
      'helpType': request.helpType.index,
      'godFather': request.godFather,
      // 'financialPixkey': request.financialPixkey,
      // 'financialBank': request.financialBank,
      // 'financialAgency': request.financialAgency,
      // 'financialAccount': request.financialAccount,
      'bankAccount': BankAccountAdapter.toJson(request.bankAccount),
      'createdAt': request.createdAt,
      'userId': request.userId,
      'address': AddressAdapter.toJson(request.address),
    };
  }

  static RequestEntity fromJson(Map<String, dynamic> json) {
    return RequestEntity(
      json['id'],
      title: json['title'],
      description: json['description'],
      amount: double.parse(json['amount']),
      status: RequestStatusEnum.fromId(json['status']),
      helpType: HelpTypeEnum.fromId(json['helpType']),
      godFather: int.parse(json['godFather']),
      // financialPixkey: map['financialPixkey'],
      // financialBank: map['financialBank'],
      // financialAgency: map['financialAgency'],
      // financialAccount: map['financialAccount'],
      bankAccount: BankAccountAdapter.fromJson(json['bankAccount']),
      createdAt: DateTime.parse(json['createdAt']),
      userId: int.parse(json['userId']),
      address: AddressAdapter.fromJson(json['address']),
    );
  }
}
