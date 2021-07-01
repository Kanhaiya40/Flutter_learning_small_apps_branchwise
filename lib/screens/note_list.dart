import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:note_keeper/model/note.dart';
import 'package:note_keeper/screens/note_list_editor.dart';
import 'package:note_keeper/utils/database_helper.dart';
import 'package:sqflite/sqflite.dart';

class NoteList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return NoteListState();
  }
}

class NoteListState extends State<NoteList> {
  DatabaseHelper databaseHelper = DatabaseHelper();
  List<Note> notes;
  int count = 0;

  @override
  Widget build(BuildContext context) {
    if (notes == null) {
      notes = List<Note>();
      updateNoteList();
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black38,
        title: Text(
          "NoteKeeper",
          style: TextStyle(
              color: Colors.white, fontSize: 15.0, fontWeight: FontWeight.w700),
        ),
      ),
      body: ListView.builder(
        itemCount: count,
        itemBuilder: (BuildContext context, int position) {
          return Card(
            color: Colors.white,
            elevation: 2.0,
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor:
                    getColorOnPriority(this.notes[position].priority),
                child: getIconOnPriority(this.notes[position].priority),
              ),
              title: Text(
                this.notes[position].title,
              ),
              subtitle: Text(this.notes[position].description),
              trailing: GestureDetector(
                child: Icon(
                  Icons.delete,
                  color: Colors.grey,
                ),
                onTap: () {
                  deleteNote(context, this.notes[position]);
                },
              ),
              onTap: () {
                debugPrint("Item Tapped");
                navigateNote(this.notes[position], context, "Edit Note");
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          debugPrint("Action Button Typed");
          navigateNote(Note('', '', '', 1), context, "Add Note");
        },
        tooltip: "Add Note",
        child: Icon(Icons.add),
      ),
    );
  }

  void deleteNote(BuildContext context, Note note) async {
    var result = await databaseHelper.deleteNote(note.id);
    if (result != 0) {
      _showSnackBar(context, "Note Deleted Successfully");
      updateNoteList();
    }
  }

  void _showSnackBar(BuildContext context, String message) {}

  Color getColorOnPriority(int priority) {
    switch (priority) {
      case 1:
        return Colors.red;

      case 2:
        return Colors.yellow;

      default:
        return Colors.yellow;
    }
  }

  moveToLastPushedScreen() {
    Navigator.pop(context);
  }

  void updateNoteList() {
    final Future<Database> dbFuture = databaseHelper.initializeDatabase();
    dbFuture.then((database) {
      Future<List<Note>> noteListFuture = databaseHelper.getNoteList();
      noteListFuture.then((noteList) {
        setState(() {
          this.notes = noteList;
          this.count = noteList.length;
        });
      });
    });
  }

  void navigateNote(Note note, BuildContext context, String appBarTitle) async {
    bool result =
        await Navigator.push(context, MaterialPageRoute(builder: (context) {
      return NoteDetails(note, appBarTitle);
    }));

    if (result == true) {
      updateNoteList();
    }
  }
}

Icon getIconOnPriority(int priority) {
  switch (priority) {
    case 1:
      return Icon(Icons.arrow_forward_ios_sharp);
    case 2:
      return Icon(Icons.play_arrow);

    default:
      return Icon(Icons.arrow_forward_ios_sharp);
  }
}
