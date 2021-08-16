import 'package:budget/src/modules/home/home_repository.dart';

enum AppStatus{empy, loading, success, error}

class HomeController {

  AppStatus state = AppStatus.empy;
  HomeRepository repository = HomeRepository();
  String generalBalance = "0,00";
  List<String> months = [];

  HomeController() {
    getGeneralBalance();
    getMonths();
  }

  Future<void> getGeneralBalance()async {
    try{
      state = AppStatus.loading;
      generalBalance = await repository.getGeneralBalance();
      state = AppStatus.success;
    }
    catch(e){
      state = AppStatus.error;
    }
  }

  Future<void> getMonths()async {
    try{
      state = AppStatus.loading;
      months = await repository.getMonths();
      state = AppStatus.success;
    }
    catch(e){
      state = AppStatus.error;
    }
  }
}