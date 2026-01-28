import 'package:dayflow/theme/theme.dart';
import 'package:dayflow/widgets/main_checkbox.dart';
import 'package:dayflow/widgets/main_chip.dart';
import 'package:flutter/material.dart';

class ListaTarefas extends StatefulWidget {
  const ListaTarefas({super.key});

  static const categorias = [
    'Todas',
    'Trabalho',
    'Saúde',
    'Pessoal',
    'Estudos',
    'Outros',
  ];

  @override
  State<ListaTarefas> createState() => _ListaTarefasState();
}

class _ListaTarefasState extends State<ListaTarefas> {
  late List<Map<String, dynamic>> tarefas = [
    {
      'title': 'Reunião com equipe',
      'categoria': 'Trabalho',
      'prioridade': 'Alta',
      'hora': '10:00 AM',
      'selected': false,
    },
    {
      'title': 'Consulta médica',
      'prioridade': 'Média',
      'categoria': 'Saúde',
      'hora': '2:00 PM',
      'selected': true,
    },
    {
      'title': 'Comprar mantimentos',
      'prioridade': 'Baixa',
      'categoria': 'Pessoal',
      'hora': '5:00 PM',
      'selected': false,
    },
    {
      'title': 'Estudar Flutter',
      'prioridade': 'Alta',
      'categoria': 'Estudos',
      'hora': '7:00 PM',
      'selected': false,
    },
  ];

  @override
  Widget build(BuildContext context) {

    return Expanded(
      child: Column(
        children: [
          SizedBox(
            height: 40,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: ListaTarefas.categorias.length,
              separatorBuilder: (context, index) => SizedBox(width: 8),
              itemBuilder: (context, index) {
                return MainChip(
                  label: ListaTarefas.categorias[index],
                  selected: index == 0,
                  onTap: () {},
                );
              },
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            child: ListView.separated(
              physics: BouncingScrollPhysics(),
              separatorBuilder: (context, index) => SizedBox(height: 10),
              itemBuilder: (context, index) {
                final tarefa = tarefas[index];
                return ItemListaTarefas(
                  prioridade: tarefa['prioridade'],
                  title: tarefa['title'],
                  categoria: tarefa['categoria'],
                  hora: tarefa['hora'],
                  selected: tarefa['selected'] as bool,
                  onChanged: (value) {
                    setState(() {
                      tarefa['selected'] = value ?? false;
                    });
                  },
                  onTap: (){
                    setState(() {
                      tarefa['selected'] = !tarefa['selected'];
                    });
                  },
                  onLongPress: () {},
                );
              },
              itemCount: tarefas.length,
            ),
          ),
        ],
      ),
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
      switch (prioridade) {
        case 'Alta':
          return AppColors.error;
        case 'Média':
          return AppColors.warning;
        case 'Baixa':
          return AppColors.success;
        default:
          return Colors.grey;
      }
    }

    return ListTile(
      leading: Container(
        width: 5,
        decoration: BoxDecoration(
          color: getPrioridadeCor(prioridade),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      title: Padding(
        padding: const EdgeInsets.only(bottom: 5),
        child: Text(title, style: AppTextStyles.text18Bold),
      ),
      subtitle: Text(
        '$categoria -  $hora',
        style: AppTextStyles.text14.copyWith(color: AppColors.textMuted),
      ),
      trailing: AppCheckbox(value: selected, onChanged: onChanged),
      onTap: onTap,
      onLongPress: onLongPress,
    );
  }
}
