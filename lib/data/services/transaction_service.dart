import 'dart:math';

import 'package:expense_app/data/model/TransactionModel.dart';
import 'package:expense_app/domain/entity/transaction.dart';
import 'package:flutter_lorem/flutter_lorem.dart';

class TransactionService {
  TransactionService._();

  static final TransactionService _instance = TransactionService._();

  factory TransactionService() => _instance;

  final List<Transaction> _data = List<Transaction>.generate(10, (index) {
    final title = lorem(paragraphs: 1, words: 3);
    final amount = (Random().nextDouble() + 1) * 1000;
    final date = DateTime.now().subtract(
      Duration(
        days: Random().nextInt(10),
      ),
    );

    return TransactionModel(title: title, amount: amount, date: date);
  });

  List<Transaction> get data => _data;

  void addTransaction(Transaction transaction) => _data.add(transaction);
}
