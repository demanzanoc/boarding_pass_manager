import 'package:boarding_pass_manager/presentation/controllers/boarding_passes/personal_data_form_controller.dart';
import 'package:boarding_pass_manager/presentation/widgets/shared/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../constants/assets.dart';
import '../../widgets/shared/buttons/custom_filled_button.dart';
import '../../widgets/shared/inputs/custom_text_form_field.dart';

class PersonalDataFormScreen extends StatelessWidget {
  const PersonalDataFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: SizedBox(
                  height: 120,
                  child: Image.asset(Assets.personalDataImg),
                ),
              ),
              const SizedBox(height: 20),
              const _PersonalDataForm(),
              const SizedBox(height: 20),
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
      key: controller.getPersonalDataFormKey,
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
          const SizedBox(height: 30),
          CustomFilledButton(
            onPressed: () => controller.checkForm(),
            iconData: Icons.arrow_forward_ios,
            label: 'Continuar',
          ),
        ],
      ),
    );
  }
}
