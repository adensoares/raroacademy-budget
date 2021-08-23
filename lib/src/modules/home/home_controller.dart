import 'package:budget/src/modules/home/home_repository.dart';
import 'package:budget/src/shared/models/balance_model.dart';
import 'package:budget/src/shared/models/transaction_model.dart';
import 'package:mobx/mobx.dart';
part 'home_controller.g.dart';

enum AppStatus{empy, loading, success, error}

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {

  HomeRepository repository = HomeRepository();

  @observable
  AppStatus state = AppStatus.empy;

  @observable
  int lastTransactionsBalance = 0;

  @observable
  int generalBalance = 0;

  @observable
  MonthlyBalanceModel monthlyBalance = MonthlyBalanceModel(userId: "", expenses: 0, incomes: 0, month: "", total: 0);

  List<String> months = [" "];

  List<TransactionModel> lastTransactions = [];

  @action
  Future<void> getGeneralBalance()async {
    try{
      state = AppStatus.loading;
      generalBalance = await repository.getGeneralBalance();
      state = AppStatus.success;
    }
    catch(e){
      print(e);
      state = AppStatus.error;
    }
  }

   @action
  Future<void> getLastTransactions()async {
    try{
      state = AppStatus.loading;
      lastTransactions = await repository.getLastTransactions();
      state = AppStatus.success;
    }
    catch(e){
      print(e);
      state = AppStatus.error;
    }
  }
  
  @action
  Future<void> getMonths()async {
    try{
      state = AppStatus.loading;
      months =  await repository.getMonths();
      state = AppStatus.success;
    }
    catch(e){
      print(e);
      state = AppStatus.error;
    }
  }

  @action
  Future<void> getMonthlyBalance() async {
    try {
      state = AppStatus.loading;
      monthlyBalance = await repository.getMonthlyBalance();
      state = AppStatus.success;
    }
    catch(e) {
      print(e);
      state = AppStatus.error;
    }
  }
}