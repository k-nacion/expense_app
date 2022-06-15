import 'package:flutter/material.dart';

class MarginVertical extends StatelessWidget {

  final Widget child;
  final double topMargin;
  final double bottomMargin;

  const MarginVertical({
    Key? key,
    required this.child,
    this.topMargin = 18,
    this.bottomMargin = 18,
  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: topMargin, bottom: bottomMargin),
      child: child,
    );
  }
}
