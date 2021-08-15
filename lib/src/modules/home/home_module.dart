import 'package:budget/src/modules/home/balance/balance_page.dart';
import 'package:budget/src/modules/home/drawerSignup/drawer_signup_page.dart';
import 'package:budget/src/modules/home/expenses/expenses_page.dart';
import 'package:budget/src/modules/home/home_page.dart';
import 'package:budget/src/modules/home/incomes/incomes_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, args) => HomePage()),
        ChildRoute('/balance', child: (_, args) => BalancePage()),
        ChildRoute('/incomes', child: (_, args) => IncomesPage()),
        ChildRoute('/expenses', child: (_, args) => ExpensesPage()),
        ChildRoute('/drawerSignup', child: (_, args) => DrawerSignupPage()),
      ];
}
