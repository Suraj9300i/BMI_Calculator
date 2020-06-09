import 'package:bmicalculator/ResultPage.dart';
import 'package:flutter/material.dart';
import 'HomePage.dart';

void main()=>runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFF0A0E21),
        accentColor: Colors.red,
        scaffoldBackgroundColor: Color(0xFF0A0E21),
      ),
      home: HomePage(),
      routes: {
        'HomePageRoute': (context)=>HomePage(),
        'ResultPageRout':(context)=>ResultPage(),
      },
    );
  }
}
