import 'package:flutter/material.dart';

import 'package:budget/src/modules/home/balance/balance_controller.dart';
import 'package:budget/src/modules/home/widgets/balances_card_page_widget.dart';
import 'package:budget/src/shared/constants/app_colors.dart';
import 'package:budget/src/shared/constants/app_text_styles.dart';

class BalanceIncomes extends StatefulWidget {
  const BalanceIncomes({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final BalanceController controller;

  @override
  State<BalanceIncomes> createState() => _BalanceIncomesState();
}

class _BalanceIncomesState extends State<BalanceIncomes> {  

  @override
  void initState() {
    widget.controller.getIncomes();
    //print(controller.incomesTransactions);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return BalancesCardPage(transactions: widget.controller.transactions,);
  }
}