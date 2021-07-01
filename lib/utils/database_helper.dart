import 'dart:io';

import 'package:note_keeper/model/note.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static DatabaseHelper _databaseHelper;
  static Database _database;

  // factory method for DatabaseHelper class
  factory DatabaseHelper() {
    if (_databaseHelper == null) {
      _databaseHelper = DatabaseHelper._createNewInstance();
    }
    return _databaseHelper;
  }

  // getting database instance
  Future<Database> get database async {
    if (_database == null) {
      _database = await initializeDatabase();
    }
    return _database;
  }

  String noteTable = "note";
  String colId = 'id';
  String colTitle = 'title';
  String colDesc = 'description';
  String colPriority = 'priority';
  String colDate = 'date';

  DatabaseHelper._createNewInstance();

  // initializing database which will initiate to create database
  Future<Database> initializeDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + "note.db";

    var notesDatabase =
        await openDatabase(path, version: 1, onCreate: _createDatabase);
    return notesDatabase;
  }

  // creating database here
  void _createDatabase(Database db, int newVersion) async {
    await db.execute(
        'CREATE TABLE $noteTable($colId INTEGER PRIMARY KEY AUTOINCREMENT,$colTitle TEXT,$colDesc TEXT,$colPriority INTEGER,$colDate TEXT)');
  }

  // getting list of note object from database
  Future<List<Map<String, dynamic>>> fetchNoteMapList() async {
    Database database = await this.database;

    // var result = await database
    //     .rawQuery("Select * FROM $noteTable order by $colPriority ASC");
    var result = await database.query(noteTable, orderBy: '$colPriority ASC');
    return result;
  }

  // inserting note to database
  Future<int> insertNote(Note note) async {
    Database insertDatabase = await this.database;

    var result = await insertDatabase.insert(noteTable, note.toMap());

    return result;
  }

  // updating note
  Future<int> updateNote(Note note) async {
    Database updateDatabase = await this.database;
    var result = await updateDatabase.update(noteTable, note.toMap(),
        where: '$colId=?', whereArgs: [note.id]);
    return result;
  }

  // delete note object
  Future<int> deleteNote(int id) async {
    Database deleteDatabase = await this.database;
    var result = await deleteDatabase.delete(noteTable, where: '$colId=$id');
    return result;
  }

  //Getting no of note object in database
  Future<int> noOfNoteObject() async {
    Database objectCounterDatabase = await this.database;
    List<Map<String, dynamic>> objects = await objectCounterDatabase
        .rawQuery('SELECT COUNT (*) from $noteTable');
    int noOfObjectInDatabase = Sqflite.firstIntValue(objects);
    return noOfObjectInDatabase;
  }

  Future<List<Note>> getNoteList() async {
    var noteListMap = await fetchNoteMapList();
    int count = noteListMap.length;
    List<Note> noteList = [];
    for (int i = 0; i < count; i++) {
      noteList.add(Note.fromMapObject(noteListMap[i]));
    }
    return noteList;
  }
}
