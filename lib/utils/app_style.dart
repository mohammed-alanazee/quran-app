import 'package:flutter/material.dart';

class AppStyle {
  static const double paddin = 20.0;
  // colors
  static const Color primaryColor = Color(0xFF34C986);
  static const Color secondaryColor = Color(0xFF29B375);
  static const Color whiteColor = Color(0xffFEFEFE);
  static const Color darkColor = Color(0xff323540);
  static const Color darkColor2 = Color(0xff454A5C);
  //
  // fonts
  static const TextStyle titleTextStyle = TextStyle(
    fontSize: 26,
  );
  static const TextStyle bodyTextStyle =
      TextStyle(fontSize: 18, fontWeight: FontWeight.w600);

  static const TextStyle ayahTextStyle = TextStyle(
    fontFamily: 'KFGQPC HAFS Uthmanic Script',
    fontSize: 22,
  );
  //

  //themes
  static ThemeData lightTheme = ThemeData(
    fontFamily: 'Amiri',
    primaryColor: primaryColor,
    scaffoldBackgroundColor: whiteColor,
    colorScheme: const ColorScheme.light(),
  );

  static ThemeData darkTheme = ThemeData(
    fontFamily: 'Amiri',
    colorScheme: const ColorScheme.dark(),
    primaryColor: primaryColor,
    scaffoldBackgroundColor: darkColor,
  );
  //
}
