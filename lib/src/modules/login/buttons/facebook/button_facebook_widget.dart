import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:budget/src/modules/home/home_page.dart';
import 'package:budget/src/modules/login/buttons/facebook/facebook_repository.dart';
import 'package:budget/src/shared/constants/app_text_styles.dart';

class ButtonFacebookWidget extends StatelessWidget {
  final Future Function() onpressed;
  const ButtonFacebookWidget({
    Key? key,
    required this.onpressed,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          side: BorderSide(color: Colors.grey, width: 1),
          elevation: 0.0,
          primary: Color(0xFF3A5B96),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0))),
      onPressed: onpressed,
      child: Padding(
        padding: const EdgeInsets.only(top: 7, bottom: 7, left: 24, right: 24),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Image.asset(
                'assets/images/botoes/facebook_logo_button.png',
              ),
            ),
            Text(
              'CONTINUAR COM O FACEBOOK',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.15),
            )
          ],
        ),
      ),
    );
  }
}
