import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    required this.function,
    required this.msg,
    required this.bgColor,
    required this.textColor,
  });

  final Function() function;
  final String msg;
  final Color bgColor;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: function,
      style: ButtonStyle(
        elevation: WidgetStatePropertyAll(0),
        backgroundColor: WidgetStatePropertyAll(bgColor),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: .circular(10)
          ),
        )
      ),
      child: Text(
        msg,
        style: TextStyle(
          color: textColor,
        ),
      ),
    );
  }
}
