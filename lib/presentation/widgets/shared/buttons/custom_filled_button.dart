import 'package:flutter/material.dart';

class CustomFilledButton extends StatelessWidget {
  final void Function()? onPressed;
  final IconData iconData;
  final String label;

  const CustomFilledButton({
    super.key,
    required this.onPressed,
    required this.iconData,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 18),
      child: FilledButton.tonalIcon(
        onPressed: onPressed,
        icon: Icon(iconData),
        label: Text(label),
        style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(
            horizontal: 18,
            vertical: 12,
          ),
          textStyle: const TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
