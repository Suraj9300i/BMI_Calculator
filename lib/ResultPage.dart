import 'package:bmicalculator/Constants.dart';
import 'package:bmicalculator/HomePage.dart';
import 'package:bmicalculator/LastPinkButton.dart';
import 'package:bmicalculator/ReusableCard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  ResultPage({@required this.result,@required this.bmi,@required this.suggestion});
  final String result;
  final String bmi;
  final String suggestion;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kScaffoldBackGroundColor,
      appBar: AppBar(
        title: Text("BMI Calculator"),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
                padding: EdgeInsets.all(25.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Your Result",
                      style: kBoldTextStyle,
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            color: kCardBackGroundColor,
                            borderRadius: BorderRadius.circular(15.0)),
                        padding: EdgeInsets.symmetric(
                            horizontal: 25.0, vertical: 30.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              result,
                              style: TextStyle(
                                  color: Colors.green,
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.w400),
                            ),
                            Expanded(
                              child: SizedBox(
                                width: double.infinity,
                              ),
                            ),
                            Text(
                              bmi,
                              style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  color: Colors.white,
                                  fontSize: 130.0),
                            ),
                            Expanded(
                              child: SizedBox(
                                width: double.infinity,
                              ),
                            ),
                            Text(
                              suggestion,
                              style: TextStyle(
                                  fontSize: 20.0, color: Colors.white),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                )),
          ),
          GestureDetector(
            child: LastPinkButton(
              label: "Re-Calculate",
            ),
            onTap: (){
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}

