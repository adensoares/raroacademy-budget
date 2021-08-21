import 'package:budget/src/shared/models/balance_model.dart';
import 'package:budget/src/shared/models/transaction_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BalanceRepository {
  Future<List<TransactionModel>> getIncomes() async {
    try {
      final response = await FirebaseFirestore.instance
        .collection('/transactions')
        .where("userId", isEqualTo: "auShXOUMllSyz77ogasa")
        .where("transactionType", isEqualTo: "in")
        .get();

      print(response.docs.length);

      if (response.docs.length == 0) {
        return [];
      }
      List<TransactionModel> listTransactions =
          response.docs.map((e) => TransactionModel.fromMap(e.data())).toList();
      print(listTransactions);
      return listTransactions;
    } on FirebaseException catch (e) {
      print('Erro no servidor: ${e.code}');
      throw e.message ??
          'Não foi possível recuperar os dados do servidor. Erro ${e.code}';
    }
  }

  Future<List<TransactionModel>> getExpenses() async {
    try {
      final response = await FirebaseFirestore.instance
          .collection('/transactions')
          .where("userId", isEqualTo: "auShXOUMllSyz77ogasa")
          .where("transactionType", isEqualTo: "out")
          .get();

      print(response.docs.length);
      if(response.docs.length == 0){
        return [];
      }

      List<TransactionModel> listTransactions =
          response.docs.map((e) => TransactionModel.fromMap(e.data())).toList();
      print(listTransactions);
      return listTransactions;
    } on FirebaseException catch (e) {
      print('Erro no servidor: ${e.code}');
      throw e.message ??
          'Não foi possível recuperar os dados do servdor. Erro ${e.code}';
    }
  }

  Future<List<String>> getMonths() async {
    List<String> months = [""];
    try {
      final response = await FirebaseFirestore.instance
          .collection("/months")
          .doc("FiZytUcJpjbQPbOBRa38")
          .get();

      print((response.data()!["months"]).runtimeType);

      print(response.data()!["months"]);
      
      months = (response.data()!["months"]).cast<String>();
      if(months.length == 0){
        return [" "];
      }
      print(months);
      return months;
    } on FirebaseException catch (e) {
      print('Erro no servidor: ${e.code}');
      throw e.message ??
          'Não foi possível recuperar os dados do servidor. Erro ${e.code}';
    }
  }

  Future<MonthlyBalanceModel> getMonthlyBalance() async {

    MonthlyBalanceModel monthlyBalance = MonthlyBalanceModel(expenses: 0, incomes: 0, month: "", total: 0);
    try {
      final response = await FirebaseFirestore.instance
          .collection("/monthly_balances")
          .doc("9Pl7LsinbHWZS85YlVOl")
          .get();

      print((response.data()).runtimeType);

      print(response.data());
      monthlyBalance = MonthlyBalanceModel.fromMap(response.data()!) ;
      print(monthlyBalance);
      return monthlyBalance;
    } on FirebaseException catch (e) {
      print('Erro no servidor: ${e.code}');
      throw e.message ??
          'Não foi possível recuperar os dados do servidor. Erro ${e.code}';
    }
  }
}
