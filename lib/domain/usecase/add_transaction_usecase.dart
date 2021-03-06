import 'package:expense_app/core/usecase/usecase.dart';
import 'package:expense_app/domain/entity/transaction.dart';

class AddTransactionUseCase extends Usecase<void, Transaction> {
  AddTransactionUseCase({required super.repository});

  @override
  Future<void> call([Transaction? param]) async {
    assert(param != null);
    await repository.addTransaction(param!);
  }
}
