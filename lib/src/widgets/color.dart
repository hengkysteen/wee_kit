import 'package:flutter/material.dart';

class WeeColor {
  static Color primary(BuildContext context) {
    final theme = Theme.of(context);
    if (theme.useMaterial3) {
      return theme.colorScheme.primary;
    } else {
      if (theme.brightness == Brightness.dark) {
        return theme.primaryColorDark;
      } else {
        return theme.primaryColor;
      }
    }
  }

  static MaterialColor toMaterialColor(Color color) {
    List strengths = <double>[.05];
    final swatch = <int, Color>{};
    final int r = color.red, g = color.green, b = color.blue;
    for (int i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }
    strengths.forEach((strength) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    });
    return MaterialColor(color.value, swatch);
  }

  static Color shadeColor(Color color, int shade) {
    assert(shade >= 0 && shade <= 100, 'The shade argument must be a number between 0 and 100.');
    final percent = shade / 100;
    final f = 1 - (percent * 0.5);
    return Color.fromRGBO(
      (color.red + ((255 - color.red) * f)).round(),
      (color.green + ((255 - color.green) * f)).round(),
      (color.blue + ((255 - color.blue) * f)).round(),
      1,
    );
  }
}
