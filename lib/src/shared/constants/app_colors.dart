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

  static const splashGradient = LinearGradient(
      colors: [
        cyan,
        purple,
      ],
      begin: Alignment.topLeft,
      end: Alignment(0.8, 0.0),
      transform: GradientRotation(345 * pi / 180));
}
