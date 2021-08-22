import 'package:budget/src/modules/home/home_page.dart';
import 'package:budget/src/modules/login/login/login_repository.dart';
import 'package:budget/src/modules/login/login/widgets/toggle_visibility_widget.dart';
import 'package:budget/src/shared/constants/app_colors.dart';
import 'package:budget/src/shared/constants/app_text_styles.dart';
import 'package:budget/src/shared/widgets/button_widget.dart';
import 'package:budget/src/shared/widgets/custom_text_form_field_widget.dart';
import 'package:budget/src/shared/widgets/header_page_login_widget.dart';
import 'package:budget/src/shared/widgets/header_page_password_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
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
  bool hidePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: () async {
          if (Modular.to.canPop()) {
            print("CanPop");
            Modular.to.pop();
            return false;
          }
          print("CanNotPop");
          return true;
        },
        child: SingleChildScrollView(
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
                                  Validatorless.required('Campo requerido!')
                                ]),
                                labelText: 'Email',
                                hintText: 'insira seu email',
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              CustomTextFormField(
                                obscureText: hidePassword,
                                controler: _passwordEC,
                                suffixIcon: ToggleVisibility(
                                  visible: hidePassword,
                                  onPressed: () {
                                    setState(() {
                                      hidePassword = !hidePassword;
                                    });
                                  },
                                ),
                                validator:
                                    Validatorless.required('Campo obrigatório'),
                                labelText: 'Senha',
                              ),
                              SizedBox(
                                height: 26,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Modular.to.navigate("/login");
                                    },
                                    child: Text(
                                      'RECUPERAR SENHA',
                                      style: AppTextStyles.purple14w500Roboto,
                                    ),
                                  ),
                                  ButtonWidget(
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
                                      bool validado = _formloginWithPasswordkey
                                          .currentState!
                                          .validate();
                                      if (validado) {
                                        LoginRepository(
                                          email: _emailEC,
                                          password: _passwordEC,
                                        ).logar().then(
                                              (value) => {
                                                if (value)
                                                  {
                                                    Modular.to
                                                        .navigate("/home"),
                                                  }
                                                else
                                                  {
                                                    print(value),
                                                    showDialog(
                                                        context: context,
                                                        builder: (BuildContext
                                                            context) {
                                                          return AlertDialog(
                                                            title:
                                                                Text("Atenção"),
                                                            content: Text(
                                                                "E-mail ou senha incorretos"),
                                                            actions: [
                                                              TextButton(
                                                                onPressed: () {
                                                                  Modular.to
                                                                      .pop();
                                                                },
                                                                child: Text(
                                                                    "Fechar"),
                                                              ),
                                                            ],
                                                          );
                                                        })
                                                  }
                                              },
                                            );
                                      }

                                      // if (formvalid) {
                                      //   final senhaExisteNoFirebase =
                                      //       await LoginRepository(
                                      //               password: _passwordEC)
                                      //           .senhaExiste();
                                      //   if (senhaExisteNoFirebase != true) {
                                      //     ScaffoldMessenger.of(context)
                                      //         .showSnackBar(
                                      //       SnackBar(
                                      //         content: Text('Senha incorreta!'),
                                      //       ),
                                      //     );
                                      //   } else
                                      //     ScaffoldMessenger.of(context)
                                      //         .showSnackBar(
                                      //       SnackBar(
                                      //         content: Text(
                                      //             'Login feito com sucesso!'),
                                      //       ),
                                      //     );
                                      //   Modular.to.navigate("/home");
                                      // }
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
      ),
    );
  }
}
