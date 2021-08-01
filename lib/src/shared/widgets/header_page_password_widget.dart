import 'package:budget/src/shared/constants/app_text_styles.dart';
import 'package:flutter/material.dart';

class HeaderPagePasswordWidget extends StatelessWidget {
  HeaderPagePasswordWidget({
    Key? key,
    required this.text,
    required this.text1,
  }) : super(key: key);
  final String text;
  final String text1;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset('assets/images/budget_logo_login_page.png'),
            SizedBox(
              height: 16.15,
            ),
            Text(
              text,
              style: AppTextStyles.cyan48w400Roboto,
            ),
          ],
        ),
      ),
    );
  }
}
