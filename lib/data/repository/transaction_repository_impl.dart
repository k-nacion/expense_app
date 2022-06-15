import 'package:expense_app/data/services/transaction_service.dart';
import 'package:expense_app/domain/entity/transaction.dart';
import 'package:expense_app/domain/repository/transaction_repository.dart';

class TransactionRepositoryImpl implements TransactionRepository {
  final TransactionService _service;

  const TransactionRepositoryImpl(this._service);

  @override
  Future<List<Transaction>> getAllTransactions() async => _service.generateMockData();

  @override
  Future<bool> addTransaction(Transaction transaction) {
    // TODO: implement addTransaction
    throw UnimplementedError();
  }

  @override
  Future<void> deleteTransaction(Transaction transaction) {
    // TODO: implement deleteTransaction
    throw UnimplementedError();
  }
}
