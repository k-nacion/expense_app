import 'package:expense_app/presentation/widgets/padding_vertical.dart';
import 'package:flutter/material.dart';

class TransactionInput extends StatelessWidget {
  TransactionInput({Key? key}) : super(key: key);

  final TextEditingController titleEditingController = TextEditingController();
  final TextEditingController amountEditingController = TextEditingController();

  final globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return PaddingVertical(
      child: Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        key: globalKey,
        child: Card(
          elevation: 6,
          child: Column(
            children: [
              TextFormField(
                validator: (value) =>
                    value == null || value.isEmpty ? 'Must have a title' : null,
                controller: titleEditingController,
                decoration: const InputDecoration(
                  labelText: 'Title',
                  border: OutlineInputBorder(),
                ),
              ),
              TextFormField(
                validator: (value) => value == null || value.isEmpty
                    ? 'Must have an amount value'
                    : null,
                controller: amountEditingController,
                decoration: const InputDecoration(
                  labelText: 'Amount',
                  border: OutlineInputBorder(),
                ),
              ),
              TextButton(
                onPressed: () {
                  final isValid = globalKey.currentState?.validate();
                  if (isValid ?? false) globalKey.currentState?.save();
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
