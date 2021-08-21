import 'package:animated_card/animated_card.dart';
import 'package:budget/src/shared/constants/app_colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SplashPage extends StatefulWidget {
  SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback((timeStamp) {
      FirebaseAuth.instance.authStateChanges().listen((User? user) {
        if (user == null) {
          print('User is currently signed out!');
          print(user);
          Modular.to.navigate("/login");
        } else {
          print('User is signed in!');
          print(user);
          Modular.to.navigate("/home");
        }
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: AppColors.splashGradient,
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            AnimatedCard(
              direction: AnimatedCardDirection.left,
              duration: Duration(seconds: 2),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                      top: MediaQuery.of(context).size.height / 2 - 108,
                      child: Hero(
                        tag: 'budget_logo_splash',
                        child: Image.asset(
                            'assets/images/logo_budget_splash_page.png'),
                      )),
                ],
              ),
            ),
            AnimatedCard(
                duration: Duration(seconds: 2),
                direction: AnimatedCardDirection.right,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Positioned(
                      bottom: 40,
                      child: Hero(
                        tag: 'logo_raro_splash',
                        child: Image.asset(
                            'assets/images/raro_logo_splash_page.png'),
                      ),
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
    //
  }
}
