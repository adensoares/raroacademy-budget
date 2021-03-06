import 'package:flutter/material.dart';

import 'package:budget/src/modules/home/balance/balance_controller.dart';
import 'package:budget/src/modules/home/widgets/balances_card_page_widget.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

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
    widget.controller.changeVisibilityButton(true);
    widget.controller.getIncomes();
    print(widget.controller.transactions);
    super.initState();
  }

  @override
  void didUpdateWidget(covariant BalanceIncomes oldWidget) {
    widget.controller.getIncomes();
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      if (widget.controller.state == AppStatus.loading) {
        return Center(
          child: CircularProgressIndicator(),
        );
      } else if (widget.controller.state == AppStatus.success) {
        return BalancesCardPage(
          totalType: "Entradas",
          transactions: widget.controller.transactions,
          balance: widget.controller.monthlyBalance.incomes,
        );
      } else {
        return Scaffold(
          body: Center(
            child: Text("Erro"),
          ),
        );
      }
    });
  }
}
