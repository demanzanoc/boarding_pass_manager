import 'package:boarding_pass_manager/config/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFormField extends StatelessWidget {
  final String? label;
  final String? errorText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final TextCapitalization textCapitalization;
  final bool? enabled;

  const CustomTextFormField({
    super.key,
    this.label,
    this.errorText,
    this.controller,
    this.validator,
    this.onSaved,
    this.keyboardType,
    this.inputFormatters,
    this.textCapitalization = TextCapitalization.none,
    this.enabled,
  });

  @override
  Widget build(BuildContext context) {
    final colors = AppTheme.getColorScheme(context);
    final border = OutlineInputBorder(borderRadius: BorderRadius.circular(10));
    return TextFormField(
      enabled: enabled,
      controller: controller,
      validator: validator,
      onSaved: onSaved,
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      textCapitalization: textCapitalization,
      decoration: InputDecoration(
        enabledBorder: border,
        focusedBorder: border.copyWith(
          borderSide: BorderSide(color: colors.primary),
        ),
        errorBorder: border.copyWith(
          borderSide: BorderSide(color: Colors.red.shade800),
        ),
        focusedErrorBorder: border.copyWith(
          borderSide: BorderSide(color: Colors.red.shade800),
        ),
        isDense: true,
        label: label != null ? Text(label!) : null,
        focusColor: colors.primary,
        errorText: errorText,
      ),
    );
  }
}
