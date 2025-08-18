import 'package:flutter/material.dart';
import 'package:house_finder/common/models/color_model.dart';

class AppColors {
  AppColors._();

  static ColorModel backgroundColor = ColorModel(
    darkModeColor: Colors.black,
    lightModeColor: const Color(0xFFFCFCFC),
  );

  static ColorModel cardColor = ColorModel(
    darkModeColor: const Color(0xFF1F1F1F),
    lightModeColor: const Color(0xFFFAFAFA),
  );

  static ColorModel btnColor = ColorModel(
    darkModeColor: const Color.fromARGB(255, 57, 57, 57),
    lightModeColor: Colors.red,
  );

  static ColorModel btnTextColor = ColorModel(
    darkModeColor: Colors.white,
    lightModeColor: Colors.black,
  );

  static ColorModel buttonColor = ColorModel(
    lightModeColor: const Color(0xFFE0BBFF), // Violet 100 - light violet
    darkModeColor: const Color(0xFF9B59B6), // Darker violet for dark mode
  );

  static ColorModel containerBorderColor = ColorModel(
    darkModeColor: Colors.white,
    lightModeColor: Colors.grey,
  );
  static ColorModel profileBoxColor = ColorModel(
    darkModeColor: Colors.black,
    lightModeColor: Colors.white,
  );
  static ColorModel profileIconColor = ColorModel(
    darkModeColor: Colors.white,
    lightModeColor: Colors.grey,
  );
  static ColorModel profileTextColor = ColorModel(
    darkModeColor: Colors.white,
    lightModeColor: Colors.black,
  );
}

extension ThemeContextExtension on BuildContext {
  bool get isDark => Theme.of(this).brightness == Brightness.dark;
}

Color getColorByTheme({
  required BuildContext context,
  required ColorModel? colorClass,
  Color fallbackLight = Colors.black,
  Color fallbackDark = Colors.white,
}) {
  final isDark = context.isDark;
  if (colorClass == null) return isDark ? fallbackDark : fallbackLight;
  return isDark ? colorClass.darkModeColor : colorClass.lightModeColor;
}
