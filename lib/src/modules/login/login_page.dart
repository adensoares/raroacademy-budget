import 'package:budget/src/modules/login/buttons/facebook/button_facebook_widget.dart';
import 'package:budget/src/modules/login/buttons/google/button_google_widget.dart';
import 'package:budget/src/shared/constants/app_text_styles.dart';
import 'package:budget/src/shared/widgets/button_widget.dart';
import 'package:budget/src/shared/widgets/custom_text_form_field.dart';
import 'package:budget/src/shared/widgets/header_page_login_widget.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 115, bottom: 32, left: 45, right: 48),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 251,
                    child: HeaderPageLoginWidget(
                        text: 'Vamos\ncomeçar!',
                        text1: 'Novo usuário? ',
                        text2: 'Crie uma conta',
                        ontap: () {}),
                  ),
                  SizedBox(height: 64),
                  CustomTextFormField(
                    labelText: 'Email',
                    hintText: 'insira seu email',
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: ButtonWidget(
                      borderRadius: 34,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 10, bottom: 10, right: 16, left: 16),
                        child: Text('Continuar'),
                      ),
                      onTap: () {},
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(
                    height: 52,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'ou',
                        style: AppTextStyles.gray16w400Roboto,
                      ),
                      ButtonGoogleWidget(),
                      ButtonFacebookWidget(),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
