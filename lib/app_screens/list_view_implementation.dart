import 'package:flutter/material.dart';

class ListViewImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView(
      children: <Widget>[
        ListTile(
          leading: Icon(Icons.landscape),
          title: Text("LandScape"),
          subtitle: Text("Cloudy View"),
          onTap: () => debugPrint("Typed"),
          trailing: Icon(Icons.wb_cloudy),
        ),
        ListTile(
          leading: Icon(Icons.landscape),
          title: Text("LandScape"),
          subtitle: Text("Cloudy View"),
          trailing: Icon(Icons.wb_cloudy),
        ),
        ListTile(
          leading: Icon(Icons.window),
          title: Text("LandScape"),
          subtitle: Text("Cloudy View"),
          trailing: Icon(Icons.sim_card),
        ),
        ListTile(
          leading: Icon(Icons.person),
          title: Text("LandScape"),
          subtitle: Text("Cloudy View"),
          trailing: Icon(Icons.verified_user),
        )
      ],
    );
  }
}
