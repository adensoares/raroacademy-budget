import 'package:budget/src/modules/home/balance/incomes/incomes_controller.dart';
import 'package:budget/src/shared/constants/dropdown_incomes_type.dart';
import 'package:budget/src/shared/constants/shared_constants.dart';
import 'package:budget/src/shared/models/transaction_model.dart';
import 'package:budget/src/shared/utils/month_to_string.dart';
import 'package:budget/src/shared/auth/auth_controller.dart';
import 'package:budget/src/shared/constants/dropdown_incomes_type.dart';
import 'package:budget/src/shared/constants/shared_constants.dart';
import 'package:budget/src/shared/models/user_model.dart';
import 'package:budget/src/shared/widgets/shared_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:validatorless/validatorless.dart';

class IncomesPage extends StatefulWidget {
  const IncomesPage({Key? key}) : super(key: key);

  @override
  _IncomesPageState createState() => _IncomesPageState();
}

class _IncomesPageState extends State<IncomesPage> {
  DateTime date = DateTime.now();
  String? formattedDate;
  IncomesController controller = IncomesController();
  TransactionModel transaction = TransactionModel(
      userId: "",
      price: 0,
      date: Timestamp.fromDate(DateTime.now()),
      transactionName: "",
      transactionType: "in",
      transactionCategory: "",
      month: monthToString(DateTime.now().month));
  final _formKey = GlobalKey<FormState>();
  TextEditingController incomePriceController = TextEditingController();
  TextEditingController incomeNameController = TextEditingController();

  Future<Null> selectTimePicker(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: date,
        firstDate: DateTime(1940),
        lastDate: DateTime(2099));

    if (picked != null && picked != date) {
      setState(() {
        date = picked;
        formattedDate = DateFormat('dd/MM/yyyy').format(date);
        print(date.toString());
        transaction.date = Timestamp.fromDate(date);
        transaction.month = monthToString(date.month);
      });
    }
  }

  late DropDownIncomesType _value = DropDownIncomesType(
    iconsWidget: IconsWidget(
      icontype: Icons.fastfood,
      containerColor: AppColors.yellow,
      iconcolor: Colors.white,
      size: 24.0,
    ),
    value: "Pix",
  );

  @override
  void initState() {
    super.initState();
    formattedDate = DateFormat('dd/MM/yyyy').format(date);
    _value = list[0];
    transaction.transactionCategory = _value.value;
  }

  @override
  void dispose() {
    incomePriceController.dispose();
    incomeNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SimpleAppbar(
        title: "Entrada",
        gradient: AppColors.headerButtonGradient,
        expanded: true,
        child: IconButton(
          onPressed: () => Modular.to.pop(),
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
      ),
      drawer: CustomDrawer(
        textHeader: 'Olá, ${Modular.get<AuthController>().user?.name}',
      ),
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
          child: Padding(
              padding: const EdgeInsets.only(
                bottom: 40.0,
                left: 16.0,
                right: 16.0,
                top: 16.0,
              ),
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(54.0),
                    child: SingleChildScrollView(
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomTextFormField(
                              controler: incomePriceController,
                              validator: Validatorless.required(
                                  "Preencha com o valor da entrada!"),
                              obscureText: false,
                              labelText: "Valor em R\$",
                              keyboardType: TextInputType.number,
                            ),
                            SizedBox(
                              height: 24.0,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              child: DropdownButtonFormField(
                                decoration: InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: AppColors.gray),
                                  ),
                                  labelText: 'Tipo de entrada',
                                ),
                                isExpanded: true,
                                onChanged: (value) {
                                  print(value);
                                  setState(() {
                                    _value = value as DropDownIncomesType;
                                    transaction.transactionCategory =
                                        _value.value;
                                  });
                                },
                                value: _value,
                                selectedItemBuilder: (BuildContext context) {
                                  return list
                                      .map<Widget>((DropDownIncomesType item) {
                                    return Row(
                                      children: [
                                        Text(_value.value),
                                      ],
                                    );
                                  }).toList();
                                },
                                items: list
                                    .map(
                                      (e) => DropdownMenuItem(
                                        value: e,
                                        child: Row(
                                          children: [
                                            IconsWidget(
                                              icontype: e.iconsWidget.icontype,
                                              size: e.iconsWidget.size,
                                              containerColor:
                                                  e.iconsWidget.containerColor,
                                              iconcolor:
                                                  e.iconsWidget.iconcolor,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 8.0),
                                              child: Text(
                                                e.value,
                                                style: AppTextStyles
                                                    .black16w400Roboto,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    )
                                    .toList(),
                              ),
                            ),
                            CustomTextFormField(
                              controler: incomeNameController,
                              obscureText: false,
                              labelText: "Nome da entrada",
                              validator: Validatorless.required(
                                  "Preencha uma descrição para a entrada"),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 38.0,
                                left: 8.0,
                              ),
                              child: InkWell(
                                onTap: () {
                                  selectTimePicker(context);
                                },
                                child: Text(
                                  formattedDate.toString(),
                                  style: AppTextStyles.purple14w500Roboto,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ))),
      floatingActionButton: ButtonWidget(
          borderRadius: 24,
          height: 50,
          width: 123,
          child: Text(
            "INSERIR",
            style: AppTextStyles.white14w500Roboto,
          ),
          prefixIcon: Icon(
            Icons.add,
            color: Colors.white,
          ),
          gradient: AppColors.headerButtonGradient,
          onTap: () {
            bool formvalid = _formKey.currentState?.validate() ?? false;
            if (formvalid) {
              final int incomePrice = (double.parse(
                          incomePriceController.text.replaceAll(",", ".")) *
                      100)
                  .toInt();
              transaction.price = incomePrice;
              transaction.transactionName = incomeNameController.text;
              transaction.userId = Modular.get<AuthController>().user?.userId;
              controller.createIncome(transaction);
              controller.updateBalance(transaction);
              Modular.to.pop();
            }
            print(transaction);
          }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      // resizeToAvoidBottomInset: false,
    );
  }
}
