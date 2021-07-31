import 'package:budget/src/shared/models/transaction_model.dart';

class _TypeTransactionOut {

  static final String food = "Refeição";
  static final String transport = "Transporte";
  static final String travel = "Viagem";
  static final String education = "Educação";
  static final String payment = "Pagamento";
  static final String other = "Outros";
  
}

class TransactionIn extends Transaction {

  String nameTransaction = "";
  _TypeTransactionOut? type;
}