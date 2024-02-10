import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSnackBar {
  final String title;
  final String message;
  final Color backgroundColor;
  final IconData? iconData;

  CustomSnackBar({
    required this.title,
    required this.message,
    required this.backgroundColor,
    this.iconData,
  });

  factory CustomSnackBar.error(String message) {
    return CustomSnackBar(
      title: '¡Error!',
      message: message,
      backgroundColor: Colors.red,
      iconData: Icons.error_outline,
    );
  }

  factory CustomSnackBar.success(String message) {
    return CustomSnackBar(
      title: 'Éxito',
      message: message,
      backgroundColor: Colors.green,
      iconData: Icons.check_circle_outline,
    );
  }

  void showSnackBar() {
    Get.snackbar(
      title,
      message,
      backgroundColor: backgroundColor,
      colorText: Colors.white,
      snackPosition: SnackPosition.BOTTOM,
      borderRadius: 10,
      margin: const EdgeInsets.all(10),
      duration: const Duration(seconds: 5),
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      isDismissible: true,
      forwardAnimationCurve: Curves.easeOutBack,
      reverseAnimationCurve: Curves.easeInBack,
      animationDuration: const Duration(milliseconds: 500),
      icon: iconData != null ? Icon(iconData, color: Colors.white) : null,
    );
  }
}
