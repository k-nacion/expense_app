import 'package:expense_app/data/services/transaction_service.dart';
import 'package:expense_app/domain/entity/transaction.dart';
import 'package:expense_app/domain/repository/transaction_repository.dart';

class TransactionRepositoryImpl implements TransactionRepository {
  final TransactionService _service;

  const TransactionRepositoryImpl._(this._service);

  factory TransactionRepositoryImpl(TransactionService service) =>
      TransactionRepositoryImpl._(service);

  @override
  Future<List<Transaction>> getAllTransactions() async => _service.data;

  @override
  Future<void> addTransaction(Transaction transaction) async =>
      _service.addTransaction(transaction);

  @override
  Future<void> deleteTransaction(Transaction transaction) async =>
      _service.deleteTransaction(transaction);
}
