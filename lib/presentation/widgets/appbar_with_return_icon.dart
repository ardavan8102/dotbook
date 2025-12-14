import 'package:dotbook/consts/colors.dart';
import 'package:flutter/material.dart';

class AppBarWithReturnIcon extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWithReturnIcon({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
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
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(60);
}