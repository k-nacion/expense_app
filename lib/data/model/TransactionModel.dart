import 'package:expense_app/domain/entity/transaction.dart';

class TransactionModel extends Transaction {
  const TransactionModel({required super.id, required super.title, required super.amount, required super.date});

  TransactionModel copyWith({String? id, String? title, double? amount, DateTime? date}) {
    return TransactionModel(
      amount: amount ?? super.amount,
      date: date ?? super.date,
      id: id ?? super.id,
      title: title ?? super.title,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': super.id,
      'title': super.title,
      'amount': super.amount,
      'date': super.date,
    };
  }

  factory TransactionModel.fromMap(Map<String, dynamic> map) {
    return TransactionModel(
      id: map['id'] as String,
      title: map['title'] as String,
      amount: map['amount'] as double,
      date: map['date'] as DateTime,
    );
  }
}
