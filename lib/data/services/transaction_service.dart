import 'package:expense_app/data/model/TransactionModel.dart';

class TransactionService {
  List<TransactionModel> generateMockData() => <TransactionModel>[
        TransactionModel(id: 'id1', title: 'title1', amount: 1.0, date: DateTime.now()),
        TransactionModel(id: 'id2', title: 'title2', amount: 2.0, date: DateTime.now()),
      ];
}
