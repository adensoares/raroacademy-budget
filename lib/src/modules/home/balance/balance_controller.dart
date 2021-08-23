import 'package:budget/src/modules/home/balance/balance_repository.dart';
import 'package:budget/src/shared/models/balance_model.dart';
import 'package:budget/src/shared/models/transaction_model.dart';
import 'package:mobx/mobx.dart';
part 'balance_controller.g.dart';

enum AppStatus{empty, loading, success, error}

class BalanceController = _BalanceControllerBase with _$BalanceController;


abstract class _BalanceControllerBase with Store {

  String errorMessage = "";

  BalanceRepository repository = BalanceRepository();

  @observable
  bool visibleButton = true;

  @observable
  AppStatus state = AppStatus.empty;

  @observable
  List<TransactionModel> transactions = [];
  List<String> months = [" "];

  @observable
  MonthlyBalanceModel monthlyBalance = MonthlyBalanceModel(expenses: 0, incomes: 0, month: "", total: 0, userId: '');

  @action
  void changeVisibilityButton(bool visibility){
    try{
      state = AppStatus.loading;
      visibleButton = visibility;
      state = AppStatus.success;
    }catch(e){
      state = AppStatus.error;
    }    
  }

  @action
  Future<void> getIncomes() async {
    try {
      state = AppStatus.loading;
      transactions = await repository.getIncomes();
      state = AppStatus.success;
    } catch (e) {
      state = AppStatus.error;
      print(e);
    }
  }

  @action
  Future<void> getExpenses() async {
    try {
      state = AppStatus.loading;
      transactions = await repository.getExpenses();
      state = AppStatus.success;
    } catch (e) {
      state = AppStatus.error;
      errorMessage = e.toString();
      print(e);
    }
  }

  @action
  Future<void> getAll() async {
    try {
      state = AppStatus.loading;
      transactions = await repository.getAllTransactions();
      state = AppStatus.success;
    } catch (e) {
      state = AppStatus.error;
      errorMessage = e.toString();
      print(e);
    }
  }

  @action
  Future<void> getMonths() async {
    try {
      state = AppStatus.loading;
      months = await repository.getMonths();
      state = AppStatus.success;
    } catch (e) {
      state = AppStatus.error;
      print(e);
    }
  }

  @action
  Future<void> getBalance() async {
    try {
      state = AppStatus.loading;
      monthlyBalance = await repository.getMonthlyBalance();
      state = AppStatus.success;
    } catch (e) {
      state = AppStatus.error;
      print(e);
    }
  }
}
