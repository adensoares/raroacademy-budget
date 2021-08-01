import 'package:flutter/material.dart';

import 'package:budget/src/shared/constants/app_text_styles.dart';

class HeaderPageSignupWidget extends StatelessWidget {
  HeaderPageSignupWidget({
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
            SizedBox(
              height: 8,
            ),
            Container(
              child: Text(
                text1,
                style: AppTextStyles.purple20w500Roboto,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
