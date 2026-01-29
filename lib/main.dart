import 'package:dayflow/theme/theme.dart';
import 'package:dayflow/view/root/root_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const DayApp());
}

class DayApp extends StatelessWidget {
  const DayApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        appBarTheme: AppBarTheme(
          backgroundColor: AppColors.background,
          surfaceTintColor: Colors.transparent,
          scrolledUnderElevation: 0,
          
        ),
        listTileTheme: ListTileThemeData(
          tileColor: AppColors.card,
          textColor: AppColors.textPrimary,
          shape: RoundedRectangleBorder(
            side: BorderSide(color: AppColors.border, width: 1),
            borderRadius: BorderRadius.circular(12),
          ),
          horizontalTitleGap: 0,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
        ),
        chipTheme: ChipThemeData(
          backgroundColor: AppColors.mutedAccent,
          selectedColor: AppColors.primary,
          labelStyle: AppTextStyles.text14.copyWith(
            color: AppColors.textPrimary,
          ),
          secondaryLabelStyle: AppTextStyles.text14.copyWith(
            color: AppColors.textPrimary,
          ),
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        primaryColor: AppColors.primary,
        scaffoldBackgroundColor: AppColors.background,
      ),
      debugShowCheckedModeBanner: false,
      title: 'Day Flow',
      home: RootPage(),
    );
  }
}
