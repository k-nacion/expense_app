part of 'transaction_form_cubit.dart';

class TransactionFormState extends Equatable {
  final String titleText;
  final String amountText;

  const TransactionFormState({
    required this.titleText,
    required this.amountText,
  });

  @override
  List<Object> get props => [titleText, amountText];

  TransactionFormState copyWith({
    String? titleText,
    String? amountText,
  }) {
    return TransactionFormState(
      titleText: titleText ?? this.titleText,
      amountText: amountText ?? this.amountText,
    );
  }

  @override
  String toString() {
    return 'TransactionFormState{titleText: $titleText, amountText: $amountText}';
  }
}
