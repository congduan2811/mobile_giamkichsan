import 'package:flutter/material.dart';

class ThemeCustom {
  static ThemeData themeLight = ThemeData.light().copyWith(
    scaffoldBackgroundColor: Colors.transparent,
  );

  static ThemeData themePhysiognomy = ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
          seedColor: Color(0xffFFFFFF), brightness: Brightness.dark),
      textTheme: TextTheme(
        displayLarge: const TextStyle(
            fontSize: 72,
            fontWeight: FontWeight.bold,
            color: Color(0xff141A46),
            backgroundColor: Color(0xffEC8B5E)),
        displayMedium: const TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Color(0xff2F3C7E),
            backgroundColor: Color(0xffFBEAEB)),
        displaySmall: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: Color(0xffF4A950),
            backgroundColor: Color(0xff161B21)),
      ),
      buttonTheme: ButtonThemeData(
          buttonColor: Color(0xffF4A950),
          focusColor: Color.fromARGB(255, 243, 157, 52),
          colorScheme: ColorScheme.fromSeed(
            seedColor: Color(0xffF4A950),
          )));
}
