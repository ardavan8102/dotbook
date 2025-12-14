import 'package:flutter/material.dart';

class AppTheme {

  static ThemeData mainTheme = ThemeData(

    fontFamily: 'Roboto',

    textTheme: TextTheme(

      // headlines
      headlineLarge: TextStyle(
        fontSize: 32,
        fontWeight: .w800,
      ),

      headlineSmall: TextStyle(
        fontSize: 24,
        fontWeight: .w400
      ),



      // Labels
      labelSmall: TextStyle(
        fontSize: 14,
        fontWeight: .w300,
      ),

    ),
    
  );

}