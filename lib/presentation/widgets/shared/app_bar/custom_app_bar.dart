import 'package:boarding_pass_manager/config/theme/app_theme.dart';
import 'package:flutter/material.dart';

import 'custom_app_bar_clipper.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = AppTheme.getColorScheme(context);
    return AppBar(
      backgroundColor: Colors.transparent,
      flexibleSpace: ClipPath(
        clipper: CustomAppBarClipper(),
        child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                colors.primary,
                colors.secondary,
              ],
            ),
          ),
          child: const Center(
            child: Text(
              'Boarding Manager 🛫',
              style: TextStyle(
                color: Colors.white,
                fontSize: 26,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
      ),
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.white),
        onPressed: () => Navigator.of(context).pop(),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 30);
}
