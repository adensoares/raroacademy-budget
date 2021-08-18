
import 'package:flutter/material.dart';

import 'package:budget/src/modules/home/balance/balance_controller.dart';
import 'package:budget/src/modules/home/widgets/balances_card_page_widget.dart';

class BalanceTotal extends StatefulWidget {
  BalanceTotal({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final BalanceController controller;

  @override
  State<BalanceTotal> createState() => _BalanceTotalState();
}

class _BalanceTotalState extends State<BalanceTotal> {

@override
void initState() { 
  super.initState();

}
  
  @override
  Widget build(BuildContext context) {
    return BalancesCardPage(
      transactions: widget.controller.transactions,
    );
  }
}