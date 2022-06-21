import 'package:expense_app/data/model/TransactionModel.dart';
import 'package:expense_app/presentation/bloc/transaction/transaction_bloc.dart';
import 'package:expense_app/presentation/bloc/transaction_form_cubit/transaction_form_cubit.dart';
import 'package:expense_app/presentation/feature/transaction_input/transaction_amount_text_form_field.dart';
import 'package:expense_app/presentation/feature/transaction_input/transaction_title_text_form_field.dart';
import 'package:expense_app/presentation/widgets/margin_vertical.dart';
import 'package:expense_app/presentation/widgets/padding_vertical.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TransactionInput extends StatelessWidget {
  const TransactionInput({Key? key}) : super(key: key);

  static final globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return PaddingVertical(
      child: Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        key: globalKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const MarginVertical(
                topMargin: 0,
                child: TransactionTitleTextFormField(),
              ),
              const MarginVertical(
                topMargin: 0,
                child: TransactionAmountTextFormField(),
              ),
              TextButton(
                onPressed: () {
                  globalKey.currentState!.save();
                  final cubitState = context.read<TransactionFormCubit>().state;
                  final transaction = TransactionModel(
                      title: cubitState.titleText,
                      amount: double.parse(cubitState.amountText),
                      date: DateTime.now());
                  context
                      .read<TransactionBloc>()
                      .add(TransactionEventAddTransaction(transaction));
                },
                child: const Text('Add transaction'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
