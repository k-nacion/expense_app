import 'dart:developer';

import 'package:expense_app/presentation/bloc/transaction_form_cubit/transaction_form_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TransactionTitleTextFormField extends StatelessWidget {
  const TransactionTitleTextFormField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransactionFormCubit, TransactionFormState>(
      builder: (context, state) {
        return TextFormField(
          onSaved: (newValue) {
            context.read<TransactionFormCubit>().setTitle(newValue ?? '');
            log(context.read<TransactionFormCubit>().state.toString());
          },
          validator: (value) =>
              value == null || value.isEmpty ? 'Must have a title' : null,
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.text,
          decoration: const InputDecoration(
            labelText: 'Title',
            border: OutlineInputBorder(),
          ),
        );
      },
    );
  }
}
