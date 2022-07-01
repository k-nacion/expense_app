import 'package:expense_app/domain/entity/transaction.dart';
import 'package:expense_app/presentation/bloc/transaction/transaction_bloc.dart';
import 'package:expense_app/presentation/feature/transaction_list/transaction_price.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class TransactionListItem extends StatelessWidget {
  final Transaction transaction;

  const TransactionListItem({
    Key? key,
    required this.transaction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dateFormatter = DateFormat();

    return Dismissible(
      onDismissed: (direction) =>
          {context.read<TransactionBloc>().add(TransactionEventDeleteTransaction(transaction))},
      key: ObjectKey(transaction),
      direction: DismissDirection.startToEnd,
      child: Card(
        elevation: 4,
        child: ListTile(
          leading: TransactionPrice(price: transaction.amount),
          title: Text(transaction.title),
          subtitle: Text(dateFormatter.format(transaction.date)),
          // subtitle: Text(),
        ),
      ),
    );
  }
}
