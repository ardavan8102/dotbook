import 'package:flutter/material.dart';

class AppBarWithReturnIcon extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWithReturnIcon({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      scrolledUnderElevation: 0,
      backgroundColor: Colors.transparent,
      title: Text(title),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(60);
}