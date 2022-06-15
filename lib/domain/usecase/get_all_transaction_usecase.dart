import 'package:expense_app/core/usecase/usecase.dart';
import 'package:expense_app/domain/entity/transaction.dart';
import 'package:expense_app/domain/repository/transaction_repository.dart';

class GetAllTransactionUseCase extends Usecase<List<Transaction>, int>  {
  final TransactionRepository _repository;

  const GetAllTransactionUseCase({
    required TransactionRepository repository,
  }) : _repository = repository;

  @override
  Future<List<Transaction>> call([void param]) async =>  await _repository.getAllTransactions();


}