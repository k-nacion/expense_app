import 'package:flutter/material.dart';

class PaddingHorizontal extends StatelessWidget {
  final Widget child;
  final double left;
  final double right;

  const PaddingHorizontal({
    Key? key,
    required this.child,
    this.left = 22,
    this.right = 22,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: left, right: right),
      child: child,
    );
  }
}
