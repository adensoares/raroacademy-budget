import 'dart:convert';

class MonthlyBalanceModel {
  String userId;
  final int expenses;
  final int incomes;
  final String month;
  final int total;
  MonthlyBalanceModel({
    required this.userId,
    required this.expenses,
    required this.incomes,
    required this.month,
    required this.total,
  });

  MonthlyBalanceModel copyWith({
    String? userId,
    int? expenses,
    int? incomes,
    String? month,
    int? total,
  }) {
    return MonthlyBalanceModel(
      userId: userId ?? this.userId,
      expenses: expenses ?? this.expenses,
      incomes: incomes ?? this.incomes,
      month: month ?? this.month,
      total: total ?? this.total,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'expenses': expenses,
      'incomes': incomes,
      'month': month,
      'total': total,
    };
  }

  factory MonthlyBalanceModel.fromMap(Map<String, dynamic> map) {
    return MonthlyBalanceModel(
      userId: map['userId'],
      expenses: map['expenses'],
      incomes: map['incomes'],
      month: map['month'],
      total: map['total'],
    );
  }

  String toJson() => json.encode(toMap());

  factory MonthlyBalanceModel.fromJson(String source) => MonthlyBalanceModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'MonthlyBalanceModel(userId: $userId, expenses: $expenses, incomes: $incomes, month: $month, total: $total)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is MonthlyBalanceModel &&
      other.userId == userId &&
      other.expenses == expenses &&
      other.incomes == incomes &&
      other.month == month &&
      other.total == total;
  }

  @override
  int get hashCode {
    return userId.hashCode ^
      expenses.hashCode ^
      incomes.hashCode ^
      month.hashCode ^
      total.hashCode;
  }
}
