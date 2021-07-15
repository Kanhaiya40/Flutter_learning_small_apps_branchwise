import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:location/location.dart';
import 'package:parcel_tracking/utils/my_text.dart';
import 'package:parcel_tracking/views/pages/parcel_tracking.dart';

class OrderedParcel extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return OrderedParcelState();
  }
}

class OrderedParcelState extends State {
  final Location location = Location();

  PermissionStatus _permissionGranted;

  Future<void> _checkPermissions() async {
    final PermissionStatus permissionGranted = await location.hasPermission();
    debugPrint(permissionGranted.toString());
    setState(() {
      _permissionGranted = permissionGranted;
    });
  }

  Future<void> _requestPermission() async {
    if (_permissionGranted == PermissionStatus.granted) {
      final PermissionStatus permissionRequestedResult =
          await location.requestPermission();
      debugPrint(permissionRequestedResult.toString());
      setState(() {
        _permissionGranted = permissionRequestedResult;
      });
    }
  }

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   _requestPermission();
  //   _checkPermissions();
  // }

  @override
  Widget build(BuildContext context) {
    // _requestPermission();
    return Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              "Ordered Parcel",
              textAlign: TextAlign.center,
            ),
          ),
        ),
        body: ListView.builder(
          itemCount: 15,
          itemBuilder: (context, index) {
            return Container(
                child: GestureDetector(
                    onTap: () {
                      _navigateToOrderDetailedPage(context);
                    },
                    child: Card(
                      child: Padding(
                          padding: EdgeInsets.all(20),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "Parcel Id",
                                    style: MyText.subtitle(context)
                                  ),
                                  Container(
                                    width: 120,
                                  ),
                                  Text(
                                    ":",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                  Container(
                                    width: 30,
                                  ),
                                  Text(
                                    "1",
                                    style: MyText.subhead(context)
                                  )
                                ],
                              ),
                              Container(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Product Name",
                                    style: MyText.subtitle(context)
                                  ),
                                  Container(
                                    width: 83,
                                  ),
                                  Text(
                                    ":",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                  Container(
                                    width: 30,
                                  ),
                                  Text(
                                    "Rice",
                                    style: MyText.subhead(context)
                                  )
                                ],
                              ),
                              Container(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Delivery Address",
                                    style: MyText.subtitle(context)
                                  ),
                                  Container(
                                    width: 68,
                                  ),
                                  Text(
                                    ":",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                  Container(
                                    width: 30,
                                  ),
                                  Expanded(
                                      child: Text(
                                    "Dumka ,Jharkhand",
                                    style: MyText.subhead(context)
                                  ))
                                ],
                              ),
                              Container(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Status",
                                    style: MyText.subtitle(context)
                                  ),
                                  Container(
                                    width: 135,
                                  ),
                                  Text(
                                    ":",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                  Container(
                                    width: 30,
                                  ),
                                  Text(
                                    "Delivered",
                                    style: MyText.subhead(context)
                                  )
                                ],
                              ),
                              Container(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Text(
                                      "Ordered Date",
                                      style: MyText.subtitle(context)
                                  ),
                                  Container(
                                    width: 90,
                                  ),
                                  Text(
                                    ":",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                  Container(
                                    width: 30,
                                  ),
                                  Expanded(child:Text(
                                      DateTime.now().toString(),
                                      style: MyText.subhead(context)
                                  ))
                                ],
                              ),
                            ],
                          )),
                    )));
          },
        ));
  }

  void _navigateToOrderDetailedPage(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => ParcelTracker()));
  }
}
