import 'package:budget/src/shared/constants/shared_constants.dart';
import 'package:budget/src/shared/widgets/shared_widgets.dart';
import 'package:flutter/material.dart';

import 'widgets/general_balance_card_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SimpleAppbar(
          title: "Olá, José da silva",
          gradient: AppColors.splashGradient,
          expanded: false,
        ),
        drawer: CustomDrawer(textHeader: "Olá, José",),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              GeneralBalanceCard(),
              Card(
                child: Column(
                  children: [
                    ListTile(
                      contentPadding: EdgeInsets.only(top: 8.0, bottom: 8.0, left: 16.0, right: 8.0),
                      minVerticalPadding: 16.0,
                      trailing: CustomDropdown(
                        initialValue: "Ago",
                        dropdownItens: [
                          "Jan",
                          "Fev",
                          "Mar",
                          "Abr",
                          "Mai",
                          "Jun",
                          "Jul",
                          "Ago",
                          "Set",
                          "Out",
                          "Nov",
                          "Dez",
                        ],
                        gradient: AppColors.splashGradient,
                      ),
                      title: Text("Saldo Geral", style: AppTextStyles.purple20w500Roboto,),
                      subtitle: Text("R\$ 3.000,00", style: AppTextStyles.black24w400Roboto,),
                    ),
                    Text("Saidas"),
                    Row(
                      children: [
                        Flexible(
                          child: FractionallySizedBox(
                            alignment: FractionalOffset.centerLeft,
                            widthFactor: 0.8,
                            child: Container(
                              height: 11,
                              color: Colors.yellow,
                            )
                          ),
                        ),
                      ],
                    )
                  ],
                )
              )
            ],
          ),
        ),
    );
  }
}
