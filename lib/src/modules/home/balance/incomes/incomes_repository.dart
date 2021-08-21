import 'package:budget/src/shared/models/transaction_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class IncomesRepository {
  Future<void> createIncome(TransactionModel transaction) async {
    try{
      await FirebaseFirestore.instance.collection("/transactions")
      .doc("auShXOUMllSyz77ogasa")
      .set(
        transaction.toMap()
      );
    }on FirebaseException catch(e){
      print('Erro no servidor: ${e.code}');
      throw e.message ??
          'Não foi possível recuperar os dados do servidor. Erro ${e.code}';
    }
  }
}