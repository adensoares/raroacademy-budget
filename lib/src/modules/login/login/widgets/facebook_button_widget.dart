import 'package:budget/src/shared/constants/app_text_styles.dart';
import 'package:flutter/material.dart';

class ButtonFacebookWidget extends StatelessWidget {
  ButtonFacebookWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          side: BorderSide(color: Colors.grey, width: 1),
          elevation: 0.0,
          primary: Color(0xFF3A5B96),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0))),
      onPressed: () {},
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
