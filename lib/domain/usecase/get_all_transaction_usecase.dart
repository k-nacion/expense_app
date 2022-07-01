import 'package:expense_app/core/usecase/usecase.dart';
import 'package:expense_app/domain/entity/transaction.dart';

class GetAllTransactionUseCase extends Usecase<List<Transaction>, int> {
  GetAllTransactionUseCase({required super.repository});

  @override
  Future<List<Transaction>> call([void param]) async => await repository.getAllTransactions();
}
