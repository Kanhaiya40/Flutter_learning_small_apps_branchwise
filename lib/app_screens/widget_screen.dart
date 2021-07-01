import 'dart:ui';

import 'package:flutter/material.dart';

class WidgetDemoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
        child: Container(
      alignment: Alignment.center,
      color: Colors.white,
      // width: 200.0,
      // height: 300.0,
      child: Text(
        "This is Container Widget",
        textDirection: TextDirection.ltr,
        style: TextStyle(
            color: Colors.brown,
            fontSize: 20.0,
            decoration: TextDecoration.none,
        fontFamily: 'BigShouldersStencilDisplay',
        fontWeight: FontWeight.w300),
      ),
    ));
  }
}
