import 'package:flutter/material.dart';

class MarginAll extends StatelessWidget {
  const MarginAll({
    Key? key,
    required this.child,
    this.top = 18,
    this.bottom = 18,
    this.left = 22,
    this.right = 22,
  }) : super(key: key);

  final Widget child;
  final double top, bottom, left, right;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:
          EdgeInsets.only(top: top, left: left, right: right, bottom: bottom),
      child: child,
    );
  }
}
