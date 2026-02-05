import 'package:dayflow/components/home/listatarefas.dart';
import 'package:dayflow/components/home/modal_homepage.dart';
import 'package:dayflow/theme/theme.dart';
import 'package:dayflow/widgets/main_home_appbar.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  Future<void> _abrirModal(BuildContext context) async {
    await showModalBottomSheet(
      context: context,
      useRootNavigator: true,
      isScrollControlled: true,
      builder: (context) {
        return MainModal();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainHomeAppbar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16).copyWith(top: 20),
        child: ListaTarefas(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _abrirModal(context),
        backgroundColor: AppColors.primary,
        shape: RoundedRectangleBorder(borderRadius: .circular(20)),
        child: Icon(Ionicons.add, color: AppColors.card),
      ),
    );
  }
}
