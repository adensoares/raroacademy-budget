import 'package:budget/src/shared/models/transaction_model.dart';

class _TypeTransactionIn {

  static final String cash = "Dinheiro";
  static final String pix = "Pix";
  static final String doc = "Doc";
  static final String ted = "Ted";
  static final String paymentSlip = "Boleto";
  
}

class TransactionIn extends Transaction {

  String nameTransaction = "";
  _TypeTransactionIn? type;
  
}