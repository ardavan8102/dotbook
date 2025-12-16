import 'package:dotbook/consts/colors.dart';
import 'package:dotbook/core/controllers/app_theme_controller.dart';
import 'package:dotbook/core/controllers/drawer_menu_controller.dart';
import 'package:dotbook/presentation/widgets/button/change_theme_button.dart';
import 'package:dotbook/presentation/widgets/custom_icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomMainAppBar extends StatelessWidget implements PreferredSizeWidget {
  CustomMainAppBar({super.key, required this.title, required this.globalKey});

  final String title;
  final GlobalKey<ScaffoldState> globalKey;

  final DrawerMenuController controller = Get.find<DrawerMenuController>();
  final AppThemeController appThemeController = Get.find<AppThemeController>();

  @override
  Widget build(BuildContext context) {

    var theme = Theme.of(context);

    return AppBar(
      elevation: 0,
      automaticallyImplyLeading: false,
      automaticallyImplyActions: false,
      scrolledUnderElevation: 1,
      backgroundColor: appThemeController.isDark.value == true
        ? AppSolidColors.darkScaffoldBackground
        :AppSolidColors.lightBackGround,
      title: Text(
        title,
        style: TextStyle(
          fontWeight: .bold,
          color: AppSolidColors.darkCreama
        ),
      ),
      centerTitle: true,
      leading: Row(
        children: [
          const SizedBox(
            width: 20,
          ),

          AppChangeThemeButton(appThemeController: appThemeController, theme: theme),
        ],
      ),
      actions: [
        GestureDetector(
          onTap: () {
            controller.toggle(globalKey);
          },
          child: CustomIcon(icon: Icons.menu)
        ),
        
        const SizedBox(
          width: 20,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(60);
}

