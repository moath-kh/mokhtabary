import 'package:flutter/material.dart';

class CustomeTheme {
  // Light
  static final ThemeData light = ThemeData.light().copyWith(
      appBarTheme: const AppBarTheme(
    backgroundColor: Colors.white,
    iconTheme: IconThemeData(color: Colors.black),
  ));
  // Dark
  static final ThemeData dark = ThemeData.dark().copyWith(
      appBarTheme: const AppBarTheme(
    backgroundColor: Colors.black,
    iconTheme: IconThemeData(color: Colors.white),
  ));
}
