import 'package:core_module/core_module.dart';

class RequestEntity extends Entity {
  final String title;
  final String description;
  final double amount;
  // TODO - Além do enum tem que ter uma descrição do status
  final RequestStatusEnum status;
  // TODO - Continua sem aplicação de acordo com o Figma
  final HelpTypeEnum helpType;
  final int? godFather;
  // TODO - Figma alterado para entity Conta Bancária
  // final String? financialPixkey;
  // final String? financialBank;
  // final String? financialAgency;
  // final String? financialAccount;
  final BankAccountEntity bankAccount;
  final DateTime? createdAt;

  // TODO - Não tem no endpoit
  final Address address;
  final int userId;

  RequestEntity(
    super.id, {
    required this.title,
    required this.description,
    required this.amount,
    required this.status,
    required this.helpType,
    this.godFather,
    // this.financialPixkey,
    // this.financialBank,
    // this.financialAgency,
    // this.financialAccount,
    required this.bankAccount, 
    this.createdAt,
    required this.userId,
    required this.address,
  });
}

class BankAccountEntity extends Entity {
  final String bank;
  final String agency;
  final String account;
  final String digit;
  final String pixKey;

  BankAccountEntity(super.id, {
    required this.bank,
    required this.agency,
    required this.account,
    required this.digit,
    required this.pixKey,
  });
}
