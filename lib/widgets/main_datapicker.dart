import 'package:dayflow/theme/theme.dart';
import 'package:flutter/material.dart';

class MainDatePicker extends StatelessWidget {
  final String? label;
  final String? hint;
  final DateTime? value;
  final ValueChanged<DateTime?>? onChanged;
  final String? Function(DateTime?)? validator;
  final bool enabled;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final DateTime? firstDate;
  final DateTime? lastDate;
  final TextEditingController controller;

  const MainDatePicker({
    super.key,
    this.label,
    this.hint,
    this.value,
    this.onChanged,
    this.validator,
    this.enabled = true,
    this.prefixIcon,
    this.suffixIcon,
    this.firstDate,
    this.lastDate,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null) ...[
          Text(
            label!,
            style: AppTextStyles.text16.copyWith(color: AppColors.textMuted),
          ),
          const SizedBox(height: 6),
        ],
        FormField<DateTime>(
          initialValue: value,
          validator: validator,
          builder: (state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  controller: controller,
                  readOnly: true,
                  enabled: enabled,
                  style: AppTextStyles.text16.copyWith(
                    color: AppColors.surface,
                  ),
                  decoration: InputDecoration(
                    hintText: hint ?? 'Selecione uma data',
                    hintStyle: AppTextStyles.text14.copyWith(
                      color: AppColors.textMuted,
                    ),
                    filled: true,
                    fillColor: AppColors.border,
                    isDense: true,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 14,
                    ),
                    prefixIcon: prefixIcon,
                    suffixIcon:
                        suffixIcon ??
                        const Icon(
                          Icons.calendar_today_rounded,
                          color: AppColors.textMuted,
                        ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: AppColors.border),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: AppColors.border),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: AppColors.primary,
                        width: 2,
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: AppColors.error,
                        width: 2,
                      ),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: AppColors.error,
                        width: 2,
                      ),
                    ),
                    errorText: state.errorText,
                  ),
                  onTap: enabled
                      ? () async {
                          final picked = await showDatePicker(
                            context: context,
                            initialDate: value ?? DateTime.now(),
                            firstDate: firstDate ?? DateTime(1900),
                            lastDate: lastDate ?? DateTime(2100),
                            builder: (context, child) {
                              return Theme(
                                data: Theme.of(context).copyWith(
                                  colorScheme: const ColorScheme.dark(
                                    primary: AppColors.primary,
                                    onPrimary: AppColors.background,
                                    surface: AppColors.card,
                                    onSurface: AppColors.textMuted,
                                  ),
                                  dialogTheme: DialogThemeData(
                                    backgroundColor: AppColors.card,
                                  ),
                                ),
                                child: child!,
                              );
                            },
                          );

                          if (picked != null) {
                            state.didChange(picked);
                            onChanged?.call(picked);
                          }
                        }
                      : null,
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
