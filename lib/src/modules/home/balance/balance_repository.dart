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

      List<TransactionModel> listTransactions =  response.docs.map((e) => TransactionModel.fromMap(e.data())).toList();
      print(listTransactions);
      return listTransactions;
    }on FirebaseException catch (e) {
      print('Erro no servidor: ${e.code}');
      throw e.message ?? 'Não foi possível recuperar os dados do servdor. Erro ${e.code}';
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

      List<TransactionModel> listTransactions =  response.docs.map((e) => TransactionModel.fromMap(e.data())).toList();
      print(listTransactions);
      return listTransactions;
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

      print((response.data()!["nameMonths"]).runtimeType);

      print(response.data()!["nameMonths"]);
      months = (response.data()!["nameMonths"]).cast<String>();
      print(months);
      return months;

    }on FirebaseException catch (e) {
      print('Erro no servidor: ${e.code}');
      throw e.message ?? 'Não foi possível recuperar os dados do servidor. Erro ${e.code}';
    }
  }
}