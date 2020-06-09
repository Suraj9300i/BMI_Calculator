import 'package:flutter/material.dart';

import 'Constants.dart';

class RoundedButton extends StatelessWidget {
  RoundedButton({this.icon,this.onTapButton});
  final IconData icon;
  final Function onTapButton;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: CircleAvatar(
        radius: 30.0,
        child: Icon(icon,color: Colors.white,size: 40.0,),
        backgroundColor: kRoundedButtonClr,
      ),
      onTap: onTapButton,
    );
  }
}
