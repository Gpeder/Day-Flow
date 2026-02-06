import 'package:dayflow/model/tarefa_model.dart';
import 'package:flutter/material.dart';

class CalendarioController extends ChangeNotifier {
  DateTime mesAtual = DateTime.now();
  DateTime? dataSelecionada;

  DateTime get dataSelecionadaEfetiva => dataSelecionada ?? DateTime.now();

  List<TarefaModel> get tarefasDoDia =>
      TarefaModel.getTarefasPorData(dataSelecionadaEfetiva);

  void proximoMes() {
    mesAtual = DateTime(mesAtual.year, mesAtual.month + 1);
    notifyListeners();
  }

  void mesAnterior() {
    mesAtual = DateTime(mesAtual.year, mesAtual.month - 1);
    notifyListeners();
  }

  void selecionarData(DateTime selectedDay, DateTime focusedDay) {
    dataSelecionada = selectedDay;
    mesAtual = focusedDay;
    notifyListeners();
  }

  void atualizarMes(DateTime focusedDay) {
    mesAtual = focusedDay;
    notifyListeners();
  }

  String formatDataPT(DateTime data) {
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

  String formatDataPT2(DateTime data) {

    const meses = [
      'Janeiro',
      'Fevereiro',
      'Março',
      'Abril',
      'Maio',
      'Junho',
      'Julho',
      'Agosto',
      'Setembro',
      'Outubro',
      'Novembro',
      'Dezembro',
    ];

    final mes = meses[data.month - 1];

    return '$mes ${data.year}';
  }
}
