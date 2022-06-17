import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:expense_app/core/usecase/usecase.dart';
import 'package:expense_app/data/model/TransactionModel.dart';
import 'package:expense_app/domain/entity/transaction.dart';

part 'transaction_event.dart';
part 'transaction_state.dart';

class TransactionBloc extends Bloc<TransactionEvent, TransactionState> {
  final Usecase<List<Transaction>, void> _getAllTransactionsUsecase;
  final Usecase<void, Transaction> _addTransactionUsecase;

  TransactionBloc({
    required Usecase<List<Transaction>, void> getTransactionsUseCase,
    required Usecase<void, Transaction> addTransactionUseCase,
  })  : _getAllTransactionsUsecase = getTransactionsUseCase,
        _addTransactionUsecase = addTransactionUseCase,
        super(TransactionStateLoading()) {
    on<TransactionEventGetAllTransactions>(
        (event, emit) => _mapGetAllTransactionToEvent(event, emit));
    on<TransactionEventAddTransaction>(
        (event, emit) => _mapAddTransactionEventToState(event, emit));
  }

  void _mapGetAllTransactionToEvent(
    TransactionEventGetAllTransactions event,
    Emitter<TransactionState> emit,
  ) async {
    emit(TransactionStateLoading());

    await Future.delayed(Duration(seconds: Random().nextInt(3)));
    final transactionList = await _getAllTransactionsUsecase();
    emit(TransactionStateLoaded(transactionList));
  }

  void _mapAddTransactionEventToState(
    TransactionEventAddTransaction event,
    Emitter<TransactionState> emit,
  ) async {
    final transaction = event.transaction;
    await _addTransactionUsecase(transaction);
    add(TransactionEventGetAllTransactions());
  }
}
