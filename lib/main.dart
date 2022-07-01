import 'package:expense_app/core/config/app_theme.dart';
import 'package:expense_app/data/repository/transaction_repository_impl.dart';
import 'package:expense_app/data/services/transaction_service.dart';
import 'package:expense_app/domain/usecase/add_transaction_usecase.dart';
import 'package:expense_app/domain/usecase/delete_transaction_usecase.dart';
import 'package:expense_app/domain/usecase/get_all_transaction_usecase.dart';
import 'package:expense_app/presentation/bloc/transaction/transaction_bloc.dart';
import 'package:expense_app/presentation/bloc/transaction_chart/transaction_chart_bloc.dart';
import 'package:expense_app/presentation/bloc/transaction_form_cubit/transaction_form_cubit.dart';
import 'package:expense_app/presentation/page/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(const ExpenseTrackerApp());

class ExpenseTrackerApp extends StatelessWidget {
  const ExpenseTrackerApp({Key? key}) : super(key: key);

  static final _transactionRepository = TransactionRepositoryImpl(TransactionService());

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));

    return MultiBlocProvider(
      providers: <BlocProvider>[
        BlocProvider<TransactionBloc>(
          create: (context) => TransactionBloc(
            getTransactionsUseCase: GetAllTransactionUseCase(repository: _transactionRepository),
            addTransactionUseCase: AddTransactionUseCase(repository: _transactionRepository),
            deleteTransactionUseCase: DeleteTransactionUseCase(repository: _transactionRepository),
          ),
        ),
        BlocProvider<TransactionFormCubit>(
          create: (context) => TransactionFormCubit(),
        ),
        BlocProvider<TransactionChartBloc>(
          create: (context) => TransactionChartBloc(),
        )
      ],
      child: MaterialApp(
        title: 'Expense Tracker',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.getLightTheme(),
        // darkTheme: AppTheme.getDarkTheme(),
        home: const Homepage(),
      ),
    );
  }
}
