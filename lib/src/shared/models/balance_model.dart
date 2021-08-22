import 'dart:convert';

class MonthlyBalanceModel {
  final int expenses;
  final int incomes;
  final String month;
  final int total;
  MonthlyBalanceModel({
    required this.expenses,
    required this.incomes,
    required this.month,
    required this.total,
  });

  MonthlyBalanceModel copyWith({
    int? expenses,
    int? incomes,
    String? month,
    int? total,
  }) {
    return MonthlyBalanceModel(
      expenses: expenses ?? this.expenses,
      incomes: incomes ?? this.incomes,
      month: month ?? this.month,
      total: total ?? this.total,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'expenses': expenses,
      'incomes': incomes,
      'month': month,
      'total': total,
    };
  }

  factory MonthlyBalanceModel.fromMap(Map<String, dynamic> map) {
    return MonthlyBalanceModel(
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
    return 'MonthlyBalanceModel(expenses: $expenses, incomes: $incomes, month: $month, total: $total)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is MonthlyBalanceModel &&
      other.expenses == expenses &&
      other.incomes == incomes &&
      other.month == month &&
      other.total == total;
  }

  @override
  int get hashCode {
    return expenses.hashCode ^
      incomes.hashCode ^
      month.hashCode ^
      total.hashCode;
  }
}
