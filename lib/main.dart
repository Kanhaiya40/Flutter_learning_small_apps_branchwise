import 'package:flutter/material.dart';
import 'package:parcel_tracking/services/location_service.dart';
import 'package:parcel_tracking/views/pages/customer_profile.dart';
import 'package:parcel_tracking/views/pages/login_page.dart';
import 'package:parcel_tracking/views/pages/tab_view_bottom.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider(
        create: (_) => LocationService().getStreamData,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Parcel Tracking',
          home: LoginCardOverlapRoute(),
        ));
  }
}
