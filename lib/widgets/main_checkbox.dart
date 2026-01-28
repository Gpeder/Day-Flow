import 'package:dayflow/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class AppCheckbox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool?>? onChanged;

  const AppCheckbox({
    super.key,
    required this.value,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(999),
      onTap: () => onChanged?.call(!value),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        curve: Curves.easeOut,
        width: 25,
        height: 25,
        decoration: BoxDecoration(
          color: value ? AppColors.primary : Colors.transparent,
          shape: BoxShape.circle,
          border: Border.all(
            color: value ? AppColors.primary : AppColors.border,
            width: 1.5,
          ),
        ),
        child: value
            ? const Icon(
                Ionicons.checkmark_outline,
                size: 18,
                color: Colors.white,
              )
            : null,
      ),
    );
  }
}
