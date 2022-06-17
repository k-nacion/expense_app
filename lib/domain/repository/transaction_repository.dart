import 'package:expense_app/domain/entity/transaction.dart';

abstract class TransactionRepository {
  Future<List<Transaction>> getAllTransactions();
  Future<void> addTransaction(Transaction transaction);
  Future<void> deleteTransaction(Transaction transaction);
}
