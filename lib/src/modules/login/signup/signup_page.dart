import 'package:budget/src/modules/login/login/login_page.dart';
import 'package:budget/src/shared/widgets/toggle_visibility_widget.dart';
import 'package:budget/src/modules/login/signup/validator_password.dart';
import 'package:budget/src/modules/login/signup/signup_repository.dart';
import 'package:budget/src/shared/constants/shared_constants.dart';
import 'package:budget/src/shared/widgets/shared_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:validatorless/validatorless.dart';
import 'package:wc_form_validators/wc_form_validators.dart';

enum Terms { accepted }

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final PageController pageController = PageController(initialPage: 0);
  Terms? termsAnswer = Terms.accepted;
  final _signupKeypage1 = GlobalKey<FormState>();
  final _signupKeypage2 = GlobalKey<FormState>();
  final _signupKeypage4 = GlobalKey<FormState>();
  TextEditingController _emailEC = TextEditingController();
  TextEditingController _passwordEC = TextEditingController();
  TextEditingController _nameEC = TextEditingController();
  TextEditingController _cpfEC = TextEditingController();
  TextEditingController _numberEC = TextEditingController();
  bool hidePassword1 = true;
  bool hidePassword2 = true;

  final _maskformaterCPF = MaskTextInputFormatter(
      mask: '###.###.###-##', filter: {'#': RegExp(r'[0-9]')});
  final _maskformaterNumber = MaskTextInputFormatter(
      mask: '(###) #####-####', filter: {'#': RegExp(r'[0-9]')});

  bool aceitou = false;

  @override
  void dispose() {
    _emailEC = TextEditingController();
    _passwordEC = TextEditingController();
    _nameEC = TextEditingController();
    _cpfEC = TextEditingController();
    _numberEC = TextEditingController();
    super.dispose();
  }

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
        child: PageView(
          physics: NeverScrollableScrollPhysics(),
          scrollDirection: Axis.horizontal,
          controller: pageController,
          children: [
            SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      flex: 3,
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: 74,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 45.0,
                              ),
                              child: Row(
                                children: [
                                  HeaderPageSignupWidget(
                                    text: 'Bem-vindo!',
                                    text1:
                                        'Por favor insira seus dados\nnos campos abaixo.',
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 4,
                      child: Padding(
                        padding: const EdgeInsets.all(48.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Form(
                                key: _signupKeypage1,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    CustomTextFormField(
                                      controler: _nameEC,
                                      labelText: "Nome",
                                      obscureText: false,
                                      validator: Validatorless.multiple([
                                        Validatorless.max(
                                            25, 'numero muito grande'),
                                        Validatorless.required(
                                            'campo obrigatório'),
                                      ]),
                                    ),
                                    SizedBox(
                                      height: 24,
                                    ),
                                    CustomTextFormField(
                                      controler: _emailEC,
                                      labelText: "E-mail",
                                      obscureText: false,
                                      validator: Validatorless.multiple([
                                        Validatorless.email('email inválido'),
                                        Validatorless.required(
                                            'campo obrigatório'),
                                      ]),
                                    ),
                                  ],
                                ))
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ButtonWidget(
                              borderRadius: 20.0,
                              height: 35,
                              width: 100,
                              child: Text(
                                "Voltar",
                                style: AppTextStyles.gray16w400Roboto,
                              ),
                              onTap: () {
                                Modular.to.navigate("/login");
                              },
                              prefixIcon: Icon(
                                Icons.arrow_back,
                                color: AppColors.gray,
                              ),
                            ),
                            Text("1/4"),
                            ButtonWidget(
                              borderRadius: 20.0,
                              height: 35,
                              width: 120,
                              gradient: AppColors.headerButtonGradient,
                              child: Text("Continuar",
                                  style: AppTextStyles.white14w500Roboto),
                              posfixIcon: Icon(
                                Icons.arrow_forward,
                                color: Colors.white,
                              ),
                              onTap: () async {
                                if (_signupKeypage1.currentState!.validate()) {
                                  final emailJacCadastrado =
                                      await SignupRepository(email: _emailEC)
                                          .emailJacadastrado();
                                  if (emailJacCadastrado != true) {
                                    pageController.nextPage(
                                        duration: Duration(milliseconds: 1000),
                                        curve: Curves.ease);
                                  } else
                                    // ScaffoldMessenger.of(context).showSnackBar(
                                    //   SnackBar(
                                    //     content: Text(
                                    //         'Email ja existe! tente outro!'),
                                    //   ),
                                    // );
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: Text("Atenção"),
                                            content: Text(
                                                "Email ja existe! tente outro"),
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
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height,
                child: Padding(
                  padding: const EdgeInsets.only(top: 74.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        flex: 3,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 45.0,
                              ),
                              child: Row(
                                children: [
                                  HeaderPageSignupWidget(
                                    text: 'Bem-vindo!',
                                    text1: 'Mais alguns dados.',
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Flexible(
                        flex: 4,
                        child: Padding(
                          padding: const EdgeInsets.all(48.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Form(
                                  key: _signupKeypage2,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      CustomTextFormField(
                                        controler: _numberEC,
                                        inputformatter: [_maskformaterNumber],
                                        keyboardType: TextInputType.number,
                                        labelText: "Telefone",
                                        helperText:
                                            'telefone com ddd (exemplo : 071)',
                                        obscureText: false,
                                        validator: Validatorless.multiple([
                                          Validatorless.min(
                                              16, 'Numero muito pequeno'),
                                          Validatorless.required(
                                              'campo obrigatório'),
                                        ]),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      CustomTextFormField(
                                        controler: _cpfEC,
                                        keyboardType: TextInputType.number,
                                        inputformatter: [_maskformaterCPF],
                                        labelText: "CPF",
                                        obscureText: false,
                                        validator: Validatorless.multiple([
                                          Validatorless.cpf('número incorreto'),
                                          Validatorless.required(
                                              'campo obrigatório'),
                                        ]),
                                        helperText:
                                            "O CPF é necessário para conectar suas contas",
                                      ),
                                    ],
                                  ))
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              ButtonWidget(
                                borderRadius: 20.0,
                                height: 35,
                                width: 100,
                                child: Text(
                                  "Voltar",
                                  style: AppTextStyles.gray16w400Roboto,
                                ),
                                onTap: () {
                                  pageController.previousPage(
                                      duration: Duration(milliseconds: 1000),
                                      curve: Curves.ease);
                                },
                                prefixIcon: Icon(
                                  Icons.arrow_back,
                                  color: AppColors.gray,
                                ),
                              ),
                              Text("2/4"),
                              ButtonWidget(
                                borderRadius: 20.0,
                                height: 35,
                                width: 120,
                                gradient: AppColors.headerButtonGradient,
                                child: Text("Continuar",
                                    style: AppTextStyles.white14w500Roboto),
                                posfixIcon: Icon(
                                  Icons.arrow_forward,
                                  color: Colors.white,
                                ),
                                onTap: () {
                                  if (_signupKeypage2.currentState!
                                      .validate()) {
                                    pageController.nextPage(
                                        duration: Duration(milliseconds: 1000),
                                        curve: Curves.ease);
                                  }
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      flex: 3,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 74.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 45.0,
                              ),
                              child: Row(
                                children: [
                                  HeaderPageSignupWidget(
                                    text: 'Bem-vindo!',
                                    text1: 'Leia com atenção e aceite.',
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 4,
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 27.0,
                          right: 22,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              "Lorem Ipsum neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit. Ipsum neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit. Nque porro est qui dolorem ipsum quia dolor sit amet, , adipisci velit. Quisquam est qui dolorem ipsum.",
                              style: AppTextStyles.gray16w400Roboto,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 24.0,
                              ),
                              child: Row(
                                children: [
                                  Checkbox(
                                    value: aceitou,
                                    shape: CircleBorder(),
                                    onChanged: (bool? value) {
                                      setState(() {
                                        aceitou = value!;
                                      });
                                    },
                                  ),
                                  Text(
                                    'Eu li e aceito os termos e condições\ne a Política de privacidade do budget.',
                                    style: AppTextStyles.gray16w400Roboto,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ButtonWidget(
                              borderRadius: 20.0,
                              height: 35,
                              width: 100,
                              child: Text(
                                "Voltar",
                                style: AppTextStyles.gray16w400Roboto,
                              ),
                              onTap: () {
                                pageController.previousPage(
                                    duration: Duration(milliseconds: 1000),
                                    curve: Curves.ease);
                              },
                              prefixIcon: Icon(
                                Icons.arrow_back,
                                color: AppColors.gray,
                              ),
                            ),
                            Text("3/4"),
                            ButtonWidget(
                              borderRadius: 20.0,
                              height: 35,
                              width: 120,
                              gradient: AppColors.headerButtonGradient,
                              child: Text("Continuar",
                                  style: AppTextStyles.white14w500Roboto),
                              posfixIcon: Icon(
                                Icons.arrow_forward,
                                color: Colors.white,
                              ),
                              onTap: () {
                                if (aceitou) {
                                  pageController.nextPage(
                                      duration: Duration(milliseconds: 1000),
                                      curve: Curves.ease);
                                } else {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    content: Text('Termos obrigatórios'),
                                    duration: Duration(seconds: 2),
                                  ));
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      flex: 3,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 45.0),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 74.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  HeaderPageSignupWidget(
                                    text: 'Bem-vindo!',
                                    text1: 'Agora crie sua senha contendo:',
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 45.0,
                          right: 45.0,
                          top: 29,
                        ),
                        child: Wrap(
                          children: [
                            Text(
                              "\u2022 Pelo menos oito caracteres\n\u2022 Letras maiúsculas, letras minúsculas, números e símbolos",
                              style: AppTextStyles.gray16w400Roboto,
                            )
                          ],
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 3,
                      child: Padding(
                        padding: const EdgeInsets.all(48.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Form(
                                key: _signupKeypage4,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    CustomTextFormField(
                                      controler: _passwordEC,
                                      labelText: "Crie uma senha",
                                      obscureText: hidePassword1,
                                      validator: Validators.compose([
                                        Validators.required('Campo requerido!'),
                                        Validators.patternRegExp(
                                            RegExp(
                                                r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$'),
                                            'Senha inválida'),
                                      ]),
                                      suffixIcon: ToggleVisibility(
                                        visible: hidePassword1,
                                        color: AppColors.gray,
                                        onPressed: () {
                                          setState(() {
                                            hidePassword1 = !hidePassword1;
                                          });
                                        },
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    CustomTextFormField(
                                      validator: Validatorless.multiple([
                                        ValidatorPassword.compare(_passwordEC,
                                            'As senhas não são iguais'),
                                      ]),
                                      labelText: "Confirme sua senha",
                                      obscureText: hidePassword2,
                                      suffixIcon: ToggleVisibility(
                                        visible: hidePassword2,
                                        color: AppColors.gray,
                                        onPressed: () {
                                          setState(() {
                                            hidePassword2 = !hidePassword2;
                                          });
                                        },
                                      ),
                                    ),
                                  ],
                                ))
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ButtonWidget(
                              borderRadius: 20.0,
                              height: 35,
                              width: 100,
                              child: Text(
                                "Voltar",
                                style: AppTextStyles.gray16w400Roboto,
                              ),
                              onTap: () {
                                pageController.previousPage(
                                    duration: Duration(milliseconds: 1000),
                                    curve: Curves.ease);
                              },
                              prefixIcon: Icon(
                                Icons.arrow_back,
                                color: AppColors.gray,
                              ),
                            ),
                            Text("4/4"),
                            ButtonWidget(
                              borderRadius: 20.0,
                              height: 35,
                              width: 120,
                              gradient: AppColors.headerButtonGradient,
                              child: Text("Continuar",
                                  style: AppTextStyles.white14w500Roboto),
                              posfixIcon: Icon(
                                Icons.arrow_forward,
                                color: Colors.white,
                              ),
                              onTap: () {
                                var formpage4valid =
                                    _signupKeypage4.currentState!.validate();
                                if (formpage4valid) {
                                  pageController.nextPage(
                                      duration: Duration(milliseconds: 1000),
                                      curve: Curves.ease);
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Stack(
              children: [
                Container(
                  height: double.infinity,
                  width: double.infinity,
                  child: Image.asset(
                    "assets/images/background_onboard_signup.png",
                    fit: BoxFit.cover,
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Center(
                      child: Image.asset(
                        "assets/images/time_line_login_signup.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 45,
                      ),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Agora sim!\nVocê terá o\ncontrole\nfinanceiro nas\nsuas mãos!",
                              style: AppTextStyles.cyan34w700Roboto,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 24,
                                bottom: 40,
                              ),
                              child: ButtonWidget(
                                borderRadius: 20.0,
                                height: 40,
                                width: 120,
                                color: AppColors.cyan,
                                child: Text(
                                  "VAMOS LÁ!",
                                  style: AppTextStyles.white14w500Roboto,
                                ),
                                onTap: () async {
                                  await SignupRepository(
                                    number: _numberEC,
                                    cpf: _cpfEC,
                                    email: _emailEC,
                                    password: _passwordEC,
                                    name: _nameEC,
                                  ).registrar();
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                          'Parabens ${_nameEC.text}, cadastro feito com sucesso!'),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
