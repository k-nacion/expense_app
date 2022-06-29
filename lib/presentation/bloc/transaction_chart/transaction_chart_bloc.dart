import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:expense_app/domain/entity/transaction.dart';

part 'transaction_chart_event.dart';
part 'transaction_chart_state.dart';

class TransactionChartBloc extends Bloc<TransactionChartEvent, TransactionChartState> {
  TransactionChartBloc() : super(TransactionChartStateLoading()) {
    on<TransactionChartEventFetchChart>((event, emit) => _mapEventFetchDataToState(event, emit));
    on<TransactionChartEventRestartState>(
        (event, emit) => _mapEventRestartStateToState(event, emit));
  }

  void _mapEventFetchDataToState(
    TransactionChartEventFetchChart event,
    Emitter<TransactionChartState> emit,
  ) async {
    emit(TransactionChartStateLoading());

    final oneWeekAgoBreakpoint = DateTime.now().subtract(const Duration(days: 7));

    final oneWeekTransaction = event.allTransaction
        .where((element) => element.date.isAfter(oneWeekAgoBreakpoint) ? true : false)
        .toList(growable: false);

    final List<Map<DateTime, double>> totalExpenseInWeek = [];

    for (int index = 0; index < 7; index++) {
      final dayFromOneWeek = oneWeekAgoBreakpoint.add(Duration(days: index));

      double totalExpenseInOneDay = oneWeekTransaction.fold<double>(
          0.0,
          (previousValue, element) => element.date.weekday == dayFromOneWeek.weekday
              ? previousValue + element.amount
              : previousValue);
      /*for (final transaction in oneWeekTransaction) {
        if (transaction.date.weekday == dayFromOneWeek.weekday) {
          totalExpenseInOneDay += transaction.amount;
        }
        continue;
      }*/

      totalExpenseInWeek.add({dayFromOneWeek: totalExpenseInOneDay});
    }

    emit(TransactionChartStateLoaded(oneWeekTransaction: totalExpenseInWeek));
  }

  void _mapEventRestartStateToState(
    TransactionChartEventRestartState event,
    Emitter<TransactionChartState> emit,
  ) async {
    emit(TransactionChartStateLoading());
    await Future.delayed(Duration(seconds: Random().nextInt(3)));
  }
}
