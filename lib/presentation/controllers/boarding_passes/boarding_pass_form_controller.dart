import 'package:boarding_pass_manager/domain/entities/boarding_passes/boarding_pass.dart';
import 'package:boarding_pass_manager/domain/repositories/boarding_passes/boarding_passes_repository.dart';
import 'package:boarding_pass_manager/domain/utils/uuid_util.dart';
import 'package:boarding_pass_manager/presentation/controllers/boarding_passes/personal_data_form_controller.dart';
import 'package:boarding_pass_manager/presentation/controllers/shared/states/request_state.dart';
import 'package:boarding_pass_manager/presentation/controllers/shared/validators/input_validator.dart';
import 'package:boarding_pass_manager/presentation/screens/boarding_passes/personal_data_form_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/dialogs/custom_snack_bar.dart';

class BoardingPassFormController extends GetxController {
  final BoardingPassesRepository boardingPassRepository;

  BoardingPassFormController({required this.boardingPassRepository});

  GlobalKey<FormState> boardingPassFormKey = GlobalKey<FormState>();
  PersonalDataFormController personalDataFormController =
      Get.find<PersonalDataFormController>();

  late TextEditingController airportController,
      flightController,
      departureTimeController,
      arrivalTimeController;

  String airport = '';
  String flight = '';
  String departureTime = '';
  String arrivalTime = '';

  Rx<RequestState> boardingPassInsertionState = RequestState.initial.obs;

  @override
  void onInit() {
    airportController = TextEditingController();
    flightController = TextEditingController();
    departureTimeController = TextEditingController();
    arrivalTimeController = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    airportController.dispose();
    flightController.dispose();
    departureTimeController.dispose();
    arrivalTimeController.dispose();
    super.onClose();
  }

  String? validateCompletedField(String? value) =>
      InputValidator.validateCompletedField(value);

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
        age: int.tryParse(personalDataFormController.age)!,
        airport: airport,
        arrivalTime: DateTime.parse(arrivalTime),
        departureTime: DateTime.parse(departureTime),
        email: personalDataFormController.email,
        flight: flight,
        id: UuidUtil.getUuidV4(),
        lastName: personalDataFormController.lastName,
        name: personalDataFormController.name,
      );

  void _onSuccessRequest() {
    boardingPassInsertionState.value = RequestState.success;
    CustomSnackBar.success('Se guardaron los datos exitosamente')
        .showSnackBar();
    _clearForm();
    Get.off(const PersonalDataFormScreen());
  }

  void _onErrorRequest(String exception) {
    boardingPassInsertionState.value = RequestState.error;
    CustomSnackBar.error(exception).showSnackBar();
  }

  void _clearForm() {
    personalDataFormController.clearForm();
    airportController.clear();
    flightController.clear();
    departureTimeController.clear();
    arrivalTimeController.clear();
  }
}
