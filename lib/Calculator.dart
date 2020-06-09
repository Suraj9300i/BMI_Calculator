import 'dart:math';

import 'package:flutter/cupertino.dart';
class Calculator{
  Calculator({@required this.userWeight,@required this.userHeight});
  final int userHeight;
  final int userWeight;

  double _bmi;
  String calculateBmi(){
    double k = pow(userHeight/100,2);
    _bmi = userWeight/k;
    return _bmi.toStringAsFixed(1);
  }

  String getResult(){
    if(_bmi >= 25)
      return 'OverWeight';
    else if(_bmi >= 18.5)
      return 'Normal';
    else
      return 'UnderWeight';
  }

  String getSuggestion(){
    if(_bmi >= 25)
      return 'you have higher than normal body weight. Try more exercise';
    else if(_bmi >= 18.5)
      return 'you have normal body weight. Good job!';
    else
      return 'you have lower than normal body weight. you can eat a bit more';
  }
}