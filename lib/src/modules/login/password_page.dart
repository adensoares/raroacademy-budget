import 'package:budget/src/modules/home/home_page.dart';
import 'package:budget/src/modules/login/login_page.dart';
import 'package:budget/src/modules/login/login_repository.dart';
import 'package:budget/src/shared/constants/app_text_styles.dart';
import 'package:budget/src/shared/widgets/button_widget.dart';
import 'package:budget/src/shared/widgets/custom_text_form_field_widget.dart';
import 'package:budget/src/shared/widgets/header_page_login_widget.dart';
import 'package:budget/src/shared/widgets/header_page_password_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:validatorless/validatorless.dart';

class PasswordPage extends StatefulWidget {
  PasswordPage({Key? key}) : super(key: key);

  @override
  _PasswordPageState createState() => _PasswordPageState();
}

class _PasswordPageState extends State<PasswordPage> {
  final _formloginWithPasswordkey = GlobalKey<FormState>();
  final _emailEC = TextEditingController();
  final _passwordEC = TextEditingController();
  LoginPage loginpage = LoginPage();

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
                    child: HeaderPagePasswordWidget(
                      text: 'Insira sua\nsenha',
                    ),
                  ),
                  SizedBox(height: 64),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Form(
                        key: _formloginWithPasswordkey,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CustomTextFormField(
                              obscureText: false,
                              controler: _emailEC,
                              keyboardType: TextInputType.emailAddress,
                              validator: Validatorless.multiple([
                                Validatorless.email('email inválido'),
                                Validatorless.required('campo requerido!')
                              ]),
                              labelText: 'Email',
                              hintText: 'insira seu email',
                            ),
                            SizedBox(
                              height: 28,
                            ),
                            CustomTextFormField(
                              obscureText: true,
                              controler: _passwordEC,
                              validator:
                                  Validatorless.required('campo obrigatório'),
                              labelText: 'Senha',
                            ),
                            SizedBox(
                              height: 26,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  onTap: () {},
                                  child: Text(
                                    'RECUPERAR SENHA',
                                    style: AppTextStyles.purple14w500Roboto,
                                  ),
                                ),
                                ButtonWidget(
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
                                  onTap: () async {
                                    try {
                                      var formvalid = _formloginWithPasswordkey
                                              .currentState
                                              ?.validate() ??
                                          false;
                                      if (formvalid) {
                                        final loginExisteNoFirebase =
                                            await LoginRepository(
                                                    email: _emailEC)
                                                .emailExiste();
                                        final senhaExisteNoFirebase =
                                            await LoginRepository(
                                                    password: _passwordEC)
                                                .senhaExiste();
                                        if (senhaExisteNoFirebase != true) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(SnackBar(
                                                  content: Text(
                                                      'senha incorreta!')));
                                        } else if (loginExisteNoFirebase !=
                                            true) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(SnackBar(
                                                  content: Text(
                                                      'Email incorreto!')));
                                        } else {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(SnackBar(
                                                  content: Text(
                                                      'Parabens ! Login feito com sucesso!')));
                                          Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (_) => HomePage()));
                                        }
                                      }
                                    } catch (e) {
                                      Center(child: Text('deu erro'));
                                    }
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 52,
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
