import 'package:flutter/material.dart';

const colorPrimary = Color.fromRGBO(0, 0, 84, 1);
const colorAccent = Color.fromRGBO(9, 0, 129, 1);

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: colorPrimary,
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: colorAccent,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
        const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
      ),
      shape: MaterialStateProperty.all<OutlinedBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
      backgroundColor: MaterialStateProperty.all<Color>(colorAccent),
    ),
  ),
);

ThemeData darkTheme = ThemeData(brightness: Brightness.dark);
