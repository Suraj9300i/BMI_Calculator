import 'package:flutter/material.dart';

class ReUsableCard extends StatelessWidget {
  ReUsableCard({@required this.color,this.cardChild});
  final Widget cardChild;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: color,
      ),
      child: cardChild,
    );
  }
}
