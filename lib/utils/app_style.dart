import 'package:flutter/material.dart';

class AppStyle {
  static const double paddin = 20.0;
  static List<BoxShadow> shadow = <BoxShadow>[
    BoxShadow(
        blurRadius: 5, spreadRadius: 1, color: Colors.black.withOpacity(0.1))
  ];
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
    fontSize: 16,
  );
  //

  //themes
  static ThemeData lightTheme = ThemeData(
    fontFamily: 'Questv',
    primaryColor: primaryColor,
    scaffoldBackgroundColor: whiteColor,
    colorScheme: const ColorScheme.light(),
  );

  static ThemeData darkTheme = ThemeData(
    fontFamily: 'Questv',
    colorScheme: const ColorScheme.dark(),
    primaryColor: primaryColor,
    scaffoldBackgroundColor: darkColor,
  );
  //
}
