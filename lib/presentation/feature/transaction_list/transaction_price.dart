import 'package:flutter/material.dart';

class TransactionPrice extends StatelessWidget {
  final double price;

  const TransactionPrice({
    Key? key,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.purple, width: 2),
      ),
      child: Text('\$${price.toStringAsFixed(2)}'),
    );
  }
}
