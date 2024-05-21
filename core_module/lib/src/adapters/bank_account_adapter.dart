import 'package:core_module/core_module.dart';

class BankAccountAdapter {
  static Map<String, dynamic> toJson(BankAccountEntity bankAccount) {
    return {
      'bank': bankAccount.bank,
      'agency': bankAccount.agency,
      'account': bankAccount.account,
      'digit': bankAccount.digit,
      'pixKey': bankAccount.pixKey,
    };
  }

  static BankAccountEntity fromJson(Map<String, dynamic> json) {
    return BankAccountEntity(
      json['id'],
      bank: json['bank'],
      agency: json['agency'],
      account: json['account'],
      digit: json['digit'],
      pixKey: json['pixKey'],
    );
  }
}
