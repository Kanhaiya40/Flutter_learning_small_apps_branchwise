import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:note_keeper/model/note.dart';
import 'package:note_keeper/utils/database_helper.dart';

class NoteDetails extends StatefulWidget {
  final String appBarTitle;
  final Note note;

  NoteDetails(this.note, this.appBarTitle);

  @override
  State<StatefulWidget> createState() {
    return NoteDetailsState(note, appBarTitle);
  }
}

class NoteDetailsState extends State<NoteDetails> {
  final String appBarTitle;
  final Note note;

  NoteDetailsState(this.note, this.appBarTitle);

  DatabaseHelper databaseHelper = DatabaseHelper();
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appBarTitle),
      ),
      body: getContent(),
    );
  }

  Widget getContent() {
    titleController.text = note.title;
    descriptionController.text = note.description;

    TextStyle textStyle = Theme.of(context).textTheme.subtitle1;
    var _priorities = ['High', 'Low'];
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: ListView(
        children: [
          ListTile(
            title: DropdownButton<String>(
              items: _priorities.map((String value) {
                return DropdownMenuItem(value: value, child: Text(value));
              }).toList(),
              onChanged: (currentValue) {
                setState(() {
                  debugPrint("Menu selected by user: $currentValue");
                  updatePriorityAsInt(currentValue);
                });
              },
              style: textStyle,
              value: getPriorityAsString(note.priority),
            ),
          ),

          // Second Item
          Padding(
            padding: EdgeInsets.only(top: 15.0),
            child: TextField(
              controller: titleController,
              style: textStyle,
              onChanged: (values) {
                debugPrint("" + values);
                updateTitle();
              },
              decoration: InputDecoration(
                  labelText: "Tiltle",
                  labelStyle: textStyle,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0))),
            ),
          ),

          // Third Element
          Padding(
            padding: EdgeInsets.only(top: 15.0),
            child: TextField(
              controller: descriptionController,
              style: textStyle,
              onChanged: (values) {
                debugPrint("" + values);
                updateDescription();
              },
              decoration: InputDecoration(
                  labelText: "Description",
                  labelStyle: textStyle,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0))),
            ),
          ),

          Padding(
            padding: EdgeInsets.only(top: 15.0),
            child: Row(
              children: [
                Expanded(
                    child: RaisedButton(
                  color: Theme.of(context).primaryColorDark,
                  textColor: Colors.white,
                  child: Text(
                    "Save",
                    textScaleFactor: 1.5,
                  ),
                  onPressed: () {
                    setState(() {
                      debugPrint("Saved to Database");
                      saveDataToDatabase();
                    });
                  },
                )),
                Container(
                  width: 5.0,
                ),
                Expanded(
                    child: RaisedButton(
                  onPressed: () {
                    setState(() {
                      debugPrint("deleted");
                      delete();
                    });
                  },
                  textColor: Colors.white,
                  color: Theme.of(context).primaryColorDark,
                  child: Text(
                    "Delete",
                    textScaleFactor: 1.5,
                  ),
                ))
              ],
            ),
          )
        ],
      ),
    );
  }

  void updatePriorityAsInt(String value) {
    switch (value) {
      case 'High':
        note.priority = 1;
        break;

      case 'Low':
        note.priority = 2;
        break;
    }
  }

  String getPriorityAsString(int value) {
    String priority = '';
    switch (value) {
      case 1:
        priority = 'High';
        break;
      case 2:
        priority = 'Low';
        break;
    }
    return priority;
  }

  void updateTitle() {
    note.title = titleController.text;
  }

  void updateDescription() {
    note.description = descriptionController.text;
  }

  void saveDataToDatabase() async {
    Navigator.pop(context, true);
    int result;
    if (note.id != null) {
      result = await databaseHelper.updateNote(note);
    } else {
      result = await databaseHelper.insertNote(note);
    }

    if (result != 0) {
      _showAlertDialog('Status', 'Note Saved Successfully');
    } else {
      _showAlertDialog('Status', 'Problem While Saving Note');
    }
  }

  void _showAlertDialog(String status, String message) {

    //note.date = DateFormat.yMMMd().format(DateTime.now());
    AlertDialog alertDialog = AlertDialog(
      title: Text(status),
      content: Text(message),
    );

    showDialog(context: context, builder: (_) => alertDialog);
  }

  void delete() async {
    Navigator.pop(context, true);
    int result;
    if (note.id != null) {
      result = await databaseHelper.deleteNote(note.id);
    } else {
      _showAlertDialog('Status', 'No Note Was Deleted');
      return;
    }

    if (result != 0) {
      _showAlertDialog('Status', 'Note Deleted Successfully');
    } else {
      _showAlertDialog("Status", "Problem while Deleting Note");
    }
  }
}
