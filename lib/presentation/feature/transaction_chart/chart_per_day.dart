import 'package:expense_app/presentation/widgets/margin_vertical.dart';
import 'package:flutter/material.dart';

class ChartPerDay extends StatelessWidget {
  const ChartPerDay({
    Key? key,
    required this.amountPercentage,
    required this.dateNum,
    required this.dateText,
    this.isToday = false,
  }) : super(key: key);

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
    return Column(
      children: [
        MarginVertical(
          topMargin: 12,
          bottomMargin: 8,
          child: Text(
            '\$',
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
    );
  }
}
