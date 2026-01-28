import 'package:dayflow/theme/theme.dart';
import 'package:flutter/material.dart';

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

class TituloHomePage extends StatelessWidget {
  const TituloHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final dataFormatada = _formatDataPT(DateTime.now());

    return Column(
      crossAxisAlignment: .start,
      children: [
        Text(dataFormatada, style: AppTextStyles.title24Bold),
        SizedBox(height: 4),
        Text(
          '5 tarefas hoje',
          style: AppTextStyles.text16.copyWith(color: AppColors.disabled),
        ),
      ],
    );
  }
}
