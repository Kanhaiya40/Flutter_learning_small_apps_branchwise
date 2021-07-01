import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RowWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
            padding: EdgeInsets.only(top: 40.0, left: 40.0),
            child: Row(children: <Widget>[
              Expanded(
                  child: Text(
                "Delhi",
                textDirection: TextDirection.ltr,
                style: TextStyle(
                    color: Colors.black,
                    decoration: TextDecoration.none,
                    fontSize: 30.0,
                    fontFamily: 'BigShouldersStencilDisplay',
                    fontWeight: FontWeight.w300),
              )),
              Expanded(
                  child: Text(
                "Mumbai",
                textDirection: TextDirection.ltr,
                style: TextStyle(
                    color: Colors.black,
                    decoration: TextDecoration.none,
                    fontSize: 30.0,
                    fontFamily: 'BigShouldersStencilDisplay',
                    fontWeight: FontWeight.w300),
              )),
              Expanded(
                  child: Text(
                "Bangalore",
                textDirection: TextDirection.ltr,
                style: TextStyle(
                    color: Colors.black,
                    decoration: TextDecoration.none,
                    fontSize: 30.0,
                    fontFamily: 'BigShouldersStencilDisplay',
                    fontWeight: FontWeight.w300),
              ))
            ])));
  }
}

class ColumnWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      color: Colors.white,
      child: Column(
        children: <Widget>[RowWidget(), ImageWidget(), RaisedButtonWidget()],
      ),
    ));
  }
}

class ImageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AssetImage assetImage = AssetImage('images/delhi.jpg');
    Image image = Image(
      image: assetImage,
      width: 500.0,
      height: 320.0,
    );
    return Container(
      margin: EdgeInsets.all(20.0),
      child: image,
    );
  }
}

class RaisedButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 230.0,
      margin: EdgeInsets.only(top: 20.0),
      child: RaisedButton(
        color: Colors.teal,
        elevation: 6.0,
        child: Text(
          "Add Data",
          style: TextStyle(
              fontSize: 30.0,
              color: Colors.white,
              fontFamily: 'BigShouldersStencilDisplay',
              fontWeight: FontWeight.w300),
        ),
        onPressed: () => addData(context),
      ),
    );
  }

  void addData(BuildContext context) {
    var alertDialog = AlertDialog(
      title: Text("Data Added Successfully"),
      content: Text("Data Were Fully Organised"),
    );

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alertDialog;
        });
  }
}
