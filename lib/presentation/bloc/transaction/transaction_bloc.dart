import 'dart:async';
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
  final Usecase<void, Transaction> _deleteTransactionUsecase;

  TransactionBloc({
    required Usecase<List<Transaction>, void> getTransactionsUseCase,
    required Usecase<void, Transaction> addTransactionUseCase,
    required Usecase<void, Transaction> deleteTransactionUseCase,
  })  : _getAllTransactionsUsecase = getTransactionsUseCase,
        _addTransactionUsecase = addTransactionUseCase,
        _deleteTransactionUsecase = deleteTransactionUseCase,
        super(TransactionStateLoading()) {
    on<TransactionEventGetAllTransactions>(_mapGetAllTransactionToEvent);
    on<TransactionEventAddTransaction>(_mapAddTransactionEventToState);
    on<TransactionEventDeleteTransaction>(_mapEventDeleteToState);
  }

  Future<void> _mapGetAllTransactionToEvent(
    TransactionEventGetAllTransactions event,
    Emitter<TransactionState> emit,
  ) async {
    emit(TransactionStateLoading());

    await Future.delayed(Duration(seconds: Random().nextInt(3)));
    final transactionList = await _getAllTransactionsUsecase();
    emit(TransactionStateLoaded(transactionList));
  }

  Future<void> _mapAddTransactionEventToState(
    TransactionEventAddTransaction event,
    Emitter<TransactionState> emit,
  ) async {
    final transaction = event.transaction;
    await _addTransactionUsecase(transaction);
    add(TransactionEventGetAllTransactions());
  }

  void _mapEventDeleteToState(
    TransactionEventDeleteTransaction event,
    Emitter<TransactionState> emit,
  ) async {
    await _deleteTransactionUsecase(event.transaction);
    add(TransactionEventGetAllTransactions());
  }
}
