import 'package:flutter/material.dart';

extension FormExtension on BuildContext {
  void unfocus() => FocusScope.of(this).unfocus();
}
