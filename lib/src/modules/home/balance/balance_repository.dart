import 'package:budget/src/shared/auth/auth_controller.dart';
import 'package:budget/src/shared/models/balance_model.dart';
import 'package:budget/src/shared/models/transaction_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';

class BalanceRepository {

  Future<List<TransactionModel>> getIncomes() async {
    try {
      final response = await FirebaseFirestore.instance
        .collection('/transactions')
        .where("userId", isEqualTo: Modular.get<AuthController>().user?.userId)
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
          .where("userId", isEqualTo: Modular.get<AuthController>().user?.userId)
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

  Future<List<TransactionModel>> getAllTransactions() async {
    try {
      final response = await FirebaseFirestore.instance
          .collection('/transactions')
          .where("userId", isEqualTo: Modular.get<AuthController>().user?.userId)
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
    List<String> months = [" "];
    try {
      print(Modular.get<AuthController>().user?.userId);
      final response = await FirebaseFirestore.instance
          .collection("/months")
          .doc(Modular.get<AuthController>().user?.userId)
          .get();

      print(response.data()?["months"]);

      if(response.data()?["months"] != null){
        months = (response.data()?["months"]).cast<String>();
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

    MonthlyBalanceModel monthlyBalance = MonthlyBalanceModel(expenses: 0, incomes: 0, month: "", total: 0, userId: '');
    try {
      final doc = await FirebaseFirestore.instance
      .collection("/monthly_balances")
      .where("userId", isEqualTo: Modular.get<AuthController>().user?.userId)
      .get();

      print(doc.docs);
      if(doc.docs.length > 0){
        final response = await FirebaseFirestore.instance
        .collection("/monthly_balances")
        .doc(doc.docs.first.id)
        .get();
        monthlyBalance = MonthlyBalanceModel.fromMap(response.data()!);
      }
  print(monthlyBalance);
      return monthlyBalance;

    } on FirebaseException catch (e) {
      print('Erro no servidor: ${e.code}');
      throw e.message ??
          'Não foi possível recuperar os dados do servidor. Erro ${e.code}';
    }
  }
}
