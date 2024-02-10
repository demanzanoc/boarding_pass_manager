import 'package:boarding_pass_manager/di/dependency_injector.dart';
import 'package:boarding_pass_manager/presentation/screens/boarding_passes/personal_data_form_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'config/theme/app_theme.dart';

void main() async {
  await dotenv.load(fileName: '.env');
  await initInjection();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme().getTheme(),
      home: const PersonalDataFormScreen(),
    );
  }
}
