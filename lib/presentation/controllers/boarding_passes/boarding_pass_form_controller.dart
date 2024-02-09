import 'package:boarding_pass_manager/domain/entities/boarding_passes/boarding_pass.dart';
import 'package:boarding_pass_manager/domain/repositories/boarding_passes/boarding_passes_repository.dart';
import 'package:boarding_pass_manager/domain/utils/uuid_util.dart';
import 'package:boarding_pass_manager/presentation/controllers/shared/states/request_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/dialogs/custom_snack_bar.dart';

class BoardingPassFormController extends GetxController {
  final BoardingPassesRepository boardingPassRepository;

  BoardingPassFormController({required this.boardingPassRepository});

  GlobalKey<FormState> boardingPassFormKey = GlobalKey<FormState>();

  late TextEditingController nameController,
      lastNameController,
      ageController,
      emailController,
      airportController,
      flightController,
      departureTimeController,
      arrivalTimeController;

  String name = '';
  String lastName = '';
  String age = '';
  String email = '';
  String airport = '';
  String flight = '';
  String departureTime = '';
  String arrivalTime = '';

  Rx<RequestState> boardingPassInsertionState = RequestState.initial.obs;

  @override
  void onInit() {
    nameController = TextEditingController();
    lastNameController = TextEditingController();
    ageController = TextEditingController();
    emailController = TextEditingController();
    airportController = TextEditingController();
    flightController = TextEditingController();
    departureTimeController = TextEditingController();
    arrivalTimeController = TextEditingController();
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
    departureTimeController.dispose();
    arrivalTimeController.dispose();
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
    _setBoardingPass();
  }

  Future<void> _setBoardingPass() async {
    boardingPassInsertionState.value = RequestState.loading;
    try {
      final boardingPass = _createBoardingPassEntity();
      await boardingPassRepository.setBoardingPass(boardingPass);
      _onSuccessRequest();
    } catch (exception) {
      _onErrorRequest(exception.toString());
    }
  }

  BoardingPass _createBoardingPassEntity() => BoardingPass(
        age: int.tryParse(age)!,
        airport: airport,
        arrivalTime: DateTime.parse(arrivalTime),
        departureTime: DateTime.parse(departureTime),
        email: email,
        flight: flight,
        id: UuidUtil.getUuidV4(),
        lastName: lastName,
        name: name,
      );

  void _onSuccessRequest() {
    boardingPassInsertionState.value = RequestState.success;
    CustomSnackBar.success('Se guardaron los datos exitosamente')
        .showSnackBar();
    _clearForm();
  }

  void _onErrorRequest(String exception) {
    boardingPassInsertionState.value = RequestState.error;
    CustomSnackBar.error(exception).showSnackBar();
  }

  void _clearForm() {
    nameController.clear();
    lastNameController.clear();
    ageController.clear();
    emailController.clear();
    airportController.clear();
    flightController.clear();
    departureTimeController.clear();
    arrivalTimeController.clear();
  }
}
