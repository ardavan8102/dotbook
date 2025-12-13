import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    required this.controller,
    required this.msg,
  });

  final VoidCallback controller;
  final String msg;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: controller, child: Text(msg));
  }
}