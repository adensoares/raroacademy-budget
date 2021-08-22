import 'package:flutter/material.dart';

import 'package:budget/src/modules/home/balance/balance_controller.dart';
import 'package:budget/src/modules/home/widgets/balances_card_page_widget.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

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
  widget.controller.getAll(); 
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
          transactions: widget.controller.transactions,
          balance: widget.controller.monthlyBalance.total,
        );
      }
      else{
        return Center(
          child: Text("Erro"),
        );
      }
    });
  }
}