part of 'transaction_bloc.dart';

abstract class TransactionEvent extends Equatable {
  const TransactionEvent();

  @override
  List<Object> get props => [];
}

class TransactionGetAllTransactionEvent extends TransactionEvent {}

class TransactionAddTransactionEvent extends TransactionEvent {
  final Transaction transaction;

  const TransactionAddTransactionEvent(this.transaction);

  @override
  List<Object> get props => [transaction];
}
