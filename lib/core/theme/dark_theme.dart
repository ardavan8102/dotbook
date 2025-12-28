import 'package:dotbook/consts/colors.dart';
import 'package:dotbook/core/theme/app_typography.dart';
import 'package:flutter/material.dart';

class DarkTheme {

  static ThemeData darkTheme = ThemeData(

    brightness: Brightness.dark,

    scaffoldBackgroundColor: AppSolidColors.darkScaffoldBackground,

    primaryColor: AppSolidColors.darkCreama,

    drawerTheme: DrawerThemeData(
      backgroundColor: Color.fromARGB(255, 37, 37, 37)
    ),

    fontFamily: 'Poppins',

    iconTheme: IconThemeData(
      color: Colors.white
    ),

    textTheme: TextTheme(

      // headlines
      headlineLarge: DarkAppTypography.headlineBIG,
      headlineMedium: DarkAppTypography.headlineMEDIUM,
      headlineSmall: DarkAppTypography.headlineSMALL,

      // Titles
      titleLarge: DarkAppTypography.titleBIG,
      titleMedium: DarkAppTypography.titleMEDIUM,
      titleSmall: DarkAppTypography.titleSMALL,

      // Labels
      labelLarge: DarkAppTypography.labelBIG,
      labelMedium: DarkAppTypography.labelMEDIUM,
      labelSmall: DarkAppTypography.labelSMALL,

    ),

  );

}