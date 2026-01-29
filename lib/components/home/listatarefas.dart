import 'package:auto_size_text/auto_size_text.dart';
import 'package:dayflow/components/home/details_card.dart';
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
      'data': '2024-06-10',
      'notas': 'Discutir o progresso do projeto e próximos passos.',
      'hora': '10:00',
      'selected': false,
    },
    {
      'title': 'Consulta médica',
      'prioridade': 'Média',
      'categoria': 'Saúde',
      'data': '2024-06-10',
      'notas': 'Consulta de rotina com o médico. Levar exames recentes.',
      'selected': false,
    },
    {
      'title': 'Comprar mantimentos',
      'prioridade': 'Baixa',
      'categoria': 'Pessoal',
      'data': '2024-06-10',
      'hora': '5:00',
      'notas': 'Comprar frutas, vegetais e produtos de limpeza.',
      'selected': false,
    },
    {
      'title': 'Estudar Flutter',
      'prioridade': 'Alta',
      'categoria': 'Estudos',
      'data': '2024-06-10',
      'hora': '7:00',
      'notas': 'Praticar exercícios e revisar conceitos importantes.',
      'selected': false,
    },
    {
      'title': 'Reunião com equipe',
      'categoria': 'Trabalho',
      'prioridade': 'Alta',
      'data': '2024-06-10',
      'hora': '10:00',
      'notas': 'Discutir o progresso do projeto e próximos passos.',
      'selected': false,
    },
    {
      'title': 'Consulta médica',
      'prioridade': 'Média',
      'categoria': 'Saúde',
      'data': '2024-06-10',
      'hora': '2:00',
      'notas': 'Consulta de rotina com o médico. Levar exames recentes.',
      'selected': false,
    },
  ];

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

  @override
  Widget build(BuildContext context) {
    final dataFormatada = _formatDataPT(DateTime.now());

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(dataFormatada, style: AppTextStyles.title24Bold),
        SizedBox(height: 4),
        Text(
          '(${tarefas.length}) tarefas hoje',
          style: AppTextStyles.text16.copyWith(color: AppColors.disabled),
        ),
        SizedBox(height: 20),

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
            padding: EdgeInsets.zero,
            separatorBuilder: (context, index) => SizedBox(height: 10),
            itemBuilder: (context, index) {
              final tarefa = tarefas[index];
              return ItemListaTarefas(
                prioridade: tarefa['prioridade'],
                title: tarefa['title'],
                categoria: tarefa['categoria'],
                hora: tarefa['hora'] ?? '',
                selected: tarefa['selected'] as bool,
                onChanged: (value) {
                  setState(() {
                    tarefa['selected'] = value ?? false;
                  });
                },
                onTap: () {
                  setState(() {
                    tarefa['selected'] = !tarefa['selected'];
                  });
                },
                onLongPress: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DetailsCard(item: tarefa)),
                  );
                },
              );
            },
            itemCount: tarefas.length,
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
