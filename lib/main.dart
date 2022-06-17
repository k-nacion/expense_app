import 'package:expense_app/core/config/app_theme.dart';
import 'package:expense_app/data/repository/transaction_repository_impl.dart';
import 'package:expense_app/data/services/transaction_service.dart';
import 'package:expense_app/domain/usecase/add_transaction_usecase.dart';
import 'package:expense_app/domain/usecase/get_all_transaction_usecase.dart';
import 'package:expense_app/presentation/bloc/transaction/transaction_bloc.dart';
import 'package:expense_app/presentation/bloc/transaction_form_cubit/transaction_form_cubit.dart';
import 'package:expense_app/presentation/page/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(const ExpenseTrackerApp());

class ExpenseTrackerApp extends StatelessWidget {
  const ExpenseTrackerApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));

    final transactionRepository =
        TransactionRepositoryImpl(TransactionService());

    return MultiBlocProvider(
      providers: <BlocProvider>[
        BlocProvider<TransactionBloc>(
          create: (context) => TransactionBloc(
            getTransactionsUseCase:
                GetAllTransactionUseCase(repository: transactionRepository),
            addTransactionUseCase:
                AddTransactionUseCase(repository: transactionRepository),
          ),
        ),
        BlocProvider<TransactionFormCubit>(
          create: (context) => TransactionFormCubit(),
        ),
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
