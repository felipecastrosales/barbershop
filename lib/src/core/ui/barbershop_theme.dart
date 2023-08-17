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
      labelStyle: const TextStyle(color: ColorConstants.grey),
      filled: true,
      fillColor: Colors.white,
      errorBorder: _defaultInputBorder.copyWith(
        borderSide: const BorderSide(color: ColorConstants.red),
      ),
      focusedBorder: _defaultInputBorder,
      border: _defaultInputBorder,
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
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
      ),
    ),
  );
}
