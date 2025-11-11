import 'package:flutter/material.dart';

class TerracottaColors {
  static const Color orange = Color(0xFFED6745);
  static const Color cream = Color(0xFFF9F9E7);
  static const Color peach = Color(0xFFF9D6A4);
  static const Color darkCharcoal = Color(0xFF36302B);

  static const Color error = Color(0xFFBC3728);
  static const Color success = Color(0xFF7D9B76);
  static const Color info = Color(0xFF6A8EA0);
  static const Color warn = Color(0xFFE39E54);
}

ColorScheme getColorScheme(Brightness brightness) {
  return ColorScheme.fromSeed(
    seedColor: TerracottaColors.orange,
    brightness: brightness,
    primary: TerracottaColors.orange,
    onPrimary: TerracottaColors.cream,
    secondary: TerracottaColors.peach,
    onSecondary: TerracottaColors.darkCharcoal,
    surface: TerracottaColors.peach,
    onSurface: TerracottaColors.darkCharcoal,
    error: TerracottaColors.error,
    onError: Colors.white,
  );
}