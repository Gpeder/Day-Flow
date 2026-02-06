import 'package:dayflow/controller/home_controler.dart';
import 'package:dayflow/components/tarefas/editar_tarefa.dart';
import 'package:dayflow/components/tarefas/item_tarefa_edit.dart';
import 'package:dayflow/model/categorias_model.dart';

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
  final HomeController controller = HomeController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: controller,
      builder: (context, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Todas as Tarefas', style: AppTextStyles.title20Bold),
          ),
          body: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 16).copyWith(top: 20),
            child: Column(
              children: [
                MainSearchBar(
                  controller: controller.searchController,
                  onData: () => controller.selectDate(context),
                  onSearch: controller.limpaPesquisa,
                  onChanged: (value) {
                    controller.limpaPesquisa();
                  },
                ),
                SizedBox(height: 20),

                SizedBox(
                  height: 40,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: categorias.length,
                    separatorBuilder: (context, index) => SizedBox(width: 8),
                    itemBuilder: (context, index) {
                      return MainChip(
                        label: categorias[index].nome,
                        selected: controller.categoriaSelecionadaIndex == index,
                        onTap: () => controller.setCategoria(index),
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
                              '${controller.tarefasFiltradas.where((t) => !t.isCompleted).length}',
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
                              '${controller.tarefasFiltradas.where((t) => t.isCompleted).length}',
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
                  itemCount: controller.tarefasFiltradas.length,
                  separatorBuilder: (context, index) => SizedBox(height: 12),
                  itemBuilder: (context, index) {
                    final tarefa = controller.tarefasFiltradas[index];
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
                                EditarTarefa(tarefa: controller.tarefasFiltradas[index]),
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
      },
    );
  }
}
