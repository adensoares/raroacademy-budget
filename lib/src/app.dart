import 'package:budget/src/modules/home/home_page.dart';
import 'package:budget/src/modules/login/login_page.dart';
import 'package:budget/src/modules/splash/splash_page.dart';
import 'package:budget/src/shared/constants/app_colors.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: AppColors.customMaterialPurple,
      ),
      home: LoginPage(),
    );
  }
}
