import 'package:expense_app/presentation/bloc/transaction_bloc.dart';
import 'package:expense_app/presentation/feature/transaction_chart/transaction_chart.dart';
import 'package:expense_app/presentation/feature/transaction_input/transaction_input.dart';
import 'package:expense_app/presentation/feature/transaction_list/transaction_list.dart';
import 'package:expense_app/presentation/widgets/margin_all.dart';
import 'package:expense_app/presentation/widgets/margin_horizontal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expense Tracker'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const MarginAll(child: TransactionChartFeature()),
            MarginHorizontal(child: TransactionInput()),
            const Expanded(child: TransactionListFeature()),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    context.read<TransactionBloc>().add(TransactionGetAllTransactionEvent());
  }
}
