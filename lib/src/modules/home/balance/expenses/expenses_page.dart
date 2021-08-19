import 'package:budget/src/shared/constants/dropdown_expenses_type.dart';
import 'package:budget/src/shared/constants/shared_constants.dart';
import 'package:budget/src/shared/widgets/shared_widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

class ExpensesPage extends StatefulWidget {
  const ExpensesPage({Key? key}) : super(key: key);

  @override
  _ExpensesPageState createState() => _ExpensesPageState();
}

class _ExpensesPageState extends State<ExpensesPage> {
  DateTime date = DateTime.now();
  String? formattedDate;

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
      });
    }
  }

  late DropDownExpensesType _value = DropDownExpensesType(
    iconsWidget: IconsWidget(
      icontype: Icons.fastfood,
      containerColor: AppColors.yellow,
      iconcolor: Colors.white,
      size: 24.0,
    ),
    value: "Refeição",
  );

  @override
  void initState() {
    formattedDate = DateFormat('dd/MM/yyyy').format(date);

    _value = list[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SimpleAppbar(
        title: "Saída",
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
                      obscureText: false,
                      labelText: "Valor em R\$",
                      keyboardType: TextInputType.number,
                    ),
                    SizedBox(
                      height: 32.0,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: DropdownButtonFormField(
                        decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: AppColors.gray),
                          ),
                          labelText: 'Tipo de saída',
                        ),
                        isExpanded: true,
                        onChanged: (value) {
                          setState(() {
                            _value = value as DropDownExpensesType;
                          });
                        },
                        value: _value,
                        selectedItemBuilder: (BuildContext context) {
                          return list.map<Widget>((DropDownExpensesType item) {
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
          onTap: () {}),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
