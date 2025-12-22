import 'package:dotbook/consts/colors.dart';
import 'package:dotbook/core/controllers/app_theme_controller.dart';
import 'package:dotbook/core/routes/app_routes.dart';
import 'package:dotbook/presentation/widgets/custom_icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppBarWithReturnIcon extends StatelessWidget implements PreferredSizeWidget {
  AppBarWithReturnIcon({super.key, required this.title});

  final String title;

  final AppThemeController appThemeController = Get.find<AppThemeController>();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      scrolledUnderElevation: 0,
      backgroundColor: appThemeController.isDark.value == true
        ? AppSolidColors.darkScaffoldBackground
        : AppSolidColors.lightBackGround,
      actions: [
        GestureDetector(
          onTap: () => Get.offAndToNamed(AppRoutes.home),
          child: CustomIcon(icon: Icons.home_filled),
        ),

        const SizedBox(width: 20),
      ],
      automaticallyImplyLeading: false,
      leading: GestureDetector(
        onTap: () => Get.back(),
        child: CustomIcon(icon: Icons.chevron_left)
      ),
      title: Text(
        title,
        style: TextStyle(
          fontWeight: .bold,
          color: AppSolidColors.darkCreama,
          fontSize: 18
        ),
      ),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(60);
}