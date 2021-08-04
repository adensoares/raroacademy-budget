import 'package:budget/src/modules/login/login_page.dart';
import 'package:budget/src/shared/constants/shared_constants.dart';
import 'package:budget/src/shared/widgets/shared_widgets.dart';
import 'package:flutter/material.dart';

enum Terms { accepted }

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final PageController pageController = PageController(initialPage: 0);
  Terms? termsAnswer = Terms.accepted;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
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
                          CustomTextFormField(
                            labelText: "Nome",
                            obscureText: false,
                          ),
                          CustomTextFormField(
                            labelText: "E-mail",
                            obscureText: false,
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
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      LoginPage(),
                                ),
                              );
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
                            gradient: AppColors.splashGradient,
                            child: Text("Continuar",
                                style: AppTextStyles.white14w500Roboto),
                            posfixIcon: Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                            ),
                            onTap: () {
                              pageController.nextPage(
                                  duration: Duration(milliseconds: 1000),
                                  curve: Curves.ease);
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
                            CustomTextFormField(
                              labelText: "Telefone",
                              obscureText: false,
                            ),
                            CustomTextFormField(
                              labelText: "CPF",
                              obscureText: false,
                              helperText:
                                  "O CPF é necessário para conectar suas contas",
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
                            Text("2/4"),
                            ButtonWidget(
                              borderRadius: 20.0,
                              height: 35,
                              width: 120,
                              gradient: AppColors.splashGradient,
                              child: Text("Continuar",
                                  style: AppTextStyles.white14w500Roboto),
                              posfixIcon: Icon(
                                Icons.arrow_forward,
                                color: Colors.white,
                              ),
                              onTap: () {
                                pageController.nextPage(
                                    duration: Duration(milliseconds: 1000),
                                    curve: Curves.ease);
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
                                Radio(
                                  toggleable: true,
                                  activeColor: AppColors.gray,
                                  value: Terms.accepted,
                                  groupValue: termsAnswer,
                                  onChanged: (Terms? value) {
                                    setState(() {
                                      termsAnswer = value;
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
                            gradient: AppColors.splashGradient,
                            child: Text("Continuar",
                                style: AppTextStyles.white14w500Roboto),
                            posfixIcon: Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                            ),
                            onTap: () {
                              pageController.nextPage(
                                  duration: Duration(milliseconds: 1000),
                                  curve: Curves.ease);
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
                          CustomTextFormField(
                            labelText: "Crie uma senha",
                            obscureText: true,
                          ),
                          CustomTextFormField(
                            labelText: "Confirme sua senha",
                            obscureText: true,
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
                          Text("4/4"),
                          ButtonWidget(
                            borderRadius: 20.0,
                            height: 35,
                            width: 120,
                            gradient: AppColors.splashGradient,
                            child: Text("Continuar",
                                style: AppTextStyles.white14w500Roboto),
                            posfixIcon: Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                            ),
                            onTap: () {
                              pageController.nextPage(
                                  duration: Duration(milliseconds: 1000),
                                  curve: Curves.ease);
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
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        LoginPage(),
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
    );
  }
}
