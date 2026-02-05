import 'package:dayflow/helpers/date_helpers.dart';
import 'package:dayflow/model/tarefa_model.dart';
import 'package:dayflow/theme/theme.dart';
import 'package:dayflow/widgets/main_card.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class EditarTarefa extends StatefulWidget {
  final TarefaModel tarefa;
  const EditarTarefa({super.key, required this.tarefa});

  @override
  State<EditarTarefa> createState() => _EditarTarefaState();
}

class _EditarTarefaState extends State<EditarTarefa> {
  late String _categoria;
  late String _prioridade;

  @override
  void initState() {
    super.initState();
    _categoria = widget.tarefa.categoria;
    _prioridade = widget.tarefa.prioridade;
  }

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

  void _showCategoriaSelector() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Selecione uma Categoria', style: AppTextStyles.title20Bold),
              const SizedBox(height: 20),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: ['Trabalho', 'Saúde', 'Pessoal', 'Estudos', 'Outros']
                    .map((categoria) {
                      return ActionChip(
                        label: Text(
                          categoria,
                          style: AppTextStyles.text16Bold.copyWith(
                            color: _categoria == categoria
                                ? Colors.white
                                : AppColors.textPrimary,
                          ),
                        ),
                        backgroundColor: _categoria == categoria
                            ? AppColors.primary
                            : AppColors.card,
                        onPressed: () {
                          setState(() {
                            _categoria = categoria;
                          });
                          Navigator.pop(context);
                        },
                      );
                    })
                    .toList(),
              ),
              const SizedBox(height: 20),
            ],
          ),
        );
      },
    );
  }

  void _showPrioridadeSelector() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Selecione uma Prioridade',
                style: AppTextStyles.title20Bold,
              ),
              const SizedBox(height: 20),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: ['Alta', 'Média', 'Baixa'].map((prioridade) {
                  return ActionChip(
                    label: Text(
                      prioridade,
                      style: AppTextStyles.text16Bold.copyWith(
                        color: _prioridade == prioridade
                            ? Colors.white
                            : AppColors.textPrimary,
                      ),
                    ),
                    backgroundColor: _prioridade == prioridade
                        ? getPrioridadeCor(prioridade)
                        : AppColors.card,
                    onPressed: () {
                      setState(() {
                        _prioridade = prioridade;
                      });
                      Navigator.pop(context);
                    },
                  );
                }).toList(),
              ),
              const SizedBox(height: 20),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double larguraDaTela = MediaQuery.of(context).size.width;
    double larguraDoCard = (larguraDaTela / 2) - 24;

    return Scaffold(
      appBar: AppBar(title: Text(widget.tarefa.title)),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16).copyWith(top: 20),
        child: Column(
          children: [
            MainCard(
              widget: Column(
                children: [
                  //data
                  ListTile(
                    trailing: Icon(Ionicons.create_outline),
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
                      DateHelpers.formatDataPT(widget.tarefa.data),
                      style: AppTextStyles.title20Bold,
                    ),
                  ),

                  //hora
                  ListTile(
                    trailing: Icon(Ionicons.create_outline),
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
                      DateHelpers.formatHora(widget.tarefa.hora),
                      style: AppTextStyles.title20Bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            MainCard(
              widget: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Notas',
                        style: AppTextStyles.text16Bold.copyWith(
                          color: AppColors.textMuted,
                        ),
                      ),
                      Icon(Ionicons.create_outline),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text(widget.tarefa.notas ?? '', style: AppTextStyles.text18),
                ],
              ),
            ),
            SizedBox(height: 20),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                SizedBox(
                  width: larguraDoCard,
                  child: InkWell(
                    onTap: _showCategoriaSelector,
                    borderRadius: BorderRadius.circular(16),
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
                              _categoria,
                              style: AppTextStyles.text16Bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: larguraDoCard,
                  child: InkWell(
                    onTap: _showPrioridadeSelector,
                    borderRadius: BorderRadius.circular(16),
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
                                _prioridade,
                              ).withValues(alpha: 0.3),
                              borderRadius: .circular(50),
                            ),
                            child: Text(
                              _prioridade,
                              style: AppTextStyles.text16Bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 40),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(onPressed: () {}, child: Text('Salvar')),
            ),
          ],
        ),
      ),
    );
  }
}
