import 'package:budget/src/shared/constants/app_text_styles.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class HeaderPagesBudgetWidget extends StatefulWidget {
  HeaderPagesBudgetWidget({Key? key}) : super(key: key);

  @override
  State<HeaderPagesBudgetWidget> createState() =>
      _HeaderPagesBudgetWidgetState();
}

class _HeaderPagesBudgetWidgetState extends State<HeaderPagesBudgetWidget> {
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
              'Vamos\nComeçar!',
              style: AppTextStyles.cyan48w400Roboto,
            ),
            SizedBox(
              height: 8,
            ),
            RichText(
              text: TextSpan(
                children: <TextSpan>[
                  TextSpan(
                    text: 'Novo usuário? ',
                    style: AppTextStyles.gray16w400Roboto,
                  ),
                  TextSpan(
                      text: 'Crie uma conta!',
                      style: AppTextStyles.purple16w400Roboto,
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Container()));
                        }),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
