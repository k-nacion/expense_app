part of 'transaction_bloc.dart';

abstract class TransactionEvent extends Equatable {
  const TransactionEvent();

  @override
  List<Object> get props => [];
}

class TransactionEventGetAllTransactions extends TransactionEvent {}

class TransactionEventAddTransaction extends TransactionEvent {
  final TransactionModel transaction;

  const TransactionEventAddTransaction(this.transaction);

  @override
  List<Object> get props => [transaction];
}
