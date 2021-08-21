import 'package:budget/src/modules/home/balance/incomes/incomes_controller.dart';
import 'package:budget/src/shared/constants/dropdown_incomes_type.dart';
import 'package:budget/src/shared/constants/shared_constants.dart';
import 'package:budget/src/shared/models/transaction_model.dart';
import 'package:budget/src/shared/utils/month_to_string.dart';
import 'package:budget/src/shared/widgets/shared_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

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
    transactionType: "",
    transactionCategory: "",
    month: monthToString(DateTime.now().month)
  );
  TextEditingController incomeNameController = TextEditingController();
  TextEditingController incomePriceController = TextEditingController();

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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SimpleAppbar(
        title: "Entrada",
        gradient: AppColors.headerButtonGradient,
        expanded: true,
        child: IconButton(
          onPressed: () => Modular.to.navigate('/home/balance'),
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
      ),
      drawer: CustomDrawer(
        textHeader: "Olá, José",
      ),
      body: Padding(
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextFormField(
                      controler: incomePriceController,
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
                            borderSide: BorderSide(color: AppColors.gray),
                          ),
                          labelText: 'Tipo de entrada',
                        ),
                        isExpanded: true,
                        onChanged: (value) {
                          print(value);
                          setState(() {
                            _value = value as DropDownIncomesType;
                            transaction.transactionCategory = _value.value;
                          });
                        },
                        value: _value,
                        selectedItemBuilder: (BuildContext context) {
                          return list.map<Widget>((DropDownIncomesType item) {
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
                                      iconcolor: e.iconsWidget.iconcolor,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Text(
                                        e.value,
                                        style: AppTextStyles.black16w400Roboto,
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
      ),
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
            print(transaction);      
          }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      // resizeToAvoidBottomInset: false,
    );
  }
}
