import 'package:budget/src/shared/constants/shared_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Budget',
      theme: ThemeData(
        primarySwatch: AppColors.customMaterialPurple,
      ),
      initialRoute: "/",
    ).modular();
  }
}
