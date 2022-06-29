part of 'transaction_chart_bloc.dart';

abstract class TransactionChartEvent extends Equatable {
  const TransactionChartEvent();

  @override
  List<Object?> get props => [];
}

class TransactionChartEventFetchChart extends TransactionChartEvent {
  final List<Transaction> allTransaction;

  const TransactionChartEventFetchChart({
    required this.allTransaction,
  });

  @override
  List<Object> get props => [allTransaction];
}
