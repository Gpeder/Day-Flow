import 'package:dayflow/helpers/date_helpers.dart';
import 'package:dayflow/model/categorias_model.dart';
import 'package:dayflow/model/tarefa_model.dart';
import 'package:dayflow/theme/theme.dart';
import 'package:flutter/material.dart';

class HomeController extends ChangeNotifier {
  Color getPrioridadeCor(String prioridade) {
    switch (prioridade) {
      case 'Alta':
        return AppColors.error;
      case 'Média':
        return AppColors.warning;
      case 'Baixa':
        return AppColors.success;
      default:
        return AppColors.textSecondary;
    }
  }

  String formatarData(String dataIso) {
    return DateHelpers.formatDataPT(DateHelpers.parseData(dataIso));
  }

  double getLarguraCard(BuildContext context) {
    double larguraDaTela = MediaQuery.of(context).size.width;
    return (larguraDaTela / 2) - 24;
  }

  final TextEditingController searchController = TextEditingController();
  int categoriaSelecionadaIndex = 0;
  DateTime? selectedDate;

  List<TarefaModel> get tarefasFiltradas {
    var tarefas = TarefaModel.tarefasMockadas;

    final categoria = categorias[categoriaSelecionadaIndex];
    if (categoria.nome != 'Todas') {
      tarefas = tarefas.where((t) => t.categoria == categoria.nome).toList();
    }

    if (selectedDate != null) {
      tarefas = tarefas
          .where((t) => DateUtils.isSameDay(t.data, selectedDate))
          .toList();
    }

    return tarefas;
  }

  void setCategoria(int index) {
    categoriaSelecionadaIndex = index;
    notifyListeners();
  }

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(primary: AppColors.primary),
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != selectedDate) {
      selectedDate = picked;
      notifyListeners();
    }
  }

  void limpaPesquisa() {
    notifyListeners();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  
}