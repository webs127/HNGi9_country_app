import 'package:flutter/material.dart';

class ThemeManager {
  ThemeData selectedTheme = ThemeData();
  static ThemeData lightTheme = ThemeData(
    primarySwatch: Colors.grey,
    brightness: Brightness.light,
    textTheme: Typography.blackRedmond,
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primarySwatch: Colors.grey,
    textTheme: Typography.whiteCupertino,
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}
