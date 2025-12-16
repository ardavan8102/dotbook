import 'package:dotbook/core/controllers/app_theme_controller.dart';
import 'package:dotbook/presentation/widgets/custom_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppChangeThemeButton extends StatelessWidget {
  const AppChangeThemeButton({
    super.key,
    required this.appThemeController,
    required this.theme,
  });

  final AppThemeController appThemeController;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GestureDetector(
        onTap: appThemeController.toggleTheme,
        child: appThemeController.isDark.value == true
          ? CustomIcon(icon: CupertinoIcons.sun_max)
          : CustomIcon(icon: CupertinoIcons.moon),
      ),
    );
  }
}