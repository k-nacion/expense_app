import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:expense_app/core/usecase/usecase.dart';
import 'package:expense_app/domain/entity/transaction.dart';

part 'transaction_event.dart';
part 'transaction_state.dart';

class TransactionBloc extends Bloc<TransactionEvent, TransactionState> {
  final Usecase<List<Transaction>, void> _getAllTransactionsUsecase;
  final Usecase<void, Transaction> _addTransactionUsecase;

  TransactionBloc(
      {required Usecase<List<Transaction>, void> getTransactionsUseCase,
      required Usecase<void, Transaction> addTransactionUseCase})
      : _getAllTransactionsUsecase = getTransactionsUseCase,
        _addTransactionUsecase = addTransactionUseCase,
        super(TransactionLoadingState()) {
    on<TransactionGetAllTransactionEvent>(
        (event, emit) => _mapGetAllTransactionToEvent(event, emit));
    on<TransactionAddTransactionEvent>(
        (event, emit) => _mapAddTransactionEventToState(event, emit));
  }

  void _mapGetAllTransactionToEvent(TransactionGetAllTransactionEvent event,
      Emitter<TransactionState> emit) async {
    await Future.delayed(const Duration(milliseconds: 5000));
    final transactionList = await _getAllTransactionsUsecase();
    emit(TransactionLoadedState(transactionList));
  }

  void _mapAddTransactionEventToState(TransactionAddTransactionEvent event,
      Emitter<TransactionState> emit) async {
    final transaction = event.transaction;
    await _addTransactionUsecase(transaction);
  }
}
