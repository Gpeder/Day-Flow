import 'package:dayflow/components/home/listatarefas.dart';
import 'package:dayflow/components/tarefas/editar_tarefa.dart';
import 'package:dayflow/components/tarefas/item_tarefa_edit.dart';
import 'package:dayflow/model/tarefa_model.dart';
import 'package:dayflow/theme/theme.dart';
import 'package:dayflow/widgets/main_card.dart';
import 'package:dayflow/widgets/main_chip.dart';
import 'package:dayflow/widgets/main_searchbar.dart';
import 'package:flutter/material.dart';

class Tarefas extends StatefulWidget {
  const Tarefas({super.key});

  @override
  State<Tarefas> createState() => _TarefasState();
}

class _TarefasState extends State<Tarefas> {
  final TextEditingController _searchController = TextEditingController();
  int _categoriaSelecionadaIndex = 0;
  DateTime? _selectedDate;

  List<TarefaModel> get _tarefasFiltradas {
    var tarefas = TarefaModel.tarefasMockadas;

    final categoria = ListaTarefas.categorias[_categoriaSelecionadaIndex];
    if (categoria != 'Todas') {
      tarefas = tarefas.where((t) => t.categoria == categoria).toList();
    }

    if (_selectedDate != null) {
      tarefas = tarefas
          .where((t) => DateUtils.isSameDay(t.data, _selectedDate))
          .toList();
    }

    return tarefas;
  }

  Future<void> _selectDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(primary: AppColors.primary),
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todas as Tarefas', style: AppTextStyles.title20Bold),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16).copyWith(top: 20),
        child: Column(
          children: [
            MainSearchBar(
              controller: _searchController,
              onData: _selectDate,
              onSearch: () {},
              onChanged: (value) {
                setState(() {});
              },
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
                    selected: _categoriaSelecionadaIndex == index,
                    onTap: () {
                      setState(() {
                        _categoriaSelecionadaIndex = index;
                      });
                    },
                  );
                },
              ),
            ),
            SizedBox(height: 20),

            Row(
              children: [
                Expanded(
                  child: MainCard(
                    widget: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Ativas', style: AppTextStyles.text16),
                        SizedBox(height: 15),
                        Text(
                          '${_tarefasFiltradas.where((t) => !t.isCompleted).length}',
                          style: AppTextStyles.title20Bold.copyWith(
                            color: AppColors.primary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: MainCard(
                    widget: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Completas', style: AppTextStyles.text16),
                        SizedBox(height: 15),
                        Text(
                          '${_tarefasFiltradas.where((t) => t.isCompleted).length}',
                          style: AppTextStyles.title20Bold.copyWith(
                            color: AppColors.textPrimary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 20),

            ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: _tarefasFiltradas.length,
              separatorBuilder: (context, index) => SizedBox(height: 12),
              itemBuilder: (context, index) {
                final tarefa = _tarefasFiltradas[index];
                return ItemTarefaEdit(
                  title: tarefa.title,
                  categoria: tarefa.categoria,
                  hora: tarefa.hora ?? '',
                  prioridade: tarefa.prioridade,
                  onEdit: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            EditarTarefa(tarefa: _tarefasFiltradas[index]),
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
