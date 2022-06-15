part of 'transaction_bloc.dart';

abstract class TransactionState extends Equatable {
  const TransactionState();

  @override
  List<Object> get props => [];
}

class TransactionLoadingState extends TransactionState {}

class TransactionLoadedState extends TransactionState {
  final List<Transaction> transactions;

  const TransactionLoadedState(this.transactions);

  @override
  List<Object> get props => [transactions];
}

