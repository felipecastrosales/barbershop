import 'package:flutter/material.dart';

sealed class ColorConstants {
  static const brown = Color(0xFFB07B01);
  static const grey = Color(0xFF999999);
  static const lightGrey = Color(0xFFE6E2E9);
  static const red = Color(0xFFEB1212);
}

sealed class FontConstants {
  static const String fontFamily = 'Poppins';
}

sealed class ImageConstants {
  static const backgroundChair = 'assets/images/background_image_chair.jpg';
  static const imgLogo = 'assets/images/imgLogo.png';
  static const avatar = 'assets/images/avatar.png';
}
