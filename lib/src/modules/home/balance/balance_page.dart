import 'package:budget/src/modules/home/balance/balance_controller.dart';
import 'package:budget/src/modules/home/balance/pages/balance_expenses_page.dart';
import 'package:budget/src/modules/home/balance/pages/balance_incomes_page.dart';
import 'package:budget/src/modules/home/balance/pages/balance_total_page.dart';
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

  BalanceController controller = BalanceController();

  @override
  void initState() {
    super.initState();
    controller.getMonths();
    controller.getBalance();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: CustomAppbar(
            text: "R\$ ${controller.monthlyBalance.total}",
            gradient: AppColors.headerButtonGradient, 
            dropdown: CustomDropdown(
            initialValue: controller.months[0],
            dropdownItens: controller.months
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
            BalanceIncomes(controller: controller,),
            BalanceExpenses(controller: controller),
            BalanceTotal(controller: controller),
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