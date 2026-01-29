import 'package:auto_size_text/auto_size_text.dart';
import 'package:dayflow/theme/theme.dart';
import 'package:dayflow/widgets/main_card.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class DetailsCard extends StatelessWidget {
  final Map<String, dynamic> item;
  const DetailsCard({super.key, required this.item});

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
          return AppColors.textSecondary;
      }
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

    DateTime parseData(String? dataString) {
      if (dataString == null || dataString.isEmpty) {
        return DateTime.now();
      }
      try {
        return DateTime.parse(dataString);
      } catch (e) {
        return DateTime.now();
      }
    }

    final dataFormatada = formatDataPT(parseData(item['data']));
    double larguraDaTela = MediaQuery.of(context).size.width;
    double larguraDoCard = (larguraDaTela / 2) - 24;

    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        leading: IconButton(
          icon: const Icon(Ionicons.chevron_back_outline),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: AutoSizeText(
          item['title'],
          style: AppTextStyles.title20Bold,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          maxFontSize: 20,
          minFontSize: 16,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MainCard(
              widget: Column(
                children: [
                  //data
                  ListTile(
                    horizontalTitleGap: 15,
                    leading: CircleAvatar(
                      backgroundColor: AppColors.border,
                      radius: 25,
                      child: Icon(
                        Ionicons.calendar_outline,
                        color: AppColors.overlay,
                        size: 24,
                      ),
                    ),
                    contentPadding: EdgeInsets.zero,
                    title: Text(
                      'Data',
                      style: AppTextStyles.text16.copyWith(
                        color: AppColors.textMuted,
                      ),
                    ),
                    subtitle: Text(
                      dataFormatada,
                      style: AppTextStyles.title20Bold,
                    ),
                  ),

                  //horario
                  ListTile(
                    horizontalTitleGap: 15,
                    leading: CircleAvatar(
                      backgroundColor: AppColors.border,
                      radius: 25,
                      child: Icon(
                        Ionicons.time_outline,
                        color: AppColors.overlay,
                        size: 24,
                      ),
                    ),
                    contentPadding: EdgeInsets.zero,
                    title: Text(
                      'Hora',
                      style: AppTextStyles.text16.copyWith(
                        color: AppColors.textMuted,
                      ),
                    ),
                    subtitle: Text(
                      item['hora'] ?? '',
                      style: AppTextStyles.title20Bold,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),

            //notas
            MainCard(
              widget: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Notas',
                    style: AppTextStyles.text16Bold.copyWith(
                      color: AppColors.textMuted,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(item['notas'], style: AppTextStyles.text18),
                ],
              ),
            ),

            SizedBox(height: 20),

            //categoria e prioridade
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                SizedBox(
                  width: larguraDoCard,
                  child: MainCard(
                    widget: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Ionicons.pricetag_outline,
                              size: 24,
                              color: AppColors.textMuted,
                            ),
                            SizedBox(width: 10),
                            Text(
                              'Categoria',
                              style: AppTextStyles.text16Bold.copyWith(
                                color: AppColors.textMuted,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 15),
                        Container(
                          alignment: .center,
                          padding: .symmetric(horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: AppColors.border,
                            borderRadius: .circular(50),
                          ),
                          child: Text(
                            item['categoria'],
                            style: AppTextStyles.text16Bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(
                  width: larguraDoCard,
                  child: MainCard(
                    widget: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Ionicons.alert_circle_outline,
                              size: 24,
                              color: AppColors.textMuted,
                            ),
                            SizedBox(width: 10),
                            Text(
                              'Prioridade',
                              style: AppTextStyles.text16Bold.copyWith(
                                color: AppColors.textMuted,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 15),
                        Container(
                          alignment: .center,
                          padding: .symmetric(horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: getPrioridadeCor(
                              item['prioridade'],
                            ).withValues(alpha: 0.3),
                            borderRadius: .circular(50),
                          ),
                          child: Text(
                            item['prioridade'],
                            style: AppTextStyles.text16Bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
