import 'package:dayflow/theme/theme.dart';
import 'package:dayflow/widgets/main_home_appbar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
    return Scaffold(
      appBar: MainHomeAppbar(),
      body: SingleChildScrollView(
        padding: .symmetric(horizontal: 16, vertical: 20),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            Text(dataFormatada, style: AppTextStyles.title24Bold),
            SizedBox(height: 4),
            Text(
              '5 tarefas hoje',
              style: AppTextStyles.text16.copyWith(color: AppColors.disabled),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Chip(
                  label: Text(
                    'Todas',
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.text16,
                    selectionColor: AppColors.primary,
                    strutStyle: StrutStyle(fontSize: 16),
                  ),
                ),
                SizedBox(width: 8),
                Chip(label: Text('Importantes')),
                SizedBox(width: 8),
                Chip(label: Text('Pendentes')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
