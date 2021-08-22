import 'package:budget/src/shared/auth/auth_controller.dart';
import 'package:budget/src/shared/models/transaction_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ExpensesRepository {
  Future<void> createExpense(TransactionModel transaction) async {
    try{
      await FirebaseFirestore.instance.collection("/transactions")
      .add(
        transaction.toMap()
      );
    }on FirebaseException catch(e){
      print('Erro no servidor: ${e.code}');
      throw e.message ??
          'Não foi possível recuperar os dados do servidor. Erro ${e.code}';
    }
  }

  Future<void> updateBalance(TransactionModel transaction) async {
    try{
      await FirebaseFirestore.instance.collection("/balances")
      .doc(Modular.get<AuthController>().user?.userId)
      .update(
        {
        "total": FieldValue.increment(-transaction.price)
        }
      );

      final response = await FirebaseFirestore.instance.collection("/monthly_balances")
      .doc(Modular.get<AuthController>().user?.userId)
      .get();
      
    }on FirebaseException catch(e){
      print('Erro no servidor: ${e.code}');
      throw e.message ??
          'Não foi possível recuperar os dados do servidor. Erro ${e.code}';
    }
  }
}