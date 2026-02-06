import 'package:dayflow/components/home/listatarefas.dart';
import 'package:dayflow/controller/calendario_controler.dart';
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
  final CalendarioController controller = CalendarioController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
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
            onPressed: controller.mesAnterior,
          ),
          IconButton(
            icon: Icon(
              Ionicons.chevron_forward_outline,
              color: AppColors.textPrimary,
            ),
            onPressed: controller.proximoMes,
          ),
        ],
      ),
      body: ListenableBuilder(
        listenable: controller,
        builder: (context, child) {
          return SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 16).copyWith(top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //? mês e ano
                Text(
                  controller.formatDataPT2(DateTime(
                      controller.mesAtual.year, controller.mesAtual.month, 1)),
                  style:
                      AppTextStyles.title20.copyWith(color: AppColors.textMuted),
                ),

                const SizedBox(height: 20),

                //? calendário
                TableCalendar(
                  locale: 'pt_BR',
                  availableCalendarFormats: const {CalendarFormat.month: 'Mês'},
                  currentDay: DateTime.now(),
                  focusedDay: controller.mesAtual,
                  firstDay: DateTime(2000),
                  lastDay: DateTime(2100),
                  headerVisible: false,
                  selectedDayPredicate: (day) =>
                      isSameDay(day, controller.dataSelecionada),

                  onDaySelected: (selectedDay, focusedDay) {
                    controller.selecionarData(selectedDay, focusedDay);
                  },
                  onPageChanged: (focusedDay) {
                    controller.atualizarMes(focusedDay);
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
                  controller.formatDataPT(controller.dataSelecionadaEfetiva),
                  style: AppTextStyles.title20Bold.copyWith(
                    color: AppColors.textPrimary,
                  ),
                ),
                SizedBox(height: 10),

                if (controller.tarefasDoDia.isEmpty)
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
                  ...controller.tarefasDoDia.map(
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
          );
        },
      ),
    );
  }
}
