import 'package:dotbook/consts/colors.dart';
import 'package:flutter/material.dart';

class CustomDrawerMenuItem extends StatelessWidget {
  const CustomDrawerMenuItem({
    super.key,
    required this.textTheme,
    required this.label,
    required this.labelIcon,
    required this.function
  });

  final TextTheme textTheme;
  final String label;
  final IconData labelIcon;
  final Function() function;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 18),
      child: Material(
        color: AppSolidColors.lightCreama,
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1, color: AppSolidColors.accent),
          borderRadius: .circular(10),
        ),
        child: ListTile(
          onTap: function,
          splashColor: AppSolidColors.darkCreama,
          shape: RoundedRectangleBorder(borderRadius: .circular(10)),
          title: Text(label),
          titleTextStyle: textTheme.titleMedium,
          leading: Icon(labelIcon),
          trailing: Icon(Icons.chevron_right),
        ),
      ),
    );
  }
}
