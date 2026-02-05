import 'package:dayflow/components/home/listatarefas.dart';
import 'package:dayflow/model/tarefa_model.dart';
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

  DateTime get dataSelecionadaEfetiva => dataSelecionada ?? DateTime.now();

  List<TarefaModel> get tarefasDoDia =>
      TarefaModel.getTarefasPorData(dataSelecionadaEfetiva);

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

  String _formatDataPT2(DateTime data) {
    const diasSemana = ['Seg', 'Ter', 'Qua', 'Qui', 'Sex', 'Sáb', 'Dom'];

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
              _formatDataPT2(DateTime(mesAtual.year, mesAtual.month, 1)),
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
                  fontWeight: FontWeight.w600,
                ),
                weekendStyle: AppTextStyles.text14.copyWith(
                  fontWeight: FontWeight.w600,
                  color: AppColors.error,
                ),
              ),

              calendarStyle: CalendarStyle(
                outsideDaysVisible: true,
                defaultTextStyle: AppTextStyles.text16,
                weekendTextStyle: AppTextStyles.text16,
                todayTextStyle: AppTextStyles.text16Bold.copyWith(
                  color: AppColors.card,
                ),
                selectedTextStyle: AppTextStyles.text16Bold.copyWith(
                  color: AppColors.background,
                ),

                todayDecoration: BoxDecoration(
                  color: AppColors.primary,
                  shape: BoxShape.circle,
                ),
                selectedDecoration: BoxDecoration(
                  color: AppColors.accent,
                  shape: BoxShape.circle,
                ),

                markerDecoration: BoxDecoration(
                  color: AppColors.primary,
                  shape: BoxShape.circle,
                ),
                markersAlignment: Alignment.bottomCenter,
                markerSize: 4,
              ),
            ),
            SizedBox(height: 25),

            Text(
              _formatDataPT(dataSelecionadaEfetiva),
              style: AppTextStyles.title20Bold.copyWith(
                color: AppColors.textPrimary,
              ),
            ),
            SizedBox(height: 10),

            if (tarefasDoDia.isEmpty)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 40),
                child: Center(
                  child: Text(
                    'Nenhuma tarefa para este dia',
                    style: AppTextStyles.text16.copyWith(
                      color: AppColors.textMuted,
                    ),
                  ),
                ),
              )
            else
              ...tarefasDoDia.map(
                (tarefa) => Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: ItemListaTarefas(
                    title: tarefa.title,
                    categoria: tarefa.categoria,
                    hora: tarefa.hora ?? '',
                    selected: tarefa.selected,
                    prioridade: tarefa.prioridade,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
