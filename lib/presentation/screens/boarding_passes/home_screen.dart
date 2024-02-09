import 'package:boarding_pass_manager/presentation/widgets/inputs/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../controllers/boarding_pass_form_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(BoardingPassFormController());
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Boarding Pass Manager 🛫')),
      ),
      body: const SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                _BoardingPassForm(),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _BoardingPassForm extends GetView<BoardingPassFormController> {
  const _BoardingPassForm();

  @override
  Widget build(BuildContext context) {
    const spaceBetweenFields = SizedBox(height: 10);
    return Form(
      key: controller.boardingPassFormKey,
      child: Column(
        children: [
          spaceBetweenFields,
          CustomTextFormField(
            label: 'Nombre',
            controller: controller.nameController,
            keyboardType: TextInputType.name,
            textCapitalization: TextCapitalization.words,
            validator: (value) => controller.validateCompletedField(value),
            onSaved: (value) => controller.name = value!,
          ),
          spaceBetweenFields,
          CustomTextFormField(
            label: 'Apellido',
            controller: controller.lastNameController,
            keyboardType: TextInputType.name,
            textCapitalization: TextCapitalization.words,
            validator: (value) => controller.validateCompletedField(value),
            onSaved: (value) => controller.lastName = value!,
          ),
          spaceBetweenFields,
          CustomTextFormField(
            label: 'Edad',
            controller: controller.ageController,
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            validator: (value) => controller.validateCompletedField(value),
            onSaved: (value) => controller.age = value!,
          ),
          spaceBetweenFields,
          CustomTextFormField(
            label: 'Email',
            controller: controller.emailController,
            keyboardType: TextInputType.emailAddress,
            validator: (value) =>
                controller.validateCompletedField(value) ??
                controller.validateEmailFormat(value),
            onSaved: (value) => controller.email = value!,
          ),
          spaceBetweenFields,
          CustomTextFormField(
            label: 'Aeropuerto',
            controller: controller.airportController,
            keyboardType: TextInputType.name,
            textCapitalization: TextCapitalization.words,
            validator: (value) => controller.validateCompletedField(value),
            onSaved: (value) => controller.airport = value!,
          ),
          spaceBetweenFields,
          CustomTextFormField(
            label: 'Número del vuelo',
            controller: controller.flightController,
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            validator: (value) => controller.validateCompletedField(value),
            onSaved: (value) => controller.flight = value!,
          ),
          const SizedBox(height: 30),
          FilledButton.tonalIcon(
            onPressed: () => controller.checkForm(),
            icon: const Icon(Icons.save),
            label: const Text('Registrar pase de abordar'),
          )
        ],
      ),
    );
  }
}
