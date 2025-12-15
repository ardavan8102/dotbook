import 'package:dotbook/consts/colors.dart';
import 'package:dotbook/core/controllers/drawer_menu_controller.dart';
import 'package:dotbook/core/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomMainAppBar extends StatelessWidget implements PreferredSizeWidget {
  CustomMainAppBar({super.key, required this.title, required this.globalKey});

  final String title;
  final GlobalKey<ScaffoldState> globalKey;

  final DrawerMenuController controller = Get.find<DrawerMenuController>();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      automaticallyImplyLeading: false,
      automaticallyImplyActions: false,
      scrolledUnderElevation: 0,
      backgroundColor: AppSolidColors.lightBackGround,
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

          GestureDetector(
            onTap: () => Get.toNamed(AppRoutes.settings),
            child: const Icon(
              Icons.settings,
            ),
          ),
        ],
      ),
      actions: [
        GestureDetector(
          onTap: () {
            controller.toggle(globalKey);
          },
          child: const Icon(Icons.menu)
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