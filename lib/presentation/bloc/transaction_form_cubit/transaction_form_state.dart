part of 'transaction_form_cubit.dart';

class TransactionFormState extends Equatable {
  final String titleText;
  final String amountText;
  final DateTime transactionDate;

  const TransactionFormState({
    required this.titleText,
    required this.amountText,
    required this.transactionDate,
  });

  @override
  List<Object> get props => [titleText, amountText, transactionDate];

  TransactionFormState copyWith({
    String? titleText,
    String? amountText,
    DateTime? transactionDate,
  }) {
    return TransactionFormState(
      titleText: titleText ?? this.titleText,
      amountText: amountText ?? this.amountText,
      transactionDate: transactionDate ?? this.transactionDate,
    );
  }
}
