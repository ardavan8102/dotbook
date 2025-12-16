import 'package:dotbook/consts/colors.dart';
import 'package:flutter/material.dart';

class CardBoxWithIconItem extends StatelessWidget {
  const CardBoxWithIconItem({
    super.key,
    required this.size,
    required this.textTheme,
    required this.icon,
    required this.label,
    required this.subtext,
    required this.function,
  });

  final Size size;
  final TextTheme textTheme;

  final IconData icon;
  final String label;
  final String subtext;
  final Function() function;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Container(
        height: size.height * .1,
        decoration: BoxDecoration(
          color: AppSolidColors.darkCreama,
          borderRadius: .circular(16),
        ),
        padding: EdgeInsets.all(12),
        child: Row(
          spacing: 12,
          children: [
            // Icon
            fileCenterCardIcon(),
      
            // Column : Title & File count
            Column(
              crossAxisAlignment: .start,
              mainAxisAlignment: .center,
              children: [
                Text(
                  label,
                  style: textTheme.labelSmall!.copyWith(
                    fontWeight: .bold
                  ),
                ),
      
                Text(
                  subtext,
                  style: textTheme.labelSmall!.copyWith(
                    fontWeight: .w400
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Container fileCenterCardIcon() {
    return Container(
      decoration: BoxDecoration(
        color: AppSolidColors.accent.withValues(alpha: .2),
        borderRadius: .circular(10)
      ),
      width: size.height * .05,
      height: size.height * .05,
      child: Icon(
        icon,
        size: 30,
        color: AppSolidColors.accent,
      ),
    );
  }
}