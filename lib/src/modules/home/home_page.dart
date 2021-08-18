import 'package:budget/src/modules/home/widgets/daily_balance_card.dart';
import 'package:budget/src/shared/constants/shared_constants.dart';
import 'package:budget/src/shared/widgets/shared_widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'widgets/general_balance_card_widget.dart';
import 'widgets/last_transactions_card_widget.dart';

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
        gradient: AppColors.headerButtonGradient,
        expanded: false,
        child: Builder(builder: (context) {
          return IconButton(
            onPressed: () => Scaffold.of(context).openDrawer(),
            icon: Icon(
              Icons.menu,
              color: Colors.white,
            ),
          );
        }),
      ),
      drawer: CustomDrawer(
        textHeader: "Olá, José",
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            GeneralBalanceCard(balance: "R\$ 3.000,00"),
            InkWell(
              child: DailyBalanceCard(
                balance: "R\$ 3.000,00",
                expenses: "R\$ 5.000,00",
                incomes: "R\$ 8.000,00",
                dropdown: CustomDropdown(
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
                  gradient: AppColors.headerButtonGradient,
                ),
              ),
              onTap: () {
                Modular.to.navigate("/home/balance");
              },
            ),
            LastTransactionsCard()
          ],
        ),
      ),
    );
  }
}
