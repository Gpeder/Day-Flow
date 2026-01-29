import 'package:dayflow/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MainForm extends StatelessWidget {
  final TextEditingController? controller;
  final String? label;
  final String? hint;
  final TextInputType? keyboardType;
  final ValueChanged<String>? onChanged;
  final String? Function(String?)? validator;
  final bool obscureText;
  final bool enabled;
  final int maxLines;
  final int? maxLength;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputAction? textInputAction;
  final VoidCallback? onTap;
  final bool readOnly;
  final FocusNode? focusNode;
  final EdgeInsetsGeometry? contentPadding;

  const MainForm({
    super.key,
    this.controller,
    this.label,
    this.hint,
    this.keyboardType,
    this.onChanged,
    this.validator,
    this.obscureText = false,
    this.enabled = true,
    this.maxLines = 1,
    this.maxLength,
    this.prefixIcon,
    this.suffixIcon,
    this.inputFormatters,
    this.textInputAction,
    this.onTap,
    this.readOnly = false,
    this.focusNode,
    this.contentPadding,
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
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          onChanged: onChanged,
          validator: validator,
          obscureText: obscureText,
          enabled: enabled,
          maxLines: maxLines,
          maxLength: maxLength,
          inputFormatters: inputFormatters,
          textInputAction: textInputAction,
          onTap: onTap,
          readOnly: readOnly,
          focusNode: focusNode,
          style: AppTextStyles.text16.copyWith(color: AppColors.overlay),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle:
                AppTextStyles.text14.copyWith(color: AppColors.textMuted),
            filled: true,
            fillColor: AppColors.card,
            isDense: true,
            contentPadding: contentPadding ??
                const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
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
              borderSide: const BorderSide(color: AppColors.primary, width: 2),
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
          ),
        ),
      ],
    );
  }
}