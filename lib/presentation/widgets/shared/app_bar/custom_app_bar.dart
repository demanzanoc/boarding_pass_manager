import 'package:boarding_pass_manager/config/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'custom_clipper_app_bar.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? leading;
  const CustomAppBar({super.key, this.leading});

  @override
  Widget build(BuildContext context) {
    final colors = AppTheme.getColorScheme(context);
    return AppBar(
      backgroundColor: Colors.transparent,
      flexibleSpace: ClipPath(
        clipper: CustomClipperAppBar(),
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
              'Airticket 🛫',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
      ),
      leading: leading,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 30);
}
