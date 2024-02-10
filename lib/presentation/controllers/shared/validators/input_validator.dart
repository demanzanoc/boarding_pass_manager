import 'package:get/get.dart';

class InputValidator {
  static String? validateCompletedField(String? value) {
    if (value == null || value.isEmpty || value.trim().isEmpty) {
      return 'Este dato es requerido';
    } else {
      return null;
    }
  }

  static String? validateEmailFormat(String? value) {
    if (!GetUtils.isEmail(value!)) {
      return 'No es un correo válido';
    } else {
      return null;
    }
  }
}
