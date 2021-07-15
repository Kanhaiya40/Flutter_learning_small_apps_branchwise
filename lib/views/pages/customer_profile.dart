import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:parcel_tracking/utils/my_text.dart';

class Profile extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ProfileState();
  }
}

class ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
          children: [
            Container(height: 100,),
            Center(
              child: new Container(
                  width: 150,
                  height: 150,
                  decoration: new BoxDecoration(
                      shape: BoxShape.circle,
                      image: new DecorationImage(
                          fit: BoxFit.cover,
                          image: new NetworkImage(
                              "https://static.india.com/wp-content/uploads/2020/06/Mahatma-Gandhi-Insta.jpg")
                      )
                  )
              ),
            ),
            ListTile(
              leading: Icon
                (
                  Icons.person_rounded),
              title: Text
                ("Name", style: MyText.caption(context),)
              ,
              subtitle: Text
                ("Mahatma Gandhi", style: MyText.title(context),)
              ,
            ),
            ListTile(
              leading: Icon
                (
                  Icons.phone),
              title: Text
                ("Contact Number", style: MyText.caption(context),)
              ,
              subtitle: Text
                ("8574586974", style: MyText.title(context),)
              ,
            ),
            ListTile(
              leading: Icon
                (Icons.email),
              title: Text
                ("Email", style: MyText.caption(context),)
              ,
              subtitle: Text
                ("Mahatma@fatherofnation.com", style: MyText.title(context),)
              ,
            ),
            ListTile(
              leading: Icon
                (
                  Icons.text_snippet),
              title: Text
                ("UIN", style: MyText.caption(context),)
              ,
              subtitle: Text
                ("626347584587", style: MyText.title(context),)
              ,
            ),
            ListTile(
              leading: Icon
                (
                  Icons.location_city),
              title: Text
                ("Address", style: MyText.caption(context),)
              ,
              subtitle: Text
                ("4th Main Road,16th cross,GandhiNagar,Gujrat,India", style: MyText.title(context),)
              ,
            ),
          ],)
    );
  }
}


