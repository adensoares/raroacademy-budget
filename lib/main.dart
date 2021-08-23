import 'package:budget/firebase_app.dart';
import 'package:budget/src/app.dart';
import 'package:budget/src/app_module.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  runApp(
    ModularApp(
      module: AppModule(),
      child: FirebaseWidget(),
    ),
  );
}
