import 'package:budget/src/modules/login/login/password_page.dart';
import 'package:budget/src/modules/login/login/widgets/facebook_button_widget.dart';
import 'package:budget/src/modules/login/login/widgets/google_button_widget.dart';
import 'package:budget/src/modules/login/login/login_repository.dart';
import 'package:budget/src/shared/auth/auth_controller.dart';
import 'package:budget/src/shared/constants/shared_constants.dart';
import 'package:budget/src/shared/widgets/header_page_login_widget.dart';
import 'package:budget/src/shared/widgets/shared_widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:validatorless/validatorless.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formloginkey = GlobalKey<FormState>();
  final _emailEC = TextEditingController();

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
                        ontap: () {
                          Modular.to.pushNamed("/login/signup");
                        }),
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
                              controler: _emailEC,
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
                                  gradient: AppColors.headerButtonGradient,
                                  borderRadius: 50,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 10,
                                        bottom: 10,
                                        right: 16,
                                        left: 16),
                                    child: Text(
                                      'CONTINUAR',
                                      style: AppTextStyles.white14w500Roboto,
                                    ),
                                  ),
                                  onTap: () async {
                                    var formvalid = _formloginkey.currentState
                                            ?.validate() ??
                                        false;
                                    if (formvalid) {
                                      final loginExisteNoFirebase =
                                          await LoginRepository(
                                                  email: _emailEC.text)
                                              .emailExiste();

                                      if (loginExisteNoFirebase! != true) {
                                        // ScaffoldMessenger.of(context)
                                        //     .showSnackBar(
                                        //   SnackBar(
                                        //     content: Text('Login não existe!'),
                                        //   ),
                                        // );
                                        showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return AlertDialog(
                                                title: Text("Atenção"),
                                                content: Text(
                                                    "E-mail não encontrado"),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () {
                                                      Modular.to.pop();
                                                    },
                                                    child: Text("Fechar"),
                                                  ),
                                                ],
                                              );
                                            });
                                      } else
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (_) => PasswordPage(
                                                  email: _emailEC.text)),
                                        );
                                      print(_emailEC.text);
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
                      ButtonGoogleWidget(
                        onPressed: () {
                          Modular.get<AuthController>()
                              .signInWithGoogle()
                              .then((value) => print('Funcionou'));
                        },
                      ),
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
