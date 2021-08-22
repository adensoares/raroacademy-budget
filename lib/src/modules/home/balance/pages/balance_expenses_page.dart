import 'package:flutter/material.dart';

import 'package:budget/src/modules/home/balance/balance_controller.dart';
import 'package:budget/src/modules/home/widgets/balances_card_page_widget.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class BalanceExpenses extends StatefulWidget {
  const BalanceExpenses({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final BalanceController controller;

  @override
  State<BalanceExpenses> createState() => _BalanceExpensesState();
}

class _BalanceExpensesState extends State<BalanceExpenses> {

  @override
  void initState() {
    widget.controller.changeVisibilityButton(true);
    widget.controller.getExpenses();
     print(widget.controller.transactions);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_){
      if(widget.controller.state == AppStatus.loading){
        return Center(
          child: CircularProgressIndicator(),
        );
      }
      else if(widget.controller.state == AppStatus.success){
        return BalancesCardPage(
          totalType: "Saídas",
          transactions: widget.controller.transactions,
          balance: -widget.controller.monthlyBalance.expenses,
        );
      }
      else{
        return Scaffold(
          body: Center(
            child: Text("Erro"),
          ),
        );
      }
    });
  }
}