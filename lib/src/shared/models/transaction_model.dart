import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class TransactionModel {

  String userId;
  int price;
  Timestamp date;
  String transactionName;
  String? transactionDescription;
  String transactionType;
  String transactionCategory;

  TransactionModel({
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
  
    return other is TransactionModel &&
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

  TransactionModel copyWith({
    String? userId,
    int? price,
    Timestamp? date,
    String? transactionName,
    String? transactionDescription,
    String? transactionType,
    String? transactionCategory,
  }) {
    return TransactionModel(
      userId: userId ?? this.userId,
      price: price ?? this.price,
      date: date ?? this.date,
      transactionName: transactionName ?? this.transactionName,
      transactionDescription: transactionDescription ?? this.transactionDescription,
      transactionType: transactionType ?? this.transactionType,
      transactionCategory: transactionCategory ?? this.transactionCategory,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'price': price,
      'date': date.millisecondsSinceEpoch,
      'transactionName': transactionName,
      'transactionDescription': transactionDescription,
      'transactionType': transactionType,
      'transactionCategory': transactionCategory,
    };
  }

  factory TransactionModel.fromMap(Map<String, dynamic> map) {
    return TransactionModel(
      userId: map['userId'],
      price: map['price'],
      date: map['date'],
      transactionName: map['transactionName'],
      transactionDescription: map['transactionDescription'],
      transactionType: map['transactionType'],
      transactionCategory: map['transactionCategory'],
    );
  }

  String toJson() => json.encode(toMap());

  factory TransactionModel.fromJson(String source) => TransactionModel.fromMap(json.decode(source));
}
