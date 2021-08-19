import 'package:budget/src/modules/home/balance/pages/balance_expenses_page.dart';
import 'package:budget/src/modules/home/balance/pages/balance_incomes_page.dart';
import 'package:budget/src/modules/home/balance/pages/balance_total_page.dart';
import 'package:budget/src/modules/home/widgets/balances_card_page_widget.dart';
import 'package:budget/src/shared/constants/shared_constants.dart';
import 'package:budget/src/shared/widgets/appbar/custom_appbar_widget.dart';
import 'package:budget/src/shared/widgets/shared_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class BalancePage extends StatefulWidget {
  const BalancePage({Key? key}) : super(key: key);

  @override
  _BalancePageState createState() => _BalancePageState();
}

class _BalancePageState extends State<BalancePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Builder(builder: (BuildContext context) {
          return Scaffold(
            appBar: CustomAppbar(
              text: "R\$ 1.104,53",
              gradient: AppColors.headerButtonGradient,
              dropdown: CustomDropdown(
                initialValue: 'Ago',
                dropdownItens: ["Ago", "Set"],
              ),
              tabBar: TabBar(
                tabs: [
                  Tab(text: "Entradas"),
                  Tab(text: "Saídas"),
                  Tab(text: "Total"),
                ],
              ),
            ),
            body: TabBarView(children: [
              BalanceIncomes(),
              BalanceExpenses(),
              BalanceTotal(),
            ]),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            floatingActionButton: DefaultTabController.of(context)?.index != 2
                ? ButtonWidget(
                    width: 48.0,
                    height: 48.0,
                    gradient: AppColors.circleButtonGradient,
                    borderRadius: 25.0,
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                    onTap: () {
                      DefaultTabController.of(context)?.index == 0
                          ? Modular.to.navigate("/home/balance/incomes")
                          : DefaultTabController.of(context)?.index == 1
                              ? Modular.to.navigate("/home/balance/incomes")
                              : Modular.to
                                  .popUntil(ModalRoute.withName('/login'));
                      print(DefaultTabController.of(context)?.index);
                    },
                  )
                : Container(),
          );
        }));
  }
}
