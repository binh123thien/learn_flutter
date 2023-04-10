import 'package:flutter/material.dart';
import 'package:loginscreen/src/utils/theme/widget_themes/text_theme.dart';

class PAppTheme {
  PAppTheme._();
  static ThemeData lightTheme = ThemeData(
      brightness: Brightness.light, textTheme: PTextTheme.lightTextTheme);
  static ThemeData darkTheme = ThemeData(
      brightness: Brightness.dark,
      textTheme: PTextTheme.darkTextTheme,
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.yellow)));
}
