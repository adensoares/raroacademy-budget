
import 'package:flutter/material.dart';

import 'package:budget/src/modules/home/balance/balance_controller.dart';
import 'package:budget/src/modules/home/widgets/balances_card_page_widget.dart';

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
    widget.controller.getExpenses();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BalancesCardPage(
      transactions: widget.controller.transactions,
      balance: widget.controller.monthlyBalance.expenses,
    );
  }
}