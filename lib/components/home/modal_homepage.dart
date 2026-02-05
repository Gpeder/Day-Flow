import 'package:dayflow/components/home/listatarefas.dart';
import 'package:dayflow/helpers/date_helpers.dart';
import 'package:dayflow/theme/theme.dart';
import 'package:dayflow/widgets/main_datapicker.dart';
import 'package:dayflow/widgets/main_form.dart';
import 'package:dayflow/widgets/main_select.dart';
import 'package:dayflow/widgets/main_timepicker.dart';
import 'package:flutter/material.dart';

class MainModal extends StatefulWidget {
  const MainModal({super.key});

  @override
  State<MainModal> createState() => _MainModalState();
}

class _MainModalState extends State<MainModal> {
  final _formNovaTarefa = GlobalKey<FormState>();
  final _tituloController = TextEditingController();
  final _notasController = TextEditingController();
  final _dataController = TextEditingController();
  
  String? _categoriaSelecionada;
  String? _prioridadeSelecionada;
  TimeOfDay? _horaSelecionada;
  DateTime? _dataSelecionada;

  @override
  void dispose() {
    _tituloController.dispose();
    _notasController.dispose();
    _dataController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.background,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          height: MediaQuery.of(context).size.height * 0.65,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 10,
                  top: 15,
                  bottom: 10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Nova Tarefa', style: AppTextStyles.title20Bold),
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: Icon(Icons.close, color: AppColors.textPrimary),
                    ),
                  ],
                ),
              ),
              Divider(height: 1, color: AppColors.border),

              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(20),
                  child: Form(
                    key: _formNovaTarefa,
                    child: Column(
                      children: [
                        MainForm(
                          label: 'Titulo',
                          hint: 'Digite o titulo',
                          controller: _tituloController,
                        ),
                        SizedBox(height: 20),
                        MainForm(
                          label: 'Notas',
                          hint: 'Digite as notas',
                          controller: _notasController,
                        ),
                        SizedBox(height: 20),
                        Row(
                          children: [
                            Expanded(
                              child: MainDatePicker(
                                value: _dataSelecionada,
                                onChanged: (value) {
                                  if (value != null) {
                                    setState(() {
                                      _dataSelecionada = value;
                                      _dataController.text =
                                          DateHelpers.formatDataPT(value);
                                    });
                                  }
                                },
                                controller: _dataController,
                                label: 'Data',
                                hint: DateHelpers.formatDataPT(DateTime.now()),
                              ),
                            ),
                            SizedBox(width: 20),
                            Expanded(
                              child: MainTimePicker(
                                value: _horaSelecionada,
                                onChanged: (value) {
                                  setState(() {
                                    _horaSelecionada = value;
                                  });
                                },
                                label: 'Hora',
                                hint: TimeOfDay.now().format(context),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        Row(
                          children: [
                            Expanded(
                              child: MainSelect<String>(
                                value: _categoriaSelecionada,
                                onChanged: (value) {
                                  setState(() {
                                    _categoriaSelecionada = value;
                                  });
                                },
                                items:
                                    ListaTarefas.categorias
                                        .where((element) => element != 'Todas')
                                        .map((e) {
                                          return DropdownMenuItem(
                                            value: e,
                                            child: Text(e),
                                          );
                                        })
                                        .toList(),
                                label: 'Categoria',
                                hint: 'Selecione',
                              ),
                            ),
                            SizedBox(width: 20),
                            Expanded(
                              child: MainSelect<String>(
                                value: _prioridadeSelecionada,
                                onChanged: (value) {
                                  setState(() {
                                    _prioridadeSelecionada = value;
                                  });
                                },
                                items:
                                    ['Alta', 'Média', 'Baixa'].map((e) {
                                      return DropdownMenuItem(
                                        value: e,
                                        child: Text(e),
                                      );
                                    }).toList(),
                                label: 'Prioridade',
                                hint: 'Selecione',
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 40),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              if (_formNovaTarefa.currentState!.validate()) {
                                _formNovaTarefa.currentState!.save();
                              }
                            },
                            child: Text('Salvar'),
                          ),
                        ),
                        SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
