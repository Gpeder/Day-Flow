

import 'package:dayflow/theme/theme.dart';
import 'package:flutter/material.dart';

class AppButtonStyles {
  static ButtonStyle primary = ButtonStyle(
    elevation: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.disabled)) return 0;
      if (states.contains(WidgetState.pressed)) return 0;
      return 2;
    }),
    backgroundColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.disabled)) return AppColors.disabled;
      if (states.contains(WidgetState.pressed)) {
        return AppColors.primary.withValues(alpha: .85);
      }
      if (states.contains(WidgetState.hovered)) {
        return AppColors.primary.withValues(alpha: .9);
      }
      return AppColors.primary;
    }),
    foregroundColor: WidgetStateProperty.all(Colors.white),
    overlayColor:
        WidgetStateProperty.all(Colors.white.withValues(alpha: .08)),
    padding: WidgetStateProperty.all(
      const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
    ),
    shape: WidgetStateProperty.all(
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    ),
    textStyle: WidgetStateProperty.all(AppTextStyles.text16Bold),
    shadowColor:
        WidgetStateProperty.all(Colors.black.withValues(alpha: .12)),
  );

  static ButtonStyle secondary = ButtonStyle(
    backgroundColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.disabled)) return AppColors.disabled;
      if (states.contains(WidgetState.pressed)) {
        return AppColors.mutedAccent.withValues(alpha: .7);
      }
      if (states.contains(WidgetState.hovered)) {
        return AppColors.mutedAccent.withValues(alpha: .85);
      }
      return AppColors.mutedAccent;
    }),
    foregroundColor:
        WidgetStateProperty.all(AppColors.textPrimary),
    padding: WidgetStateProperty.all(
      const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
    ),
    shape: WidgetStateProperty.all(
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    ),
    textStyle: WidgetStateProperty.all(AppTextStyles.text16Bold),
  );

  static ButtonStyle outline = ButtonStyle(
    backgroundColor:
        WidgetStateProperty.all(Colors.transparent),
    foregroundColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.disabled)) {
        return AppColors.textMuted;
      }
      if (states.contains(WidgetState.hovered)) {
        return AppColors.textPrimary;
      }
      return AppColors.textPrimary;
    }),
    side: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.disabled)) {
        return BorderSide(
          color: AppColors.border.withValues(alpha: .5),
        );
      }
      if (states.contains(WidgetState.hovered)) {
        return const BorderSide(color: AppColors.textPrimary);
      }
      return const BorderSide(color: AppColors.border);
    }),
    padding: WidgetStateProperty.all(
      const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
    ),
    shape: WidgetStateProperty.all(
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    ),
    textStyle: WidgetStateProperty.all(AppTextStyles.text16Bold),
  );

  static ButtonStyle ghost = ButtonStyle(
    backgroundColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.hovered)) {
        return AppColors.mutedAccent.withValues(alpha: .5);
      }
      return Colors.transparent;
    }),
    foregroundColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.disabled)) {
        return AppColors.textMuted;
      }
      return AppColors.textPrimary;
    }),
    padding: WidgetStateProperty.all(
      const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
    ),
    shape: WidgetStateProperty.all(
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    ),
    textStyle: WidgetStateProperty.all(AppTextStyles.text16Bold),
  );

  static ButtonStyle destructive = ButtonStyle(
    backgroundColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.disabled)) return AppColors.disabled;
      if (states.contains(WidgetState.pressed)) {
        return AppColors.error.withValues(alpha: .8);
      }
      if (states.contains(WidgetState.hovered)) {
        return AppColors.error.withValues(alpha: .9);
      }
      return AppColors.error;
    }),
    foregroundColor: WidgetStateProperty.all(Colors.white),
    padding: WidgetStateProperty.all(
      const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
    ),
    shape: WidgetStateProperty.all(
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    ),
    textStyle: WidgetStateProperty.all(AppTextStyles.text16Bold),
    shadowColor:
        WidgetStateProperty.all(AppColors.error.withValues(alpha: .25)),
  );
}
