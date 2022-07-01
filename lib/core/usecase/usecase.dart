import 'package:expense_app/domain/repository/transaction_repository.dart';

/// [Usecase<ReturnType, ParamType>]
abstract class Usecase<ReturnType, ParamType> {
  final TransactionRepository repository;

  const Usecase({required this.repository});

  Future<ReturnType> call([ParamType? param]);
}
