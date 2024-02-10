import 'package:boarding_pass_manager/presentation/controllers/boarding_passes/boarding_pass_form_controller.dart';
import 'package:boarding_pass_manager/presentation/widgets/shared/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../controllers/shared/states/request_state.dart';
import '../../widgets/shared/inputs/custom_date_time_picker.dart';
import '../../widgets/shared/inputs/custom_text_form_field.dart';

class BoardingDataFormScreen extends StatelessWidget {
  const BoardingDataFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              _BoardingPassDataForm(),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

class _BoardingPassDataForm extends GetView<BoardingPassFormController> {
  const _BoardingPassDataForm();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      const spaceBetweenFields = SizedBox(height: 10);
      final state = controller.boardingPassInsertionState.value;
      return Form(
        key: controller.getBoardingPassFormKey,
        child: Column(
          children: [
            CustomTextFormField(
              label: 'Aeropuerto',
              controller: controller.airportController,
              keyboardType: TextInputType.name,
              textCapitalization: TextCapitalization.words,
              validator: (value) => controller.validateCompletedField(value),
              onSaved: (value) => controller.airport = value!,
              enabled: state != RequestState.loading,
            ),
            spaceBetweenFields,
            CustomTextFormField(
              label: 'Número del vuelo',
              controller: controller.flightController,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              validator: (value) => controller.validateCompletedField(value),
              onSaved: (value) => controller.flight = value!,
              enabled: state != RequestState.loading,
            ),
            spaceBetweenFields,
            CustomDateTimePicker(
              controller: controller.departureTimeController,
              label: 'Fecha y hora de salida',
              validator: (value) => controller.validateCompletedField(value),
              onSaved: (value) => controller.departureTime = value!,
              enabled: state != RequestState.loading,
              icon: Icons.event,
            ),
            spaceBetweenFields,
            CustomDateTimePicker(
              controller: controller.arrivalTimeController,
              label: 'Fecha y hora de llegada',
              validator: (value) => controller.validateCompletedField(value),
              onSaved: (value) => controller.arrivalTime = value!,
              enabled: state != RequestState.loading,
              icon: Icons.event,
            ),
            const SizedBox(height: 30),
            if (state == RequestState.loading)
              const CircularProgressIndicator()
            else
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 18),
                child: FilledButton.tonalIcon(
                  onPressed: () => controller.checkForm(),
                  icon: const Icon(Icons.save),
                  label: const Text('Registrar pase de abordaje'),
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 18,
                      vertical: 12,
                    ),
                    textStyle: const TextStyle(fontSize: 16),
                  ),
                ),
              )
          ],
        ),
      );
    });
  }
}
