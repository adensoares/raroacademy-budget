import 'package:budget/src/modules/home/drawerSignup/drawer_signup_repository.dart';
import 'package:budget/src/shared/auth/auth_controller.dart';
import 'package:budget/src/shared/auth/auth_repository.dart';
import 'package:budget/src/shared/constants/app_colors.dart';
import 'package:budget/src/shared/constants/shared_constants.dart';
import 'package:budget/src/shared/widgets/appbar/simple_appbar_widget.dart';

import 'package:budget/src/shared/widgets/shared_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:validatorless/validatorless.dart';

class DrawerSignupPage extends StatefulWidget {
  DrawerSignupPage({Key? key}) : super(key: key);

  @override
  _DrawerSignupPageState createState() => _DrawerSignupPageState();
}

class _DrawerSignupPageState extends State<DrawerSignupPage> {
  final nameEC = TextEditingController(
      text: '${Modular.get<AuthController>().user?.name}');
  final emailEC = TextEditingController(
      text: '${Modular.get<AuthController>().user?.email}');
  final phoneNumberEC = TextEditingController();
  final cpfEC =
      TextEditingController(text: '${Modular.get<AuthController>().user?.cpf}');

  final _formkey = GlobalKey<FormState>();
  final _maskformaterCPF = MaskTextInputFormatter(
      mask: '###.###.###-##', filter: {'#': RegExp(r'[0-9]')});
  final _maskformaterNumber = MaskTextInputFormatter(
      mask: '(###) #####-####', filter: {'#': RegExp(r'[0-9]')});

  @override
  void dispose() {
    nameEC.dispose();
    emailEC.dispose();
    phoneNumberEC.dispose();
    cpfEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SimpleAppbar(
        expanded: true,
        gradient: AppColors.headerButtonGradient,
        title: 'Cadastro',
        child: IconButton(
          onPressed: () {
            Modular.to.pop();
            Modular.to.pop();
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
      ),
      body: WillPopScope(
        onWillPop: () async {
          if (Modular.to.canPop()) {
            print("CanPop");
            Modular.to.pop();
            Modular.to.pop();
            return false;
          }
          print("CanNotPop");
          return true;
        },
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    top: 16, left: 16, right: 16, bottom: 40),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 35, bottom: 102, right: 40, left: 40),
                      child: Form(
                          key: _formkey,
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                CustomTextFormField(
                                  controler: nameEC,
                                  obscureText: false,
                                  keyboardType: TextInputType.name,
                                  labelText: 'Nome',
                                ),
                                CustomTextFormField(
                                  enabled: false,
                                  controler: cpfEC,
                                  inputformatter: [_maskformaterCPF],
                                  obscureText: false,
                                  keyboardType: TextInputType.number,
                                  labelText: 'CPF',
                                  validator:
                                      Validatorless.cpf('Valor inv??lido'),
                                ),
                                CustomTextFormField(
                                    controler: emailEC,
                                    obscureText: false,
                                    keyboardType: TextInputType.emailAddress,
                                    labelText: 'E-mail',
                                    validator: Validatorless.multiple([
                                      Validatorless.email('E-mail inv??lido'),
                                    ])),
                                CustomTextFormField(
                                    controler: phoneNumberEC,
                                    inputformatter: [_maskformaterNumber],
                                    obscureText: false,
                                    keyboardType: TextInputType.number,
                                    labelText: 'Celular',
                                    helperText: 'Numero com ddd (exemplo: 071)',
                                    validator: Validatorless.min(
                                        16, 'numero muito pequeno')),
                              ],
                            ),
                          )),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          if (_formkey.currentState!.validate()) {
            DrawerSignupRepository(
                    name: nameEC,
                    cpf: cpfEC,
                    phoneNumber: phoneNumberEC,
                    email: emailEC)
                .changeFiles();
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Altera????es feitas com sucesso!')));
          }
        },
        label: Text('SALVAR ALTERA????ES'),
        backgroundColor: AppColors.purple,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      resizeToAvoidBottomInset: false,
    );
  }
}
