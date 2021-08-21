import 'dart:convert';

import 'package:budget/src/shared/models/balance_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class HomeRepository {

  Future<String> getGeneralBalance() async{
    late int? generalBalance;
    try{
      final response = await FirebaseFirestore.instance
      .collection("/balances")
      .doc("auShXOUMllSyz77ogasa")
      .get();

      print(response.data()!["total"]);
      generalBalance = (response.data()!["total"]) as int;
      print(generalBalance);
      return (generalBalance.toDouble()).reais();

    } catch (e) {
      print('Erro no servidor: $e');
      throw Exception("Erro de conexão");
    }
  }

  Future<List<String>> getMonths() async {
    List<String> months = [" "];
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

  // Future<List<TransactionModel>> getIncomes() async {
  //   try {
  //     final response = await FirebaseFirestore.instance
  //         .collection('/transactions')
  //         .where("userId", isEqualTo: "auShXOUMllSyz77ogasa")
  //         .where("transactionType", isEqualTo: "in")
  //         .get();          

  //     print(response.docs.length);

  //     List<TransactionModel> listTransactions =  response.docs.map((e) => TransactionModel.fromMap(e.data())).toList();
  //     print(listTransactions);
  //     return listTransactions;
  //   }on FirebaseAuthException catch (e) {
  //     print('Erro no servidor: ${e.code}');
  //     throw e.message ?? 'Não foi possível recuperar os dados do servdor. Erro ${e.code}';
  //   }
  // }
}

extension parse on double {
  String reais() {
    return "R\$ ${this.toStringAsFixed(2).replaceAll(".", ",")}";
  }
}