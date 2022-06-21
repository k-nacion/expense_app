import 'package:expense_app/data/repository/transaction_repository_impl.dart';
import 'package:expense_app/data/services/transaction_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

// class MockTransactionRepositoryImpl extends Mock implements TransactionRepositoryImpl {}
class MockTransactionService extends Mock implements TransactionService {}

void main() {
  late MockTransactionService service;
  late TransactionRepositoryImpl repository;

  setUp(() {
    service = MockTransactionService();
    repository = TransactionRepositoryImpl(service);
  });

  test(
    'should be singleton',
    () async {
      //ARRANGE
      final newRepository = TransactionRepositoryImpl(service);

      //ACT

      //ASSERT

      expect(repository, newRepository);
    },
  );
}
