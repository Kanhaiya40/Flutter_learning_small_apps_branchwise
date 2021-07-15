import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:parcel_tracking/utils/my_colors.dart';
import 'package:parcel_tracking/views/pages/customer_profile.dart';
import 'package:parcel_tracking/views/pages/ordered_parcel.dart';

class BottomNavigationPrimaryRoute extends StatefulWidget {
  BottomNavigationPrimaryRoute();

  @override
  BottomNavigationPrimaryRouteState createState() =>
      new BottomNavigationPrimaryRouteState();
}

class BottomNavigationPrimaryRouteState
    extends State<BottomNavigationPrimaryRoute>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {});
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: MyColors.grey_5,
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
                child: TabBarView(
                    controller: _tabController,
                    children: [OrderedParcel(), Profile()])),
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0),
              ),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              margin: EdgeInsets.all(0),
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 4),
                child: TabBar(
                  indicatorColor: Colors.transparent,
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicatorWeight: 1,
                  tabs: [
                    Container(
                      child:
                          Tab(icon: Icon(Icons.apps, color: Colors.teal[600])),
                      margin: EdgeInsets.fromLTRB(0, 0, 15, 0),
                    ),
                    Container(
                      child: Tab(
                          icon:
                              Icon(Icons.local_offer, color: Colors.teal[600])),
                      margin: EdgeInsets.fromLTRB(15, 0, 0, 0),
                    )
                  ],
                  controller: _tabController,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
