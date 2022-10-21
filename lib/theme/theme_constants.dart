import 'package:flutter/material.dart';

const colorPrimary = Color.fromRGBO(0, 0, 84, 1);
const colorAccent = Color.fromRGBO(9, 0, 129, 1);
const parisineFont = "Parisine";

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: colorPrimary,
  textTheme: const TextTheme(
    ///
    /// Titles
    ///
    titleLarge: TextStyle(
      fontFamily: parisineFont,
      fontWeight: FontWeight.bold,
      fontSize: 24,
      color: Colors.black,
    ),
    titleMedium: TextStyle(
      fontFamily: parisineFont,
      fontWeight: FontWeight.bold,
      fontSize: 20,
      color: colorPrimary,
    ),
    titleSmall: TextStyle(
      fontFamily: parisineFont,
      fontSize: 18,
      color: Colors.black,
    ),

    ///
    /// Subtitles
    ///
    subtitle1: null,
    subtitle2: null,

    ///
    /// Body
    ///
    bodyLarge: null,
    bodyMedium: null,
    bodySmall: null,
    bodyText1: null,
    bodyText2: null,

    ///
    /// Headlines
    ///
    headline1: null,
    headline2: null,
    headline3: null,
    headline4: null,
    headline5: null,
    headline6: null,
    headlineLarge: null,
    headlineMedium: null,
    headlineSmall: null,

    ///
    /// Label
    ///
    labelLarge: TextStyle(
      fontFamily: parisineFont,
      fontSize: 28,
      color: Colors.white,
    ),
    labelMedium: TextStyle(
      fontFamily: parisineFont,
      fontSize: 18,
      color: Color.fromRGBO(0, 0, 84, 1),
    ),
    labelSmall: TextStyle(
      fontFamily: parisineFont,
      fontSize: 14,
      color: Color.fromRGBO(0, 0, 84, 1),
    ),

    ///
    /// Display
    ///
    displayLarge: null,
    displayMedium: null,
    displaySmall: null,
  ),
);

ThemeData darkTheme = ThemeData(brightness: Brightness.dark);
