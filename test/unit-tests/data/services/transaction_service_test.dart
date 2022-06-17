import 'package:expense_app/data/services/transaction_service.dart';
import 'package:expense_app/domain/entity/transaction.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockTransactionService extends Mock implements TransactionService {}

class FakeTransaction extends Fake implements Transaction {}

void main() {
  group('transaction_service.dart', () {
    late TransactionService sut;

    setUp(() {
      sut = MockTransactionService();
    });
    
    setUpAll(() => registerFallbackValue(FakeTransaction()));

    final tList = <Transaction>[
      Transaction(title: 'title', amount: 1.0, date: DateTime(2022)),
    ];

    final tTransaction = Transaction(title: 'title1', amount: 2.0, date: DateTime(2021));

    test(
      'should return a list of mock data',
      () async {
        //ARRANGE
        when(() => sut.data).thenReturn(tList);
        //ACT
        final data = sut.data;
        //ASSERT
        expect(tList, data);
      },
    );

    test(
      'should be able to add a transaction',
      () async {
        //ARRANGE
        final tListCopy = tList;

        //ACT
        sut.addTransaction(tTransaction);
        //ASSERT
        expect(actual, matcher)
      },
    );
  });
}
