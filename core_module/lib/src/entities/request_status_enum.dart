enum RequestStatusEnum {
  notDefined('Não definido', 0xFF010101, 0xFFFFFFFF),
  analisys('Em analise', 0xFFfcb900, 0xFFa17703),
  accepted('Aceito', 0xFF129166, 0xFF0a4531),
  rejected('Rejeitado', 0xFFEB5757, 0xFF7d2e2e),
  concluded('Concluído', 0xFF129166, 0xFF0a4531);

  final String label;
  final int color;
  final int foregroundColor;

  const RequestStatusEnum(this.label, this.color, this.foregroundColor);

  static RequestStatusEnum fromId(int id) {
    switch (id) {
      case 1:
        return RequestStatusEnum.analisys;
      case 2:
        return RequestStatusEnum.accepted;
      case 3:
        return RequestStatusEnum.rejected;
      case 4:
        return RequestStatusEnum.concluded;
      default:
        return RequestStatusEnum.notDefined;
    }
  }
}
