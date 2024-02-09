import 'package:boarding_pass_manager/domain/entities/boarding_passes/boardig_pass.dart';
import 'package:boarding_pass_manager/domain/repositories/boarding_passes/boarding_passes_repository.dart';
import 'package:boarding_pass_manager/presentation/widgets/inputs/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../di/dependency_injector.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Boarding Pass Manager 🛫')),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                _BoardingPassForm(),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _setData() async {
    final BoardingPassesRepository repo = di<BoardingPassesRepository>();
    await repo.setBoardingPass(
      BoardingPass(
        age: 29,
        airport: 'airport',
        arrivalTime: DateTime.now(),
        departureTime: DateTime.now(),
        email: 'email@email.com',
        flight: '2222',
        id: 'bb632d90-9624-475e-a61b-4e07200ac445',
        lastName: 'Matias',
        name: 'Yañez',
      ),
    );
  }
}

class _BoardingPassForm extends StatelessWidget {
  String name = '';
  String lastName = '';
  String age = '';
  String email = '';
  String airport = '';
  String flight = '';

  _BoardingPassForm();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    const spaceBetweenFields = SizedBox(height: 10);
    return Form(
      key: _formKey,
      child: Column(
        children: [
          spaceBetweenFields,
          CustomTextFormField(
            label: 'Nombre',
            onChanged: (value) => name = value,
            inputType: TextInputType.name,
            textCapitalization: TextCapitalization.words,
            validator: (value) => _validateCompletedField(value),
          ),
          spaceBetweenFields,
          CustomTextFormField(
            label: 'Apellido',
            onChanged: (value) => lastName = value,
            inputType: TextInputType.name,
            textCapitalization: TextCapitalization.words,
            validator: (value) => _validateCompletedField(value),
          ),
          spaceBetweenFields,
          CustomTextFormField(
            label: 'Edad',
            onChanged: (value) => age = value,
            inputType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            validator: (value) => _validateCompletedField(value),
          ),
          spaceBetweenFields,
          CustomTextFormField(
            label: 'Email',
            onChanged: (value) => email = value,
            inputType: TextInputType.emailAddress,
            validator: (value) {
              return _validateCompletedField(value) ??
                  _validateEmailFormat(value);
            },
          ),
          spaceBetweenFields,
          CustomTextFormField(
            label: 'Aeropuerto',
            onChanged: (value) => airport = value,
            inputType: TextInputType.name,
            textCapitalization: TextCapitalization.words,
            validator: (value) => _validateCompletedField(value),
          ),
          spaceBetweenFields,
          CustomTextFormField(
            label: 'Número del vuelo',
            onChanged: (value) => flight = value,
            inputType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            validator: (value) => _validateCompletedField(value),
          ),
          const SizedBox(height: 30),
          FilledButton.tonalIcon(
            onPressed: () async {
              final bool isValid = _formKey.currentState!.validate();
              if (!isValid) return;

              /*final BoardingPassesRepository repo =
                  di<BoardingPassesRepository>();
              await repo.setBoardingPass(
                BoardingPass(
                  age: int.tryParse(age)!,
                  airport: airport,
                  arrivalTime: DateTime.now(),
                  departureTime: DateTime.now(),
                  email: email,
                  flight: flight,
                  id: const Uuid().v4(),
                  lastName: lastName,
                  name: name,
                ),
              );*/
              _formKey.currentState?.reset();
            },
            icon: const Icon(Icons.save),
            label: const Text('Registrar pase de abordar'),
          )
        ],
      ),
    );
  }

  String? _validateCompletedField(String? value) {
    if (value == null || value.isEmpty || value.trim().isEmpty) {
      return 'Este dato es requerido';
    } else {
      return null;
    }
  }

  String? _validateEmailFormat(String? value) {
    final emailRegExp = RegExp(
      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
    );
    if (!emailRegExp.hasMatch(value!)) {
      return 'No es un correo válido';
    } else {
      return null;
    }
  }
}
