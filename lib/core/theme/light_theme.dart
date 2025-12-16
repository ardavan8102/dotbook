import 'package:dotbook/consts/colors.dart';
import 'package:dotbook/core/theme/app_typography.dart';
import 'package:flutter/material.dart';

class LightTheme {

  static ThemeData lightTheme = ThemeData(

    scaffoldBackgroundColor: AppSolidColors.lightBackGround,
    primaryColor: AppSolidColors.darkCreama,

    fontFamily: 'Roboto',

    iconTheme: IconThemeData(
      color: Colors.black
    ),

    textTheme: TextTheme(

      // headlines
      headlineLarge: LightAppTypography.headlineBIG,
      headlineMedium: LightAppTypography.headlineMEDIUM,
      headlineSmall: LightAppTypography.headlineSMALL,

      // Titles
      titleLarge: LightAppTypography.titleBIG,
      titleMedium: LightAppTypography.titleMEDIUM,
      titleSmall: LightAppTypography.titleSMALL,

      // Labels
      labelLarge: LightAppTypography.labelBIG,
      labelMedium: LightAppTypography.labelMEDIUM,
      labelSmall: LightAppTypography.labelSMALL,

    ),

  );

}