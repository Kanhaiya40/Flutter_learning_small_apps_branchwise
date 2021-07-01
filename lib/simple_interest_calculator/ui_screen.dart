import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SimpleInterestCalculate extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SimpleInterestCalculator();
  }
}

class SimpleInterestCalculator extends State<SimpleInterestCalculate> {
  var _currencies = ["Rupees", "Dollar", "Pounds", "Other"];
  var _formKey = GlobalKey<FormState>();
  var _minimumPadding = 5.0;
  var _currentItemSelected = "Rupees";
  var displayResult = "";
  TextEditingController principalTextController = TextEditingController();
  TextEditingController rateTextController = TextEditingController();
  TextEditingController timeTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text(
            "Simple Interest Calculator",
            style: TextStyle(
                fontFamily: 'BigShouldersStencilDisplay',
                fontWeight: FontWeight.w700),
          ),
        ),
        body: Center(
          child: Form(
              key: _formKey,
              child: Padding(
                padding: EdgeInsets.all(_minimumPadding * 2),
                child: ListView(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(5.0),
                      child: getImage(),
                    ),
                    Padding(
                      padding: EdgeInsets.all(_minimumPadding),
                      child: getPrincipleTextField(),
                    ),
                    Padding(
                      padding: EdgeInsets.all(_minimumPadding),
                      child: getRateOfInterestTextField(),
                    ),
                    Padding(
                        padding: EdgeInsets.all(_minimumPadding),
                        child: Center(
                          child: Container(
                            child: Row(
                              children: [
                                Expanded(
                                    child: TextFormField(
                                  controller: timeTextController,
                                  keyboardType: TextInputType.datetime,
                                  validator: (String? value) {
                                    if (value!.isEmpty) {
                                      return "Please Enter Time";
                                    }
                                  },
                                  decoration: InputDecoration(
                                      labelText: "Term",
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                      ),
                                      hintText: "Enter Time"),
                                )),
                                Container(
                                  width: 10.0,
                                ),
                                Expanded(
                                    child: DropdownButton<String>(
                                  items: _currencies.map((String value) {
                                    return DropdownMenuItem(
                                        value: value, child: Text(value));
                                  }).toList(),
                                  value: _currentItemSelected,
                                  onChanged: (String? newSelectedItem) {
                                    _onDropDownSelected(newSelectedItem);
                                  },
                                )),
                              ],
                            ),
                          ),
                        )),
                    Padding(
                      padding: EdgeInsets.all(_minimumPadding),
                      child: getCalculateAndResetButtonRow(),
                    ),
                    Padding(
                      padding: EdgeInsets.all(_minimumPadding),
                      child: getTextResult(),
                    )
                  ],
                ),
              )),
        ));
  }

  void _onDropDownSelected(String? newSelectedItem) {
    setState(() {
      this._currentItemSelected = newSelectedItem!;
      getTextResult();
    });
  }

  Widget getTextResult() {
    return Text(displayResult);
  }

  Widget getImage() {
    AssetImage assetImage = AssetImage('images/simple.png');
    Image image = Image(
      image: assetImage,
      width: 125.0,
      height: 125.0,
    );
    return Container(
      margin: EdgeInsets.only(top: 40.0),
      child: image,
    );
  }

  Widget getPrincipleTextField() {
    return TextFormField(
      keyboardType: TextInputType.number,
      validator: (String? value){
        if(value!.isEmpty){
          return "Please Enter Some Amount!";
        }
      },
      controller: principalTextController,
      decoration: InputDecoration(
          labelText: "Principle",
          errorStyle: TextStyle(
            color: Colors.teal,
              fontSize: 15.0
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          hintText: "Enter the principle amount for e.g 12000"),
    );
  }

  Widget getRateOfInterestTextField() {
    return TextFormField(
      keyboardType: TextInputType.number,
      validator: (String? value){
        if(value!.isEmpty){
          return "Please Enter Rate";
        }
      },
      controller: rateTextController,
      decoration: InputDecoration(
          labelText: "Rate Of Interest",
          errorStyle: TextStyle(
            color: Colors.pinkAccent,
            fontSize: 15.0
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          hintText: "Rate in % for e.g 5%"),
    );
    ;
  }

  Widget getCalculateAndResetButtonRow() {
    return Center(
        child: Container(
      child: Row(
        children: [
          Expanded(
            child: RaisedButton(
              color: Colors.teal,
              elevation: 6.0,
              child: Text(
                "Calculate",
                style: TextStyle(
                    fontSize: 30.0,
                    color: Colors.white,
                    fontFamily: 'BigShouldersStencilDisplay',
                    fontWeight: FontWeight.w300),
              ),
              onPressed: () {
                setState(() {
                  if (_formKey.currentState!.validate()) {
                    this.displayResult = _calculateTotalReturns();
                    getTextResult();
                  }
                });
              },
            ),
          ),
          Container(
            width: 10.0,
          ),
          Expanded(
            child: RaisedButton(
              color: Colors.teal,
              elevation: 6.0,
              child: Text(
                "Reset",
                style: TextStyle(
                    fontSize: 30.0,
                    color: Colors.white,
                    fontFamily: 'BigShouldersStencilDisplay',
                    fontWeight: FontWeight.w300),
              ),
              onPressed: () => {
                setState(() {
                  _resetTask();
                })
              },
            ),
          )
        ],
      ),
    ));
  }

  String _calculateTotalReturns() {
    double principal = double.parse(principalTextController.text);
    double rate = double.parse(rateTextController.text);
    double time = double.parse(timeTextController.text);
    debugPrint("$principal : $rate : $time");
    double totalAmountPayableAfterTermCompletion =
        principal + (principal * rate * time) / 100;
    String total =
        "The total amount to be paid after $time yrs will be $totalAmountPayableAfterTermCompletion $_currentItemSelected";
    return total;
  }

  void _resetTask() {
    principalTextController.text = '';
    rateTextController.text = '';
    timeTextController.text = '';
    this.displayResult = '';
  }
}
