import 'package:dotbook/consts/colors.dart';
import 'package:dotbook/core/theme/app_typography.dart';
import 'package:flutter/material.dart';

class DarkTheme {

  static ThemeData darkTheme = ThemeData(

    scaffoldBackgroundColor: AppSolidColors.darkScaffoldBackground,
    primaryColor: AppSolidColors.darkCreama,

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