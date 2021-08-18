import 'package:budget/src/modules/home/balance/balance_repository.dart';
import 'package:budget/src/shared/models/transaction_model.dart';

class BalanceController {
  BalanceRepository repository = BalanceRepository();
  List<TransactionModel> transactions = [];

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
}
