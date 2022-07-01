import 'package:expense_app/core/usecase/usecase.dart';
import 'package:expense_app/domain/entity/transaction.dart';

class DeleteTransactionUseCase extends Usecase<void, Transaction> {
  DeleteTransactionUseCase({required super.repository});

  @override
  Future<void> call([Transaction? param]) async {
    assert(param != null);
    await repository.deleteTransaction(param!);
  }
}
