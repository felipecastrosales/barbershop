import 'package:barbershop/src/core/constants/constants.dart';
import 'package:flutter/material.dart';

const _defaultInputBorder = OutlineInputBorder(
  borderSide: BorderSide(color: AppColors.grey),
  borderRadius: BorderRadius.all(Radius.circular(8)),
);

sealed class BarbershopTheme {
  static ThemeData themeData = ThemeData(
    useMaterial3: true,
    fontFamily: AppFonts.fontFamily,
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      border: _defaultInputBorder,
      labelStyle: const TextStyle(color: AppColors.grey),
      focusedBorder: _defaultInputBorder,
      errorBorder: _defaultInputBorder.copyWith(
        borderSide: const BorderSide(color: AppColors.red),
      ),
    ),
    appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(color: AppColors.brown),
      centerTitle: true,
      backgroundColor: Colors.white,
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontSize: 18,
        fontWeight: FontWeight.w500,
        fontFamily: AppFonts.fontFamily,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.brown,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: AppColors.brown,
        side: const BorderSide(color: AppColors.brown, width: 1),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    ),
  );
}
