import 'dart:math';

import 'package:flutter/material.dart';

class AppColors {
  static const Color cyan = Color.fromRGBO(68, 194, 253, 1);
  static const Color lilac = Color.fromRGBO(162, 158, 255, 1);
  static const Color purple = Color.fromRGBO(52, 48, 144, 1);
  static const Color green = Color.fromRGBO(88, 179, 104, 1);
  static const Color pink = Color.fromRGBO(245, 72, 127, 1);
  static const Color yellow = Color.fromRGBO(250, 199, 54, 1);
  static const Color black = Color.fromRGBO(0, 0, 0, 0.87);
  static const Color gray = Color.fromRGBO(0, 0, 0, 0.54);
  static const Color lightGray = Color.fromRGBO(196, 196, 196, 1);
  static const Color red = Color.fromRGBO(244, 67, 54, 1);
  static const Color grayCardBackgorund = Color.fromRGBO(253, 253, 253, 1);

// Purple in MaterialColor
  static const MaterialColor customMaterialPurple = MaterialColor(
    0xFF181861,
    <int, Color>{
      50: Color.fromRGBO(52, 48, 144, .1),
      100: Color.fromRGBO(52, 48, 144, .2),
      200: Color.fromRGBO(52, 48, 144, .3),
      300: Color.fromRGBO(52, 48, 144, .4),
      400: Color.fromRGBO(52, 48, 144, .5),
      500: Color.fromRGBO(52, 48, 144, .6),
      600: Color.fromRGBO(52, 48, 144, .7),
      700: Color.fromRGBO(52, 48, 144, .8),
      800: Color.fromRGBO(52, 48, 144, .9),
      900: Color.fromRGBO(52, 48, 144, 1),
    },
  );

  static const splashGradient = LinearGradient(
      colors: [
        cyan,
        purple,
      ],
      begin: Alignment.topLeft,
      end: Alignment(0.8, 0.0),
      transform: GradientRotation(345 * pi / 180));

  static const headerButtonGradient = LinearGradient(
    colors: [
      cyan,
      purple,
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    stops: [
      0.0,
      0.6,
    ],
    transform: GradientRotation((-305 * pi) / 180),
  );

  static const circleButtonGradient = LinearGradient(
    colors: [
      cyan,
      purple,
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    stops: [
      0.0,
      0.6,
    ],
    transform: GradientRotation((305 * pi) / 180),
  );
}
