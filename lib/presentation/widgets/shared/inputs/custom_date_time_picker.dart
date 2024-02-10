import 'package:boarding_pass_manager/config/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:date_time_picker/date_time_picker.dart';

class CustomDateTimePicker extends StatelessWidget {
  final IconData? icon;
  final String? label;
  final String? initialValue;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final void Function(String?)? onSaved;
  final String? errorText;
  final bool enabled;

  const CustomDateTimePicker({
    super.key,
    this.icon,
    this.label,
    this.initialValue,
    this.validator,
    this.controller,
    this.onSaved,
    this.errorText,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    final colors = AppTheme.getColorScheme(context);
    final border = OutlineInputBorder(borderRadius: BorderRadius.circular(10));
    return DateTimePicker(
      type: DateTimePickerType.dateTime,
      dateMask: 'd MMM, yyyy - HH:mm',
      enabled: enabled,
      initialValue: initialValue,
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
      icon: Icon(icon),
      dateLabelText: 'Fecha',
      timeLabelText: "Hora",
      controller: controller,
      validator: validator,
      onSaved: onSaved,
      decoration: InputDecoration(
        label: label != null ? Text(label!) : null,
        suffixIcon: Icon(icon),
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
        errorText: errorText,
      ),
    );
  }
}
