import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'transaction_form_state.dart';

class TransactionFormCubit extends Cubit<TransactionFormState> {
  TransactionFormCubit()
      : super(
          TransactionFormState(
            titleText: '',
            amountText: '',
            transactionDate: DateTime.now(),
          ),
        );

  void setTitle(String title) => emit(state.copyWith(titleText: title));

  void setAmount(String amount) => emit(state.copyWith(amountText: amount));

  void setTransactionDate(DateTime dateTime) => emit(state.copyWith(transactionDate: dateTime));
}
