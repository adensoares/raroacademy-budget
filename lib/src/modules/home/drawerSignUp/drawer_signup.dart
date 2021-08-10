import 'package:budget/src/shared/constants/app_colors.dart';
import 'package:budget/src/shared/constants/shared_constants.dart';
import 'package:budget/src/shared/widgets/appbar/simple_appbar_widget.dart';

import 'package:budget/src/shared/widgets/shared_widgets.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:validatorless/validatorless.dart';

class DrawerSignup extends StatefulWidget {
  DrawerSignup({Key? key}) : super(key: key);

  @override
  _DrawerSignupState createState() => _DrawerSignupState();
}

class _DrawerSignupState extends State<DrawerSignup> {
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
        gradient: AppColors.splashGradient,
        title: 'Cadastro',
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
                                obscureText: false,
                                keyboardType: TextInputType.name,
                                labelText: 'Nome',
                              ),
                              CustomTextFormField(
                                inputformatter: [_maskformaterCPF],
                                obscureText: false,
                                keyboardType: TextInputType.number,
                                labelText: 'CPF',
                                validator: Validatorless.cpf('Valor inválido'),
                              ),
                              CustomTextFormField(
                                  obscureText: false,
                                  keyboardType: TextInputType.emailAddress,
                                  labelText: 'E-mail',
                                  validator: Validatorless.multiple([
                                    Validatorless.email('email inválido'),
                                  ])),
                              CustomTextFormField(
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
        backgroundColor: AppColors.gray,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      resizeToAvoidBottomInset: false,
    );
  }
}
