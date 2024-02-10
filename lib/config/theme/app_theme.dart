import 'package:flutter/material.dart';

class AppTheme {
  ThemeData getTheme() => ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      );

  static ColorScheme getColorScheme(BuildContext context) =>
      Theme.of(context).colorScheme;
}
