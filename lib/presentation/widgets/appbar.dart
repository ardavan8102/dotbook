import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: const Text('Flutter EPUB Reader (MVP)')
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(60);
}
