import 'package:budget/src/modules/home/balance/incomes/incomes_repository.dart';
import 'package:budget/src/shared/models/transaction_model.dart';

class IncomesController {

  IncomesRepository repository = IncomesRepository();

  Future<void> createIncome(TransactionModel transaction) async {
    try{
      await repository.createIncome(transaction);
    }catch(e){
      print(e);
    }
  }

  Future<void> updateBalance(TransactionModel transaction) async {
    try{
      await repository.updateBalance(transaction);
    }catch(e){
      print(e);
    }
  }
}