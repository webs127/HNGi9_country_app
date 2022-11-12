import 'package:country/presentation/resources/color_manager.dart';
import 'package:flutter/material.dart';

class ThemeManager {
  ThemeData selectedTheme = ThemeData();
  static ThemeData lightTheme = ThemeData(
    primarySwatch: Colors.grey,
    brightness: Brightness.light,
    scaffoldBackgroundColor: ColorManager.lightMode,
    appBarTheme: AppBarTheme(color: ColorManager.lightMode, elevation: 0,),
    textTheme: Typography.blackRedmond,
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: ColorManager.lightMode
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primarySwatch: Colors.grey,
    appBarTheme: AppBarTheme(color: ColorManager.darkMode, elevation: 0),
    scaffoldBackgroundColor: ColorManager.darkMode,
    textTheme: Typography.whiteCupertino,
    bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: ColorManager.darkMode,
      shape: OutlineInputBorder()
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}
