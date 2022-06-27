import 'package:expense_app/presentation/widgets/margin_vertical.dart';
import 'package:flutter/material.dart';

class ChartPerDay extends StatelessWidget {
  const ChartPerDay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textColor = Theme.of(context).colorScheme.primary;
    return Column(
      children: [
        MarginVertical(
          bottomMargin: 0,
          child: Text(
            '\$',
            style: TextStyle(color: textColor),
          ),
        ),
        const Expanded(
          child: MarginVertical(

            child: RotatedBox(
              quarterTurns: 3,
              child: LinearProgressIndicator(
                backgroundColor: Colors.black,
                value: .3,
              ),
            ),
          ),
        ),
        Text(
          'T',
          style: TextStyle(color: textColor),
        ),
      ],
    );
  }
}
