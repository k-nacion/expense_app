import 'package:expense_app/presentation/bloc/transaction/transaction_bloc.dart';
import 'package:expense_app/presentation/bloc/transaction_chart/transaction_chart_bloc.dart';
import 'package:expense_app/presentation/feature/transaction_list/transaction_list_item.dart';
import 'package:expense_app/presentation/widgets/margin_horizontal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TransactionListFeature extends StatefulWidget {
  const TransactionListFeature({Key? key}) : super(key: key);

  @override
  State<TransactionListFeature> createState() => _TransactionListFeatureState();
}

class _TransactionListFeatureState extends State<TransactionListFeature> {
  BouncingScrollPhysics bouncingScrollPhysics = const BouncingScrollPhysics();

  @override
  Widget build(BuildContext context) {
    return MarginHorizontal(
      child: BlocBuilder<TransactionBloc, TransactionState>(
        builder: (context, state) {
          if (state is TransactionStateLoading) {
            context.read<TransactionChartBloc>().add(TransactionChartEventRestartState());
            return _buildLoadingState();
          } else if (state is TransactionStateLoaded) {
            return _buildLoadedState(context, state);
          } else {
            return _buildErrorState();
          }
        },
      ),
    );
  }

  Widget _buildLoadingState() => const Center(
        child: CircularProgressIndicator.adaptive(),
      );

  Widget _buildLoadedState(BuildContext context, TransactionStateLoaded stateLoaded) {
    stateLoaded
      ..sortByDate()
      ..reverse();

    final transactions = stateLoaded.transactions;

    context
        .read<TransactionChartBloc>()
        .add(TransactionChartEventFetchChart(allTransaction: transactions));

    return ListView.separated(
        physics: bouncingScrollPhysics,
        itemBuilder: (context, index) =>
            TransactionListItem(transaction: transactions.reversed.elementAt(index)),
        separatorBuilder: (context, index) => const SizedBox(height: 9),
        itemCount: transactions.length);
  }

  Widget _buildErrorState() => const Center(
        child: Text('an error occured during fetching of data'),
      );
}
