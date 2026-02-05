import 'package:dayflow/theme/theme.dart';
import 'package:flutter/material.dart';

class MainTimePicker extends StatelessWidget {
  final String? label;
  final String? hint;
  final TimeOfDay? value;
  final ValueChanged<TimeOfDay?>? onChanged;
  final String? Function(TimeOfDay?)? validator;
  final bool enabled;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final EdgeInsetsGeometry? contentPadding;

  const MainTimePicker({
    super.key,
    this.label,
    this.hint,
    this.value,
    this.onChanged,
    this.validator,
    this.enabled = true,
    this.prefixIcon,
    this.suffixIcon,
    this.contentPadding,
  });

  Future<void> _openPicker(BuildContext context) async {
    if (!enabled) return;

    final picked = await showTimePicker(
      context: context,
      initialTime: value ?? TimeOfDay.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: Theme.of(context).colorScheme.copyWith(
                  primary: AppColors.primary,
                  onSurface: AppColors.textPrimary,
                  surface: AppColors.card,
                ),
            timePickerTheme: TimePickerThemeData(
              backgroundColor: AppColors.card,
              hourMinuteShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              dayPeriodShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              hourMinuteTextStyle: AppTextStyles.title24Bold,
              dayPeriodTextStyle: AppTextStyles.text14,
              dialHandColor: AppColors.primary,
              dialBackgroundColor: AppColors.mutedAccent,
              entryModeIconColor: AppColors.textMuted,
              helpTextStyle: AppTextStyles.text14.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      onChanged?.call(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    final display = value != null
        ? value!.format(context)
        : hint ?? '';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null) ...[
          Text(
            label!,
            style: AppTextStyles.text14.copyWith(
              color: AppColors.textSecondary,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 6),
        ],
        GestureDetector(
          onTap: () => _openPicker(context),
          child: AbsorbPointer(
            child: TextFormField(
              validator:(value) => value == null ? 'Selecione a hora' : null,
              enabled: enabled,
              readOnly: true,
              style: AppTextStyles.text16.copyWith(
                color: AppColors.textPrimary,
              ),
              decoration: InputDecoration(
                hintText: hint,
                hintStyle: AppTextStyles.text14.copyWith(
                  color: AppColors.textMuted,
                ),
                filled: true,
                fillColor: AppColors.card,
                isDense: true,
                contentPadding: contentPadding ??
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
                prefixIcon: prefixIcon,
                suffixIcon: suffixIcon ??
                    const Icon(
                      Icons.access_time_rounded,
                      size: 18,
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
                  borderSide:
                      const BorderSide(color: AppColors.primary, width: 2),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide:
                      const BorderSide(color: AppColors.error, width: 2),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide:
                      const BorderSide(color: AppColors.error, width: 2),
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: AppColors.border.withOpacity(.5),
                  ),
                ),
              ),
              controller: TextEditingController(text: display),
            ),
          ),
        ),
      ],
    );
  }
}
