import 'package:flutter/material.dart';

import 'Constants.dart';

class LastPinkButton extends StatelessWidget {
  LastPinkButton({@required this.label});
  final String label;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.0,
      color: kBottomButtonColor,
      child: Center(
        child: Text(
          label,
          style: TextStyle(fontSize: 40.0, color: Colors.white),
        ),
      ),
    );
  }
}



