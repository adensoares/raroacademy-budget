import 'package:budget/src/modules/home/home_controller.dart';
import 'package:budget/src/modules/home/widgets/daily_balance_card.dart';
import 'package:budget/src/shared/auth/auth_controller.dart';
import 'package:budget/src/shared/constants/shared_constants.dart';
import 'package:budget/src/shared/models/user_model.dart';
import 'package:budget/src/shared/widgets/shared_widgets.dart';
import 'package:budget/src/shared/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

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
    super.initState();
    controller.getGeneralBalance();
    controller.getMonths();
    controller.getMonthlyBalance();
    controller.getLastTransactions();
    print(controller.lastTransactions);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SimpleAppbar(
        title: 'Olá, ${Modular.get<AuthController>().user?.name}',
        gradient: AppColors.headerButtonGradient,
        expanded: false,
        child: Builder(builder: (context) {
          return IconButton(
            onPressed: () => Scaffold.of(context).openDrawer(),
            icon: Icon(
              Icons.menu,
              color: Colors.white,
            ),
          );
        }),
      ),
      drawer: CustomDrawer(
        textHeader: 'Olá, ${Modular.get<AuthController>().user?.name}',
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
                    balance: controller.monthlyBalance.total,
                    expenses: controller.monthlyBalance.expenses,
                    incomes: controller.monthlyBalance.incomes,
                    dropdown: CustomDropdown(
                        initialValue: controller.months[0],
                        dropdownItens: controller.months,
                        gradient: AppColors.headerButtonGradient),
                  ),
                  onTap: () {
                Modular.to.navigate("/home/balance");
              },
                ),
                LastTransactionsCard(
                  lastTransactionsBalance: controller.lastTransactionsBalance,
                  transactions: controller.lastTransactions
                )
              ],
            ),
          );
        }else {
          return Column(
            children: [
              Text("Erro na conexão", style: AppTextStyles.cyan48w400Roboto,),
              ButtonWidget(
                borderRadius: 34.0,
                child: Text("TENTAR NOVAMENTE", style: AppTextStyles.white14w500Roboto,),
                onTap: (){
                }
              )
            ],
          );
        }
      }
      ),
    );
  }
}
