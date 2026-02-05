class DateHelpers {
  static String formatDataPT(DateTime data) {
    const diasSemana = ['Seg', 'Ter', 'Qua', 'Qui', 'Sex', 'Sáb', 'Dom'];

    const meses = [
      'janeiro',
      'fevereiro',
      'março',
      'abril',
      'maio',
      'junho',
      'julho',
      'agosto',
      'setembro',
      'outubro',
      'novembro',
      'dezembro',
    ];

    final dia = data.day;
    final diaSet = diasSemana[data.weekday - 1];
    final mes = meses[data.month - 1];

    return '$diaSet, $dia de $mes';
  }

  static DateTime parseData(String? dataString) {
    if (dataString == null || dataString.isEmpty) {
      return DateTime.now();
    }
    try {
      return DateTime.parse(dataString);
    } catch (e) {
      return DateTime.now();
    }
  }

  static String formatDataNumerica(DateTime data) {
    return '${data.day.toString().padLeft(2, '0')}/${data.month.toString().padLeft(2, '0')}/${data.year}';
  }

  static String formatHora(String? hora) {
    return hora ?? '--:--';
  }
}
