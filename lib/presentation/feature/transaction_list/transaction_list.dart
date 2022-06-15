import 'package:expense_app/presentation/bloc/transaction_bloc.dart';
import 'package:expense_app/presentation/feature/transaction_list/transaction_list_item.dart';
import 'package:expense_app/presentation/widgets/margin_horizontal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TransactionListFeature extends StatelessWidget {
  const TransactionListFeature({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MarginHorizontal(
      child: BlocBuilder<TransactionBloc, TransactionState>(
        builder: (context, state) {
          if (state is TransactionLoadingState) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          } else {
            final transactionList = state as TransactionLoadedState;

            return ListView.separated(
                itemBuilder: (context, index) => TransactionListItem(
                    transaction: transactionList.transactions[index]),
                separatorBuilder: (context, index) => const SizedBox(height: 9),
                itemCount: transactionList.transactions.length);
          }
        },
      ),
    );
  }
}
