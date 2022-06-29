part of 'transaction_chart_bloc.dart';

abstract class TransactionChartState extends Equatable {
  static double maximumExpenseLimit = 5000;

  const TransactionChartState();

  @override
  List<Object?> get props => [maximumExpenseLimit];
}

class TransactionChartInitial extends TransactionChartState {}

class TransactionChartStateLoading extends TransactionChartState {}

class TransactionChartStateError extends TransactionChartState {
  final String? message;

  const TransactionChartStateError([this.message]);

  @override
  String toString() {
    return 'TransactionChartStateError{message: $message}';
  }

  @override
  List<Object?> get props => [message];
}

class TransactionChartStateLoaded extends TransactionChartState {
  final List<Map<DateTime, double>> oneWeekTransaction;

  const TransactionChartStateLoaded({
    required this.oneWeekTransaction,
  });

  @override
  List<Object> get props => [oneWeekTransaction];
}
