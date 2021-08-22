import 'package:budget/src/modules/home/balance/balance_controller.dart';
import 'package:budget/src/modules/home/balance/pages/balance_expenses_page.dart';
import 'package:budget/src/modules/home/balance/pages/balance_incomes_page.dart';
import 'package:budget/src/modules/home/balance/pages/balance_total_page.dart';
import 'package:budget/src/shared/constants/shared_constants.dart';
import 'package:budget/src/shared/widgets/appbar/custom_appbar_widget.dart';
import 'package:budget/src/shared/widgets/shared_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class BalancePage extends StatefulWidget {
  const BalancePage({Key? key}) : super(key: key);

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
    print(controller.errorMessage);
  }

  @override
  Widget build(BuildContext context) {
   return Observer(builder: (_){
     if(controller.state == AppStatus.loading){
       return CircularProgressIndicator();
     }
     else if(controller.state == AppStatus.success){
       return DefaultTabController(
        length: 3,
        child: Builder(builder: (BuildContext context) {
          return Scaffold(
            appBar: CustomAppbar(
              text: "R\$ ${controller.monthlyBalance.total}",
              gradient: AppColors.headerButtonGradient,
              dropdown: CustomDropdown(
                  initialValue: controller.months[0],
                  dropdownItens: controller.months),
              tabBar: TabBar(
                tabs: [
                  Tab(text: "Entradas"),
                  Tab(text: "Saídas"),
                  Tab(text: "Total"),
                ],
              ),
            ),
            body: TabBarView(children: [
              BalanceIncomes(
                controller: controller,
              ),
              BalanceExpenses(controller: controller),
              BalanceTotal(controller: controller),
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
                              ? Modular.to.navigate("/home/balance/expenses")
                              : Modular.to
                                  .popUntil(ModalRoute.withName('/login'));
                      print(DefaultTabController.of(context)?.index);
                    },
                  )
                : Container(),
          );
        }));
     }
     else{
       return Center(
         child: Text("Erro")
       );
     }
    });
  }
}
