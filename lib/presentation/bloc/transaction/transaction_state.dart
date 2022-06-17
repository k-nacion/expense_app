part of 'transaction_bloc.dart';

abstract class TransactionState extends Equatable {
  const TransactionState();

  @override
  List<Object?> get props => [];
}

class TransactionStateLoading extends TransactionState {}

class TransactionStateLoaded extends TransactionState {
  final List<Transaction> transactions;

  const TransactionStateLoaded(this.transactions);

  @override
  List<Object> get props => [transactions];
}

class TransactionStateOnError extends TransactionState {
  final String? message;

  const TransactionStateOnError([this.message]);

  @override
  String toString() {
    return 'TransactionStateOnError{message: $message}';
  }

  @override
  List<Object?> get props => [message];
}
