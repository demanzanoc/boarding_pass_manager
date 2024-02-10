import 'package:boarding_pass_manager/presentation/controllers/boarding_passes/personal_data_form_controller.dart';
import 'package:boarding_pass_manager/presentation/widgets/shared/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../widgets/shared/inputs/custom_text_form_field.dart';

class PersonalDataFormScreen extends StatelessWidget {
  const PersonalDataFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              _PersonalDataForm(),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

class _PersonalDataForm extends GetView<PersonalDataFormController> {
  const _PersonalDataForm();

  @override
  Widget build(BuildContext context) {
    const spaceBetweenFields = SizedBox(height: 10);
    return Form(
      key: controller.personalDataFormKey,
      child: Column(
        children: [
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
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 18),
            child: FilledButton.tonalIcon(
              onPressed: () => controller.checkForm(),
              icon: const Icon(Icons.arrow_forward_ios),
              label: const Text('Continuar'),
              style: TextButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 18,
                  vertical: 12,
                ),
                textStyle: const TextStyle(fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
