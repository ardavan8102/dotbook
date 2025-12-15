import 'package:dotbook/presentation/widgets/appbar/appbar_with_return_icon.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBarWithReturnIcon(title: 'Settings'),
    );
  }
}