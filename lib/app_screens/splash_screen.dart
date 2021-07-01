import 'dart:math';

import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Material(color: Colors.tealAccent,
    child: Center(
      child: Text(yourLuckyNumber(),
        textDirection: TextDirection.ltr,
        style: TextStyle(color: Colors.red,fontSize: 15.0),),
    ),);
  }
  String yourLuckyNumber(){
    var luckyNumber=Random();
    int num=luckyNumber.nextInt(10);
    return "Your Lucky number is : $num";
  }
}
