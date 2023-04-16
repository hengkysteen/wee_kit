import 'package:flutter/material.dart' show Color, MaterialColor;

class WeeColor {
  Color color;
  WeeColor(this.color);

  static Color get lavenderBlue => Color(0XFFCCCCFF);
  static Color get duskMauve => Color(0XFF545883);

  /// Converts this [Color] to a [MaterialColor] with shades of the same color.
  ///
  /// The returned [MaterialColor] has the same base color as this [Color],
  /// and includes ten shades of the color, ranging from 50% to 100% opacity.
  ///
  /// For example, to create a [MaterialColor] from `Colors.blue`, you can use
  /// `Colors.blue.toMaterialColor()`.
  ///
  /// Returns a [MaterialColor] object.
  MaterialColor toMaterialColor() {
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

  /// Returns a shade color of the given [color] with the specified [shade].
  ///
  /// The [shade] argument is a number between 0 and 100 that determines the
  /// percentage of shade to apply to the color. A value of 0 indicates no
  /// shade, while a value of 100 indicates complete shade (i.e., black).
  /// Values in between produce varying shades of the original color.
  ///
  /// For example, to get a color that is 30% lighter than `Colors.red`, you can
  /// use `getShadeColor(Colors.red, 30)`, which returns a color that is similar
  /// to `Colors.red.shade300`, but slightly lighter.
  ///
  /// Throws an [AssertionError] if the [shade] argument is not within the valid
  /// range of 0 to 100.
  ///
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
