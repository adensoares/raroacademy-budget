import 'package:budget/src/modules/home/home_controller.dart';
import 'package:budget/src/modules/home/widgets/daily_balance_card.dart';
import 'package:budget/src/shared/constants/shared_constants.dart';
import 'package:budget/src/shared/widgets/shared_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'widgets/general_balance_card_widget.dart';
import 'widgets/last_transactions_card_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  HomeController controller = HomeController();

  @override
  void initState() {
    controller.getGeneralBalance();
    controller.getMonths();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SimpleAppbar(
        title: "Olá, José da silva",
        gradient: AppColors.splashGradient,
        expanded: false,
      ),
      drawer: CustomDrawer(
        textHeader: "Olá, José",
      ),
      body: Observer(builder: (_) {
        if (controller.state == AppStatus.loading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (controller.state == AppStatus.success) {
          return SingleChildScrollView(
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                GeneralBalanceCard(balance: controller.generalBalance),
                InkWell(
                  child: DailyBalanceCard(
                    balance: "R\$ 3.000,00",
                    expenses: "R\$ 5.000,00",
                    incomes: "R\$ 8.000,00",
                    dropdown: CustomDropdown(
                        initialValue: controller.months[1],
                        dropdownItens: controller.months,
                        gradient: AppColors.headerButtonGradient),
                  ),
                  onTap: () {},
                ),
                LastTransactionsCard()
              ],
            ),
          );
        }else {
          return Center(
            child: Text("Erro!"),
          );
        }
      }
      ),
    );
  }
}
