import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

extension Messages on BuildContext {
  void showError(String message) =>
      _showCommonSnackBar(CustomSnackBar.error(message: message));

  void showSuccess(String message) =>
      _showCommonSnackBar(CustomSnackBar.success(message: message));

  void showInfo(String message) =>
      _showCommonSnackBar(CustomSnackBar.info(message: message));

  void _showCommonSnackBar(Widget child) =>
      showTopSnackBar(Overlay.of(this), child);
}
