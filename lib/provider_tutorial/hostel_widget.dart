import 'package:firebase_with_provider_app/provider_tutorial/hostel_data.dart';
import 'package:flutter/material.dart';

class HostelWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HostelStateWidget();
  }
}

class HostelStateWidget extends State {
  HostelData hostelData = HostelData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Providers Example"),
      ),
      body: ListView.builder(
          itemCount: hostelData.hostels.length,
          itemBuilder: (contex, index) {
            return Card(
                child: ListTile(
              leading: Icon(Icons.hotel),
              title: Text("Hostel Id: ${hostelData.hostels[index].hostelId}"),
              subtitle: Text(
                  "Number Of Students: ${hostelData.hostels[index].noOfStudentInHostel}"),
              trailing: Icon(Icons.add),
              onTap: () {
                setState(() {
                  hostelData.hostels[index].noOfStudentInHostel++;
                });
              },
            ));
          }),
    );
  }
}
