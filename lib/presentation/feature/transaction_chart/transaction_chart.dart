import 'package:expense_app/domain/entity/chart_day.dart';
import 'package:expense_app/presentation/bloc/transaction_chart/transaction_chart_bloc.dart';
import 'package:expense_app/presentation/feature/transaction_chart/chart_per_day.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class TransactionChartFeature extends StatelessWidget {
  const TransactionChartFeature({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Text(
            '7 Day Total Expenses',
            style: GoogleFonts.quicksand().copyWith(fontSize: 20),
          ),
        ),
        Card(
          color: Theme.of(context).colorScheme.secondary,
          child: InkWell(
            onTap: () {},
            child: SizedBox(
              height: 150,
              child: BlocBuilder<TransactionChartBloc, TransactionChartState>(
                builder: (context, state) {
                  if (state is TransactionChartStateLoading) {
                    return _buildLoadingState();
                  } else if (state is TransactionChartStateLoaded) {
                    return _buildLoadedState(context, state);
                  } else {
                    return _buildErrorState();
                  }
                },
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLoadingState() => const Center(child: CircularProgressIndicator.adaptive());

  Widget _buildLoadedState(BuildContext context, TransactionChartStateLoaded state) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: state.oneWeekTransaction
            .map((e) => ChartPerDay(
                totalSpendingForTheDay: e.values.single,
                amountPercentage: e.values.single / TransactionChartState.maximumExpenseLimit,
                dateNum: e.keys.single.day.toString(),
                dateText: ChartDay.values[e.keys.single.weekday - 1].name))
            .toList(),
      );

  Widget _buildErrorState() => const Center(child: Text('There are problems fetching the chart'));
}
