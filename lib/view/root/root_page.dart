import 'package:dayflow/theme/theme.dart';
import 'package:dayflow/view/calendario.dart';
import 'package:dayflow/view/home.dart';
import 'package:dayflow/view/perfil.dart';
import 'package:dayflow/view/tarefas.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int _selectIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectIndex,
        children: const [HomePage(), Calendario(), Tarefas(), Perfil()],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(top: 5),
        child: NavigationBar(
          labelTextStyle: WidgetStatePropertyAll(
            AppTextStyles.text14.copyWith(color: AppColors.textPrimary),
          ),
          backgroundColor: AppColors.card,
          indicatorColor: AppColors.primary.withValues(alpha: 0.2),
          selectedIndex: _selectIndex,
          animationDuration: const Duration(milliseconds: 300),
          height: 80,
          labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
          onDestinationSelected: (index) {
            setState(() {
              _selectIndex = index;
            });
          },
          destinations: const [
            NavigationDestination(
              tooltip: 'Home',
              icon: Icon(Ionicons.home_outline, size: 24),
              selectedIcon: Icon(
                Ionicons.home,
                color: AppColors.primary,
                size: 24,
              ),
              label: 'Dashboard',
            ),
            NavigationDestination(
              tooltip: 'Calendário',
              icon: Icon(Ionicons.calendar_outline, size: 24),
              selectedIcon: Icon(
                Ionicons.calendar,
                color: AppColors.primary,
                size: 24,
              ),
              label: 'Calendário',
            ),
            NavigationDestination(
              tooltip: 'Tarefas',
              icon: Icon(Ionicons.checkbox_outline, size: 24),
              selectedIcon: Icon(
                Ionicons.checkbox,
                color: AppColors.primary,
                size: 24,
              ),
              label: 'Tarefas',
            ),
            NavigationDestination(
              tooltip: 'Perfil',
              icon: Icon(Ionicons.person_outline, size: 24),
              selectedIcon: Icon(
                Ionicons.person,
                color: AppColors.primary,
                size: 24,
              ),
              label: 'Perfil',
            ),
          ],
        ),
      ),
    );
  }
}
