import 'package:budget/src/modules/login/buttons/facebook/button_facebook_widget.dart';
import 'package:budget/src/modules/login/buttons/google/button_google_widget.dart';
import 'package:budget/src/shared/constants/app_colors.dart';
import 'package:budget/src/shared/constants/app_text_styles.dart';
import 'package:budget/src/shared/widgets/button_widget.dart';
import 'package:budget/src/shared/widgets/custom_text_form_field_widget.dart';
import 'package:budget/src/shared/widgets/header_page_login_widget.dart';
import 'package:flutter/material.dart';
import 'package:validatorless/validatorless.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formloginkey = GlobalKey<FormState>();
  final emailEC = TextEditingController();

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
                  top: 74, bottom: 32, left: 45, right: 48),
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
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Form(
                        key: _formloginkey,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CustomTextFormField(
                              obscureText: false,
                              controler: emailEC,
                              validator: Validatorless.multiple([
                                Validatorless.email('email inválido'),
                                Validatorless.required('campo requerido!')
                              ]),
                              labelText: 'Email',
                              hintText: 'insira seu email',
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            Align(
                                alignment: Alignment.centerRight,
                                child: ButtonWidget(
                                  color: Colors.grey,
                                  borderRadius: 10,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 10,
                                        bottom: 10,
                                        right: 16,
                                        left: 16),
                                    child: Text(
                                      'Continuar',
                                      style: AppTextStyles.gray16w400Roboto,
                                    ),
                                  ),
                                  onTap: () {
                                    var formvalid = _formloginkey.currentState
                                            ?.validate() ??
                                        false;
                                    if (formvalid) {
                                      // * chamar a controler para tratar os dados

                                    }
                                  },
                                )),
                          ],
                        ),
                      ),
                    ],
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