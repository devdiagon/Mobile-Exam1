import 'package:flutter/material.dart';
import 'color_schema.dart';

AppBarTheme getAppBarTheme() {
  return const AppBarTheme(
    backgroundColor: TerracottaColors.orange,
    foregroundColor: TerracottaColors.cream,
    elevation: 4.0,
    scrolledUnderElevation: 8.0,
    titleTextStyle: TextStyle(
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
      color: TerracottaColors.cream,
    ),
    iconTheme: IconThemeData(
      color: TerracottaColors.cream,
      size: 24.0,
    ),
    actionsIconTheme: IconThemeData(
      color: TerracottaColors.cream,
      size: 24.0,
    ),
  );
}