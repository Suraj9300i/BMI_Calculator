import 'dart:ui';
import 'package:bmicalculator/Calculator.dart';
import 'package:bmicalculator/LastPinkButton.dart';
import 'package:bmicalculator/ResultPage.dart';
import 'package:bmicalculator/ReusableCard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'Constants.dart';
import 'LastRowCardRoundedButtons.dart';

enum Gender { male, female }

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Gender selectedGender;
  int _userHeight = 180;
  int _userWeight = 50;
  int _userAge = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI Calculator"),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: GestureDetector(
                      child: ReUsableCard(
                        color: selectedGender == Gender.male
                            ? kActiveColor
                            : kInActiveColor,
                        cardChild: _buildFirstRowCardChild(
                            label: "Male", icon: FontAwesomeIcons.mars),
                      ),
                      onTap: () {
                        setState(
                          () {
                            selectedGender = Gender.male;
                          },
                        );
                      },
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      child: ReUsableCard(
                        color: selectedGender == Gender.female
                            ? kActiveColor
                            : kInActiveColor,
                        cardChild: _buildFirstRowCardChild(
                            label: "Female", icon: FontAwesomeIcons.venus),
                      ),
                      onTap: () {
                        setState(
                          () {
                            selectedGender = Gender.female;
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ReUsableCard(
                color: kCardBackGroundColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      width: double.infinity,
                    ),
                    Text(
                      "Height",
                      style: kLightTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text(_userHeight.toString(), style: kBoldTextStyle),
                        Text(
                          "cm",
                          style: kLightTextStyle,
                        ),
                      ],
                    ),
                    Slider(
                      value: _userHeight.toDouble(),
                      min: 120,
                      max: 220,
                      activeColor: kBottomButtonColor,
                      inactiveColor: kLightTextColor,
                      onChanged: (newValue) {
                        setState(
                          () {
                            _userHeight = newValue.round();
                          },
                        );
                      },
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReUsableCard(
                      color: kCardBackGroundColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("Weight", style: kLightTextStyle),
                          Text(
                            _userWeight.toString(),
                            style: kBoldTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundedButton(
                                icon: Icons.remove,
                                onTapButton: () {
                                  setState(() {
                                    _userWeight--;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              RoundedButton(
                                icon: Icons.add,
                                onTapButton: () {
                                  setState(() {
                                    _userWeight++;
                                  });
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReUsableCard(
                      color: kCardBackGroundColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Age",
                            style: kLightTextStyle,
                          ),
                          Text(
                            _userAge.toString(),
                            style: kBoldTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundedButton(
                                icon: Icons.remove,
                                onTapButton: () {
                                  setState(() {
                                    _userAge--;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              RoundedButton(
                                icon: Icons.add,
                                onTapButton: () {
                                  setState(() {
                                    _userAge++;
                                  });
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              child: LastPinkButton(
                label: "Calculate",
              ),
              onTap: (){
                Calculator calc = new Calculator(
                    userHeight: _userHeight, userWeight: _userWeight);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return ResultPage(
                        bmi: calc.calculateBmi(),
                        result:calc.getResult(),
                        suggestion: calc.getSuggestion(),
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Column _buildFirstRowCardChild({String label, IconData icon}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 80.0,
          color: Colors.white,
        ),
        SizedBox(
          height: 10.0,
        ),
        Text(
          label,
          style: TextStyle(fontSize: 20.0, color: kLightTextColor),
        )
      ],
    );
  }
}
