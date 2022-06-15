import 'package:flutter/material.dart';

class PaddingVertical extends StatelessWidget {
  final Widget child;
  final double topMargin;
  final double bottomMargin;

  const PaddingVertical({
    Key? key,
    required this.child,
    this.topMargin = 18,
    this.bottomMargin = 18,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: topMargin, bottom: bottomMargin),
      child: child,
    );
  }
}
