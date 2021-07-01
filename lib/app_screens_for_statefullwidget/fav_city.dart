import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FavoriteCity extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _FavoriteCityState();
  }
}

class _FavoriteCityState extends State<FavoriteCity> {
  String name = "";
  var _dropDownItems = ["Rupees", "Dollar", "Pounds", "Others"];
  String _currentCurrency = "Rupees";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Stateful Example")),
      body: Container(
        margin: EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              onChanged: (String userInput) {
                setState(() {
                  name = userInput;
                });
              },
            ),
            Container(
              color: Colors.black38,
              margin: EdgeInsets.all(20.0),
              child: DropdownButton<String>(
                items: _dropDownItems.map((String dropDownStringItem) {
                  return DropdownMenuItem<String>(
                    value: dropDownStringItem,
                    child: Padding(
                      padding: EdgeInsets.only(left: 20.0, right: 20.0),
                      child: Text(dropDownStringItem),
                    ),
                  );
                }).toList(),
                value: _currentCurrency,
                onChanged: (String? newInput) {
                  setState(() {
                    this._currentCurrency = newInput!;
                  });
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(40.0),
              child: Text(
                "Your City name is $name",
                style: TextStyle(fontSize: 20.0),
              ),
            )
          ],
        ),
      ),
    );
  }
}
