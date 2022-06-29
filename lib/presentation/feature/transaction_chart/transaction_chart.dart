import 'package:expense_app/presentation/bloc/transaction_chart/transaction_chart_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TransactionChartFeature extends StatefulWidget {
  const TransactionChartFeature({Key? key}) : super(key: key);

  @override
  State<TransactionChartFeature> createState() =>
      _TransactionChartFeatureState();
}

class _TransactionChartFeatureState extends State<TransactionChartFeature> {
  @override
  void initState() {
    super.initState();
    // Add code after super
  }

  @override
  Widget build(BuildContext context) {
    return Card(
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
                return _buildLoadedState();
              } else {
                return _buildErrorState();
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _buildLoadingState() =>
      const Center(child: CircularProgressIndicator.adaptive());

  Widget _buildLoadedState() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [],
      );

  Widget _buildErrorState() =>
      const Center(child: Text('There are problems fetching the chart'));
}
