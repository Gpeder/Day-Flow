import 'package:dayflow/theme/theme.dart';
import 'package:flutter/material.dart';

class MainCard extends StatelessWidget {
  final Widget widget;
  const MainCard({super.key, required this.widget});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const .symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.card,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: .05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],

        border: Border.all(color: AppColors.border, width: 1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: widget,
    );
  }
}