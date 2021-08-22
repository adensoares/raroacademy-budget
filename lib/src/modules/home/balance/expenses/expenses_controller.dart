import 'package:budget/src/shared/models/transaction_model.dart';
import 'expenses_repository.dart';

class ExpensesController {

  ExpensesRepository repository = ExpensesRepository();

  Future<void> createExpense(TransactionModel transaction) async {
    try{
      await repository.createExpense(transaction);
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