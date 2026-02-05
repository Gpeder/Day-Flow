import 'package:auto_size_text/auto_size_text.dart';
import 'package:dayflow/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class ItemTarefaEdit extends StatelessWidget {
  final String title;
  final String categoria;
  final String hora;
  final String prioridade;
  final VoidCallback? onEdit;

  const ItemTarefaEdit({
    super.key,
    required this.title,
    required this.categoria,
    required this.hora,
    required this.prioridade,
    this.onEdit,
  });

  Color _getPrioridadeCor(String prioridade) {
    switch (prioridade) {
      case 'Alta':
        return AppColors.error;
      case 'Média':
        return AppColors.warning;
      case 'Baixa':
        return AppColors.success;
      default:
        return AppColors.textSecondary;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.card,
      borderRadius: BorderRadius.circular(12),
      child: ListTile(
        leading: Container(
          width: 5,
          decoration: BoxDecoration(
            color: _getPrioridadeCor(prioridade),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        title: Padding(
          padding: const EdgeInsets.only(bottom: 5),
          child: AutoSizeText(
            title,
            style: AppTextStyles.text18Bold,
            maxLines: 1,
            maxFontSize: 20,
            minFontSize: 16,
          ),
        ),
        subtitle: Text(
          '$categoria${hora.isNotEmpty ? ' - $hora' : ''}',
          style: AppTextStyles.text14.copyWith(color: AppColors.textMuted),
        ),
        trailing: IconButton(
          onPressed: onEdit,
          icon: Icon(
            Ionicons.create_outline,
            color: AppColors.textMuted,
            size: 22,
          ),
        ),
        onTap: onEdit,
      ),
    );
  }
}
