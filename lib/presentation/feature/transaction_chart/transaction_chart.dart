import 'package:expense_app/presentation/feature/transaction_chart/chart_per_day.dart';
import 'package:flutter/material.dart';

class TransactionChartFeature extends StatelessWidget {
  const TransactionChartFeature({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.secondary,
      child: InkWell(
        onTap: () {},
        child: Container(
          height: 150,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              ChartPerDay(),
              ChartPerDay(),
              ChartPerDay(),
              ChartPerDay(),
              ChartPerDay(),
              ChartPerDay(),
              ChartPerDay(),
            ],
          ),
        ),
      ),
    );
  }
}
