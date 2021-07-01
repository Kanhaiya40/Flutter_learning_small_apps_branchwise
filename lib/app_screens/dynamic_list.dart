import 'package:flutter/material.dart';

class LongListImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var data = getListOfString();
    var listView = ListView.builder(itemBuilder: (context, index) {
      return ListTile(
          title: Text(data[index]), onTap: () => showSnackBar(context, index));
    });
    return listView;
  }
}

void showSnackBar(BuildContext context, int index) {
  var listOfData = getListOfString();
  var snackBar = SnackBar(
    content: Text("${listOfData[index]} clicked"),
    action: SnackBarAction(
      label: "Ok Fine",
      onPressed: () {
        debugPrint("Ok Fine");
      },
    ),
  );
  Scaffold.of(context).showSnackBar(snackBar);
}

List<String> getListOfString() {
  var listOfStrings = List<String>.generate(1000, (counter) => "Item $counter");
  return listOfStrings;
}
