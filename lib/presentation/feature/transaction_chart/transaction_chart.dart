import 'dart:math';

import 'package:flutter/material.dart';

class TransactionChartFeature extends StatelessWidget {
  const TransactionChartFeature({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
      child: Container(
        alignment: Alignment.center,
        height: 150,
        child: const Text('Expense Chart'),
      ),
    );
  }
}
