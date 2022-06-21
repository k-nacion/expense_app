import 'package:expense_app/data/model/TransactionModel.dart';
import 'package:expense_app/domain/entity/transaction.dart';

class TransactionService {
  TransactionService._();

  static final TransactionService _instance = TransactionService._();

  factory TransactionService() => _instance;

  final List<Transaction> _data = <Transaction>[
    TransactionModel(title: 'title1', amount: 1.0, date: DateTime.now()),
    TransactionModel(title: 'title2', amount: 2.0, date: DateTime.now()),
  ];

  List<Transaction> get data => _data;

  void addTransaction(Transaction transaction) => _data.add(transaction);
}
