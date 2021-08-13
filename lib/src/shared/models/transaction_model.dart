class Transaction {

  String userId;
  int price;
  DateTime date;
  String transactionName;
  String? transactionDescription;
  String transactionType;
  String transactionCategory;

  Transaction({
    required this.userId,
    required this.price,
    required this.date,
    required this.transactionName,
    this.transactionDescription,
    required this.transactionType,
    required this.transactionCategory,
  });


  @override
  String toString() {
    return 'Transaction(userId: $userId, price: $price, date: $date, transactionName: $transactionName, transactionDescription: $transactionDescription, transactionType: $transactionType, transactionCategory: $transactionCategory)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Transaction &&
      other.userId == userId &&
      other.price == price &&
      other.date == date &&
      other.transactionName == transactionName &&
      other.transactionDescription == transactionDescription &&
      other.transactionType == transactionType &&
      other.transactionCategory == transactionCategory;
  }

  @override
  int get hashCode {
    return userId.hashCode ^
      price.hashCode ^
      date.hashCode ^
      transactionName.hashCode ^
      transactionDescription.hashCode ^
      transactionType.hashCode ^
      transactionCategory.hashCode;
  }
}
