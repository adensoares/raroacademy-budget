import 'package:flutter/material.dart';

import 'package:budget/src/shared/constants/app_text_styles.dart';

class HeaderPageLoginWidget extends StatelessWidget {
  final String text;
  final String text1;
  final String text2;

  final void Function() ontap;

  const HeaderPageLoginWidget({
    Key? key,
    required this.text,
    required this.text1,
    required this.text2,
    required this.ontap,
  }) : super(key: key);

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
            Row(
              children: [
                Text(
                  text1,
                  style: AppTextStyles.gray16w400Roboto,
                ),
                InkWell(
                  child: Text(
                    text2,
                    style: AppTextStyles.purple16w400Roboto,
                  ),
                  onTap: ontap,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
