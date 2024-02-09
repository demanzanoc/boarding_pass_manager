import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class BoardingPassFormController extends GetxController {
  final GlobalKey<FormState> boardingPassFormKey = GlobalKey<FormState>();
  late TextEditingController nameController,
      lastNameController,
      ageController,
      emailController,
      airportController,
      flightController;

  String name = '';
  String lastName = '';
  String age = '';
  String email = '';
  String airport = '';
  String flight = '';

  @override
  void onInit() {
    nameController = TextEditingController();
    lastNameController = TextEditingController();
    ageController = TextEditingController();
    emailController = TextEditingController();
    airportController = TextEditingController();
    flightController = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    nameController.dispose();
    lastNameController.dispose();
    ageController.dispose();
    emailController.dispose();
    airportController.dispose();
    flightController.dispose();
    super.onClose();
  }

  String? validateEmailFormat(String? value) {
    if (!GetUtils.isEmail(value!)) {
      return 'No es un correo válido';
    } else {
      return null;
    }
  }

  String? validateCompletedField(String? value) {
    if (value == null || value.isEmpty || value.trim().isEmpty) {
      return 'Este dato es requerido';
    } else {
      return null;
    }
  }

  void checkForm() {
    final isValid = boardingPassFormKey.currentState!.validate();
    if (!isValid) return;
    boardingPassFormKey.currentState!.save();
    boardingPassFormKey.currentState!.reset();
  }
}
