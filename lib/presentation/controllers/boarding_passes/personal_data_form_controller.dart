import 'package:boarding_pass_manager/presentation/controllers/shared/validators/input_validator.dart';
import 'package:boarding_pass_manager/presentation/screens/boarding_passes/boarding_data_form_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PersonalDataFormController extends GetxController {
  final GlobalKey<FormState> _personalDataFormKey = GlobalKey<FormState>();

  GlobalKey<FormState> get getPersonalDataFormKey => _personalDataFormKey;

  late TextEditingController nameController,
      lastNameController,
      ageController,
      emailController;

  String name = '';
  String lastName = '';
  String age = '';
  String email = '';

  @override
  void onInit() {
    nameController = TextEditingController();
    lastNameController = TextEditingController();
    ageController = TextEditingController();
    emailController = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    nameController.dispose();
    lastNameController.dispose();
    ageController.dispose();
    emailController.dispose();
    _personalDataFormKey.currentState!.reset();
    super.onClose();
  }

  String? validateEmailFormat(String? value) =>
      InputValidator.validateEmailFormat(value);

  String? validateCompletedField(String? value) =>
      InputValidator.validateCompletedField(value);

  void checkForm() {
    final isValid = _personalDataFormKey.currentState!.validate();
    if (!isValid) return;
    _personalDataFormKey.currentState!.save();
    Get.to(() => const BoardingDataFormScreen());
  }

  void clearForm() {
    nameController.clear();
    lastNameController.clear();
    ageController.clear();
    emailController.clear();
  }
}
