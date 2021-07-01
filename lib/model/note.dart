class Note {
  int id;
  String title;
  String description;
  String date;
  int priority;

  Note(this.title, this.description, this.date, this.priority);

  Note.withId(
      { this.id, this.title, this.description, this.date, this.priority});

  //converting Note object into Map object
  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    if (id != null) {
      map['id'] = id;
    }
    map['title'] = title;
    map['description'] = description;
    map['priority'] = priority;
    map['date'] = date;
    return map;
  }

  Note.fromMapObject(Map<String, dynamic> mapObjectFromDatabase) {
    this.id = mapObjectFromDatabase['id'];
    this.title = mapObjectFromDatabase['title'];
    this.description = mapObjectFromDatabase['description'];
    this.date = mapObjectFromDatabase['date'];
    this.priority = mapObjectFromDatabase['priority'];
  }
}
