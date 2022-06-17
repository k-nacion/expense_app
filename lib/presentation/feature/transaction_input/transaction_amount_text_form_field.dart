import 'package:expense_app/presentation/bloc/transaction_form_cubit/transaction_form_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TransactionAmountTextFormField extends StatelessWidget {
  const TransactionAmountTextFormField({
    Key? key,
    required this.amountController,
  }) : super(key: key);

  final TextEditingController amountController;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransactionFormCubit, TransactionFormState>(
      builder: (context, state) {
        return TextFormField(
          onSaved: (newValue) =>
              context.read<TransactionFormCubit>().setAmount(newValue!),
          keyboardType: const TextInputType.numberWithOptions(
              decimal: true, signed: true),
          decoration: const InputDecoration(
            labelText: 'Amount',
            border: OutlineInputBorder(),
          ),
          textInputAction: TextInputAction.done,
          validator: (value) => value == null || value.isEmpty
              ? 'Must have an amount value'
              : null,
        );
      },
    );
  }
}
