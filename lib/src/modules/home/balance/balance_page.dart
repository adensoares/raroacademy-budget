import 'package:budget/src/modules/home/balance/balance_expenses/balance_expenses_page.dart';
import 'package:budget/src/modules/home/balance/balance_incomes/balance_incomes_page.dart';
import 'package:budget/src/modules/home/balance/balance_total/balance_total_page.dart';
import 'package:budget/src/modules/home/widgets/balances_card_page_widget.dart';
import 'package:budget/src/shared/constants/shared_constants.dart';
import 'package:budget/src/shared/widgets/appbar/custom_appbar_widget.dart';
import 'package:budget/src/shared/widgets/shared_widgets.dart';
import 'package:flutter/material.dart';

class BalancePage extends StatefulWidget {
  const BalancePage({ Key? key }) : super(key: key);

  @override
  _BalancePageState createState() => _BalancePageState();
}

class _BalancePageState extends State<BalancePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: CustomAppbar(
            text: "R\$ 1.104,53",
            gradient: AppColors.splashGradient, 
            dropdown: CustomDropdown(
            initialValue: 'Ago',
            dropdownItens: [
              "Ago",
              "Set"
            ],
            ), 
            tabBar: TabBar(
              tabs: [
               Tab(text: "Entradas"),
               Tab(text: "Saídas"),
               Tab(text: "Total"),
              ],
            ),
          ),
        body: TabBarView(
          children: [
            BalanceIncomes(),
            BalanceExpenses(),
            BalanceTotal(),
          ]
        ),
        drawer: CustomDrawer(textHeader: "Olá, José",),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: ButtonWidget(
          width: 48.0,
          height: 48.0,
          gradient: AppColors.splashGradient,
          borderRadius: 25.0,
          child: Icon(Icons.add, color: Colors.white,),
          onTap: (){},
        ),
      ),
    );
  }
}