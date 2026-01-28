import 'package:dayflow/theme/theme.dart';
import 'package:flutter/material.dart';

class AppChips {
  static ChipStyle base = ChipStyle(
    backgroundColor: AppColors.card,
    selectedColor: AppColors.primary,
    borderColor: AppColors.border,
    selectedBorderColor: AppColors.primary,
    textColor: AppColors.overlay,
    selectedTextColor: AppColors.background,
  );
}

class ChipStyle {
  final Color backgroundColor;
  final Color selectedColor;
  final Color borderColor;
  final Color selectedBorderColor;
  final Color textColor;
  final Color selectedTextColor;

  const ChipStyle({
    required this.backgroundColor,
    required this.selectedColor,
    required this.borderColor,
    required this.selectedBorderColor,
    required this.textColor,
    required this.selectedTextColor,
  });
}



class MainChip extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback? onTap;

  const MainChip({
    super.key,
    required this.label,
    this.selected = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final style = AppChips.base;

    return Material(
      color: selected ? style.selectedColor : style.backgroundColor,
      shape: StadiumBorder(
        side: BorderSide(
          color: selected ? style.selectedBorderColor : style.borderColor,
        ),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Text(
            label,
            style: AppTextStyles.text16Bold.copyWith(
              color: selected ? style.selectedTextColor : style.textColor,
            ),
          ),
        ),
      ),
    );
  }
}