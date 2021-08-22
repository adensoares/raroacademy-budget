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
  final _formkey = GlobalKey<FormState>();
  final _maskformaterCPF = MaskTextInputFormatter(
      mask: '###.###.###-##', filter: {'#': RegExp(r'[0-9]')});
  final _maskformaterNumber = MaskTextInputFormatter(
      mask: '(###) #####-####', filter: {'#': RegExp(r'[0-9]')});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SimpleAppbar(
        expanded: true,
        gradient: AppColors.headerButtonGradient,
        title: 'Cadastro',
        child: IconButton(
          onPressed: () => Modular.to.navigate('/home'),
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
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
                                initialvalue:
                                    '${Modular.get<AuthController>().user?.name}',
                                obscureText: false,
                                keyboardType: TextInputType.name,
                                labelText: 'Nome',
                              ),
                              CustomTextFormField(
                                initialvalue:
                                    '${Modular.get<AuthController>().user?.cpf}',
                                inputformatter: [_maskformaterCPF],
                                obscureText: false,
                                keyboardType: TextInputType.number,
                                labelText: 'CPF',
                                validator: Validatorless.cpf('Valor inválido'),
                              ),
                              CustomTextFormField(
                                  initialvalue:
                                      '${Modular.get<AuthController>().user?.email}',
                                  obscureText: false,
                                  keyboardType: TextInputType.emailAddress,
                                  labelText: 'E-mail',
                                  validator: Validatorless.multiple([
                                    Validatorless.email('email inválido'),
                                  ])),
                              CustomTextFormField(
                                initialvalue:
                                    '${Modular.get<AuthController>().user?.phone}',
                                inputformatter: [_maskformaterNumber],
                                obscureText: false,
                                keyboardType: TextInputType.number,
                                labelText: 'Celular',
                                helperText: 'numero com ddd (exemplo: 071)',
                                validator:
                                    Validatorless.number('numero inválido'),
                              ),
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
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          if (_formkey.currentState!.validate()) {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('alterações feitas com sucesso!')));
          }
        },
        label: Text('SALVAR ALTERAÇÕES'),
        backgroundColor: AppColors.purple,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      resizeToAvoidBottomInset: false,
    );
  }
}
