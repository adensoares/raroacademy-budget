import 'package:budget/src/modules/home/balance/balance_repository.dart';
import 'package:budget/src/shared/models/balance_model.dart';
import 'package:budget/src/shared/models/transaction_model.dart';


class BalanceController {
  BalanceRepository repository = BalanceRepository();
  List<TransactionModel> transactions = [];
  List<String> months = [" "];
  MonthlyBalanceModel monthlyBalance = MonthlyBalanceModel(expenses: 0, incomes: 0, month: "", total: 0);

  Future<void> getIncomes() async {
    try {
      transactions = await repository.getIncomes();
    } catch (e) {
      print(e);
    }
  }

  Future<void> getExpenses() async {
    try {
      transactions = await repository.getExpenses();
    } catch (e) {
      print(e);
    }
  }

  Future<void> getMonths() async {
    try {
      months = await repository.getMonths();
    } catch (e) {
      print(e);
    }
  }

  Future<void> getBalance() async {
    try {
      monthlyBalance = await repository.getMonthlyBalance();
    } catch (e) {
      print(e);
    }
  }
}
