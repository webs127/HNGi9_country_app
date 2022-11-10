import 'package:flutter/cupertino.dart';

class ColorManager {
  static Color darkMode = HexColor.hexString("#000F24");
  static Color lightMode = HexColor.hexString("#FFFFFF");
}

extension HexColor on Color {
  static Color hexString(String string) {
    string = string.replaceAll("#", "");
    if(string.length == 6) {
      string = "FF$string";
    }
    return Color(int.parse(string, radix:  16));
  }
}