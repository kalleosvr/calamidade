enum HelpTypeEnum {
  other('Outro'),
  financial('Financeiro'),
  product('Produto'),
  service('Serviço');

  final String label;

  const HelpTypeEnum(this.label);

  static HelpTypeEnum fromId(int id) {
    switch (id) {
      case 1:
        return HelpTypeEnum.financial;
      case 2:
        return HelpTypeEnum.product;
      case 3:
        return HelpTypeEnum.service;
      default:
        return HelpTypeEnum.other;
    }
  }
}
