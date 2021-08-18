import 'package:budget/src/modules/home/home_repository.dart';
import 'package:mobx/mobx.dart';
part 'home_controller.g.dart';

enum AppStatus{empy, loading, success, error}

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {

  HomeRepository repository = HomeRepository();

  @observable
  AppStatus state = AppStatus.empy;

  @observable
  String generalBalance = "0,00";

  List<String> months = [];

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
      await repository.getMonthlyBalance("Agosto");
      state = AppStatus.success;
    }
    catch(e) {
      print(e);
      state = AppStatus.error;
    }
  }
}