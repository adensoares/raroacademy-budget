import 'package:budget/src/modules/home/balance/balance_incomes/balance_incomes_repository.dart';
import 'package:budget/src/shared/models/transaction_model.dart';

enum AppStatus{empy, loading, succes, error}

class BalanceIncomesController {

  BalanceIncomesRepository repository = BalanceIncomesRepository();
  List<TransactionModel> incomesTransactions = [];
  AppStatus state = AppStatus.empy;

  Future<void> getIncomeTransactions()async {
    try{
      state = AppStatus.loading;
      incomesTransactions = await repository.getIncomes();
    }
    catch(e){
      state = AppStatus.error;
    }
  }

}