import 'package:barbershop/src/core/constants.dart';
import 'package:flutter/material.dart';

const _defaultInputBorder = OutlineInputBorder(
  borderSide: BorderSide(color: ColorConstants.grey),
  borderRadius: BorderRadius.all(Radius.circular(8)),
);

sealed class BarbershopTheme {
  static ThemeData themeData = ThemeData(
    useMaterial3: true,
    fontFamily: FontConstants.fontFamily,
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      border: _defaultInputBorder,
      labelStyle: const TextStyle(color: ColorConstants.grey),
      focusedBorder: _defaultInputBorder,
      errorBorder: _defaultInputBorder.copyWith(
        borderSide: const BorderSide(color: ColorConstants.red),
      ),
    ),
    appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(color: ColorConstants.brown),
      centerTitle: true,
      backgroundColor: Colors.white,
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontSize: 18,
        fontWeight: FontWeight.w500,
        fontFamily: FontConstants.fontFamily,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorConstants.brown,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: ColorConstants.brown,
        side: const BorderSide(color: ColorConstants.brown, width: 1),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    ),
  );
}
