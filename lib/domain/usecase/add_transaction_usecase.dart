import 'package:expense_app/core/usecase/usecase.dart';
import 'package:expense_app/domain/entity/transaction.dart';
import 'package:expense_app/domain/repository/transaction_repository.dart';

class AddTransactionUseCase extends Usecase<void, Transaction> {
  final TransactionRepository _repository;

  @override
  Future<void> call([Transaction? param]) async {
    assert(param != null);
    await _repository.addTransaction(param!);
  }

  const AddTransactionUseCase({
    required TransactionRepository repository,
  }) : _repository = repository;
}
