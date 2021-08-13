import 'package:budget/src/shared/models/transaction_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class BalanceIncomesRepository {

  Future<List<TransactionModel>> getIncomes() async {
    try {
      final response = await FirebaseFirestore.instance
          .collection('/transactions')
          .where('userId', isEqualTo: "")
          .get() as List;

      List<TransactionModel> listTransactions =  response.map((e) => TransactionModel.fromJson(e)).toList();
      return listTransactions;
    } on FirebaseAuthException catch (e) {
      print('erro com o login codigo : ${e.code}');
      throw e.message ?? 'Não foi possível recuperar as transações';
    }
  }
}