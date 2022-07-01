import 'package:flutter/material.dart';

class MarginHorizontal extends StatelessWidget {
  final Widget child;
  final double left;
  final double right;

  const MarginHorizontal({
    Key? key,
    required this.child,
    this.left = 22,
    this.right = 22,
  }) : super(key: key);

  const MarginHorizontal.symmetrical({
    Key? key,
    required this.child,
    required double size,
  })  : left = size,
        right = size,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: left, right: right),
      child: child,
    );
  }
}
