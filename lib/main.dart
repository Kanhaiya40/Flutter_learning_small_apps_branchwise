import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterdevelopment/app_screens/dynamic_list.dart';
import 'package:flutterdevelopment/app_screens/list_view_implementation.dart';
import 'package:flutterdevelopment/app_screens/row_coloumn_image_asset.dart';
import 'package:flutterdevelopment/app_screens/splash_screen.dart';
import 'package:flutterdevelopment/app_screens/widget_screen.dart';
import 'package:flutterdevelopment/app_screens_for_statefullwidget/fav_city.dart';
import 'package:flutterdevelopment/simple_interest_calculator/ui_screen.dart';

// void main() => runApp(MaterialApp(
//     debugShowCheckedModeBanner: false,
//     title: "Widget Demo",
//     home: Scaffold(
//       appBar: AppBar(
//         title: Text("List View Implementation"),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           debugPrint("You are here bro.");
//         },
//         child: Icon(Icons.add_location),
//         tooltip: "Your Current Location",
//       ),
//       body: showDynamicLongList(),
//     )));

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Stateful Widgets",
    home: simpleInterestCalculator(),
  ));
}

Widget columnWiseData() {
  return ColumnWidget();
}

Widget showSplashScreen() {
  return SplashScreen();
}

Widget showWidgets() {
  return WidgetDemoScreen();
}

Widget showListView() {
  return ListViewImplementation();
}

Widget showDynamicLongList() {
  return LongListImplementation();
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: Colors.blue,
          appBar: AppBar(
            title: Text("Flutter Development"),
          ),
          body: SplashScreen()),
    );
  }
}

Widget showStatefulWidget() {
  return FavoriteCity();
}

Widget simpleInterestCalculator() {
  return SimpleInterestCalculate();
}
