import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

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

    }on FirebaseException catch (e) {
      print('Erro no servidor: ${e.code}');
      throw e.message ?? 'Não foi possível recuperar os dados do servdor. Erro ${e.code}';
    }
  }

  Future<List<String>> getMonths() async{

     List<String> months = [];
    try{
      final response = await FirebaseFirestore.instance
      .collection("/balances")
      .doc("auShXOUMllSyz77ogasa")
      .get();

      print(response.data()!["nameMonths"]);
      months = (response.data()!["nameMonths"]) as List<String>;
      print(months);
      return months;

    }on FirebaseException catch (e) {
      print('Erro no servidor: ${e.code}');
      throw e.message ?? 'Não foi possível recuperar os dados do servdor. Erro ${e.code}';
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