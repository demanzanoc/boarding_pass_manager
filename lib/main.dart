import 'package:boarding_pass_manager/di/dependency_injector.dart';
import 'package:flutter/material.dart';
import 'config/theme/app_theme.dart';
import 'presentation/screens/boarding_passes/home_screen.dart';

Future<void> main() async {
  await initInjection();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme().getTheme(),
      home: const HomeScreen(),
    );
  }
}
