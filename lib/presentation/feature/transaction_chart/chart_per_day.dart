import 'package:expense_app/presentation/widgets/margin_vertical.dart';
import 'package:flutter/material.dart';

class ChartPerDay extends StatelessWidget {
  const ChartPerDay({
    Key? key,
    required this.amountPercentage,
    required this.dateNum,
    required this.dateText,
    required this.totalSpendingForTheDay,
    this.isToday = false,
  }) : super(key: key);

  ///The total spending per day.
  final double totalSpendingForTheDay;

  /// the percentage of the total spending. Value should be between [0.0] and [1.0].
  final double amountPercentage;

  /// This property represent the weekday of the day and will show up in the [above] part.
  final String dateText;

  /// this property represent the numerical value of the day in the month. Will show up below the [dateText] property.
  final String dateNum;

  /// This property will be the flag representation if the day is the current day.
  final bool isToday;

  @override
  Widget build(BuildContext context) {
    final textColor = Theme.of(context).colorScheme.primary;
    return Flexible(
      child: Column(
        children: [
          MarginVertical(
            topMargin: 12,
            bottomMargin: 8,
            child: Text(
              '\$${totalSpendingForTheDay.toStringAsFixed(0)}',
              style: TextStyle(color: textColor),
            ),
          ),
          Expanded(
            child: RotatedBox(
              quarterTurns: 3,
              child: LinearProgressIndicator(
                backgroundColor: Colors.black,
                value: amountPercentage,
              ),
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                dateText,
                style: TextStyle(color: textColor),
              ),
              Text(
                dateNum,
                style: TextStyle(
                    color: isToday
                        ? Theme.of(context).floatingActionButtonTheme.backgroundColor
                        : textColor),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
