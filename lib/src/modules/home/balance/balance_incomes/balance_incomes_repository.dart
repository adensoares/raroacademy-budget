import 'package:budget/src/shared/models/transaction_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class BalanceIncomesRepository {

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
    }on FirebaseAuthException catch (e) {
      print('Erro no servidor: ${e.code}');
      throw e.message ?? 'Não foi possível recuperar os dados do servdor. Erro ${e.code}';
    }
  }
}