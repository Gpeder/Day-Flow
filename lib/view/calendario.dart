import 'package:dayflow/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendario extends StatefulWidget {
  const Calendario({super.key});

  @override
  State<Calendario> createState() => _CalendarioState();
}

class _CalendarioState extends State<Calendario> {
  DateTime mesAtual = DateTime.now();
  DateTime? dataSelecionada;

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

  void _proximoMes() {
    setState(() {
      mesAtual = DateTime(mesAtual.year, mesAtual.month + 1);
    });
  }

  void _mesAnterior() {
    setState(() {
      mesAtual = DateTime(mesAtual.year, mesAtual.month - 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calendário', style: AppTextStyles.title20Bold),
        actionsPadding: const EdgeInsets.only(right: 16),
        actions: [
          IconButton(
            icon: Icon(
              Ionicons.chevron_back_outline,
              color: AppColors.textPrimary,
            ),
            onPressed: _mesAnterior,
          ),
          IconButton(
            icon: Icon(
              Ionicons.chevron_forward_outline,
              color: AppColors.textPrimary,
            ),
            onPressed: _proximoMes,
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16).copyWith(top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //? mês e ano
            Text(
              _formatDataPT(DateTime(mesAtual.year, mesAtual.month, 1)),
              style: AppTextStyles.title20.copyWith(color: AppColors.textMuted),
            ),

            const SizedBox(height: 20),

            //? calendário
            TableCalendar(
              locale: 'pt_BR',
              availableCalendarFormats: const {CalendarFormat.month: 'Mês'},
              currentDay: DateTime.now(),
              focusedDay: mesAtual,
              firstDay: DateTime(2000),
              lastDay: DateTime(2100),
              headerVisible: false,
              selectedDayPredicate: (day) => isSameDay(day, dataSelecionada),

              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  dataSelecionada = selectedDay;
                  mesAtual = focusedDay;
                });
              },
              onPageChanged: (focusedDay) {
                mesAtual = focusedDay;
              },

              daysOfWeekStyle: DaysOfWeekStyle(
                weekdayStyle: AppTextStyles.text14.copyWith(
                  color: AppColors.textMuted,
                ),
                weekendStyle: AppTextStyles.text14.copyWith(
                  color: AppColors.textMuted,
                ),
              ),

              calendarStyle: CalendarStyle(
                outsideDaysVisible: true,
                defaultTextStyle: AppTextStyles.text16,
                weekendTextStyle: AppTextStyles.text16,
                todayTextStyle: AppTextStyles.text16Bold.copyWith(
                  color: AppColors.primary,
                ),
                selectedTextStyle: AppTextStyles.text16Bold.copyWith(
                  color: Colors.white,
                ),

                todayDecoration: BoxDecoration(
                  color: Colors.transparent,
                  shape: BoxShape.circle,
                ),
                selectedDecoration: BoxDecoration(
                  color: AppColors.primary,
                  shape: BoxShape.circle,
                ),

                markerDecoration: BoxDecoration(
                  color: AppColors.primary,
                  shape: BoxShape.circle,
                ),
                markersAlignment: Alignment.bottomCenter,
                markerSize: 5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
