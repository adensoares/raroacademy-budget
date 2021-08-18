import 'dart:async';

import 'package:budget/src/modules/expenses/expenses_page.dart';
import 'package:budget/src/modules/home/drawerSignUp/drawer_signup.dart';
import 'package:budget/src/modules/home/home_page.dart';
import 'package:budget/src/modules/incomes/incomes_page.dart';
import 'package:budget/src/modules/login/login_page.dart';
import 'package:budget/src/modules/login/password_page.dart';
import 'package:budget/src/modules/signup/signup_page.dart';
import 'package:budget/src/modules/splash/splash_page.dart';
import 'package:budget/src/shared/constants/app_colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class App extends StatefulWidget {
  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: AppColors.customMaterialPurple,
      ),
      home: DrawerSignup(),
    );
  }
}
