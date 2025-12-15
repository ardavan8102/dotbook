import 'package:dotbook/core/theme/app_typography.dart';
import 'package:flutter/material.dart';

class AppTheme {

  static ThemeData mainTheme = ThemeData(

    fontFamily: 'Roboto',

    textTheme: TextTheme(

      // headlines
      headlineLarge: AppTypography.headlineBIG,
      headlineMedium: AppTypography.headlineMEDIUM,
      headlineSmall: AppTypography.headlineSMALL,



      // Labels
      labelLarge: AppTypography.labelBIG,
      labelMedium: AppTypography.labelMEDIUM,
      labelSmall: AppTypography.labelSMALL,

    ),
    
  );

}