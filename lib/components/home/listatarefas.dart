import 'package:auto_size_text/auto_size_text.dart';
import 'package:dayflow/components/home/details_card.dart';
import 'package:dayflow/model/categorias_model.dart';
import 'package:dayflow/model/lista_tarefas_model.dart';
import 'package:dayflow/theme/theme.dart';
import 'package:dayflow/widgets/main_checkbox.dart';
import 'package:dayflow/widgets/main_chip.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class ListaTarefas extends StatefulWidget {
  const ListaTarefas({super.key});

  @override
  State<ListaTarefas> createState() => _ListaTarefasState();
}

class _ListaTarefasState extends State<ListaTarefas> {
  List<ListaTarefasModel> _todasTarefas = [];
  List<ListaTarefasModel> _tarefasExibidas = [];

  @override
  void initState() {
    super.initState();
    _todasTarefas = List.from(tarefas);
    _tarefasExibidas = List.from(_todasTarefas);
  }

  int _categoriaSelecionadaIndex = 0;

  String _formatDataPT(DateTime data) {
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

  void _onCategoriaSelected(String categoria, int index) {
    setState(() {
      _categoriaSelecionadaIndex = index;

      if (categoria == 'Todas') {
        _tarefasExibidas = List.from(_todasTarefas);
      } else {
        _tarefasExibidas = _todasTarefas
            .where((tarefa) => tarefa.categoria == categoria)
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final dataFormatada = _formatDataPT(DateTime.now());

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(dataFormatada, style: AppTextStyles.title24Bold),
        SizedBox(height: 4),
        Text(
          _tarefasExibidas.isEmpty
              ? 'Nenhuma tarefa encontrada'
              : '${_tarefasExibidas.length} tarefa${_tarefasExibidas.length > 1 ? 's' : ''} hoje',
          style: AppTextStyles.text16.copyWith(color: AppColors.disabled),
        ),
        SizedBox(height: 20),

        SizedBox(
          height: 40,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: categorias.length,
            separatorBuilder: (context, index) => SizedBox(width: 8),
            itemBuilder: (context, index) {
              return MainChip(
                label: categorias[index].nome,
                selected: _categoriaSelecionadaIndex == index,
                onTap: () {
                  _onCategoriaSelected(categorias[index].nome, index);
                },
              );
            },
          ),
        ),
        SizedBox(height: 20),

        Expanded(
          child: _tarefasExibidas.isEmpty
              ? _resultado()
              : ListView.separated(
                  physics: BouncingScrollPhysics(),
                  padding: EdgeInsets.zero,
                  separatorBuilder: (context, index) => SizedBox(height: 10),
                  itemBuilder: (context, index) {
                    final tarefa = _tarefasExibidas[index];
                    return ItemListaTarefas(
                      prioridade: tarefa.prioridade,
                      title: tarefa.title,
                      categoria: tarefa.categoria,
                      hora: tarefa.hora,
                      selected: tarefa.selected,
                      onChanged: (value) {
                        setState(() {
                          tarefa.selected = value ?? false;
                        });
                      },
                      onTap: () {
                        setState(() {
                          tarefa.selected = !tarefa.selected;
                        });
                      },
                      onLongPress: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailsCard(item: tarefa),
                          ),
                        );
                      },
                    );
                  },
                  itemCount: _tarefasExibidas.length,
                ),
        ),
      ],
    );
  }
}

class ItemListaTarefas extends StatelessWidget {
  final String title;
  final String categoria;
  final String hora;
  final bool selected;
  final ValueChanged<bool?>? onChanged;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;
  final String prioridade;

  const ItemListaTarefas({
    super.key,
    required this.title,
    required this.categoria,
    required this.hora,
    required this.selected,
    this.onChanged,
    this.onTap,
    this.onLongPress,
    required this.prioridade,
  });

  @override
  Widget build(BuildContext context) {
    Color getPrioridadeCor(String prioridade) {
      if (selected) return AppColors.textSecondary;

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

    return Material(
      color: AppColors.card,
      child: ListTile(
        leading: Container(
          width: 5,
          decoration: BoxDecoration(
            color: getPrioridadeCor(prioridade),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        title: Padding(
          padding: const EdgeInsets.only(bottom: 5),
          child: AutoSizeText(
            title,
            style: AppTextStyles.text18Bold.copyWith(
              color: selected ? AppColors.textSecondary : null,
              decoration: selected ? TextDecoration.lineThrough : null,
            ),
            maxLines: 1,
            maxFontSize: 20,
            minFontSize: 16,
          ),
        ),
        subtitle: Text(
          '$categoria${hora.isNotEmpty ? ' - $hora' : ''}',
          style: AppTextStyles.text14.copyWith(
            color: selected ? AppColors.textSecondary : AppColors.textMuted,
          ),
        ),
        trailing: AppCheckbox(value: selected, onChanged: onChanged),
        onTap: onTap,
        onLongPress: onLongPress,
      ),
    );
  }
}

Center _resultado() {
  return Center(
    child: Column(
      children: [
        SizedBox(height: 80),
        CircleAvatar(
          radius: 30,
          backgroundColor: AppColors.border,
          child: Icon(
            Ionicons.checkmark_circle_outline,
            color: AppColors.textMuted,
            size: 36,
          ),
        ),
        SizedBox(height: 10),
        Text('Tudo certo!', style: AppTextStyles.title24Bold),
        SizedBox(height: 5),
        Text(
          'Nenhuma tarefa encontrada',
          style: AppTextStyles.text18.copyWith(color: AppColors.textMuted),
          textAlign: TextAlign.center,
        ),
      ],
    ),
  );
}
