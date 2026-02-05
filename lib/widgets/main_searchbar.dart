import 'package:dayflow/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class MainSearchBar extends StatelessWidget {
  final String? hintText;
  final TextEditingController controller;
  final Function(String)? onChanged;
  final Function()? onData;
  final Function()? onSearch;

  const MainSearchBar({
    super.key,
    this.hintText,
    required this.controller,
    this.onChanged,
    this.onData,
    this.onSearch,
  });

  @override
  Widget build(BuildContext context) {
    return SearchBar(
      hintText: hintText ?? 'Buscar tarefas',
      hintStyle: WidgetStatePropertyAll(AppTextStyles.text16),
      elevation: const WidgetStatePropertyAll(0),
      backgroundColor: const WidgetStatePropertyAll(AppColors.card),
      onChanged: onChanged,
      controller: controller,
      onTap: () {},
      trailing: [
        IconButton(
          onPressed: onData,
          icon: Icon(
            Ionicons.calendar_outline,
            size: 24,
            color: AppColors.textMuted,
          ),
        ),
      ],
      surfaceTintColor: const WidgetStatePropertyAll(
        Colors.transparent,
      ),
      shadowColor: const WidgetStatePropertyAll(Colors.transparent),
      leading: IconButton(
        onPressed: onSearch,
        icon: Icon(
          Ionicons.search_outline,
          size: 20,
          color: AppColors.textMuted,
        ),
      ),
      padding: const WidgetStatePropertyAll(
        EdgeInsets.symmetric(horizontal: 12),
      ),
      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(color: AppColors.border),
        ),
      ),
    );
  }
}