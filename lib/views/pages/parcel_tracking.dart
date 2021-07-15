import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:parcel_tracking/models/location_model.dart';
import 'package:parcel_tracking/views/widgets/steps.dart';
import 'package:provider/provider.dart';

class ParcelTracker extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ParcelTrackerState();
  }
}

class ParcelTrackerState extends State {
  var isVerticle = false;
  GoogleMapController newGoogleMapController;
  Completer<GoogleMapController> _controller = Completer();
  StepperType stepperType = StepperType.vertical;

  Position currentPosition;
  var geoLocator = Geolocator();
  LatLng initialCoordinates;

  int currentStep = 0;
  bool complete = false;
  Set<Marker> markerSet;

  next() {
    currentStep + 1 != Steps().steps.length
        ? goTo(currentStep + 1)
        : setState(() => complete = true);
  }

  goTo(int step) {
    setState(() => currentStep = step);
  }

  cancel() {
    if (currentStep > 0) {
      goTo(currentStep - 1);
    }
  }

  switchStepperType() {
    setState(() => stepperType == StepperType.horizontal
        ? stepperType = StepperType.vertical
        : stepperType = StepperType.horizontal);
  }

  void locationPosition() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    currentPosition = position;
    initialCoordinates =
        LatLng(currentPosition.latitude, currentPosition.longitude);

    LatLng latLng = LatLng(currentPosition.latitude, currentPosition.longitude);

    CameraPosition cameraPosition =
        new CameraPosition(target: latLng, zoom: 20);
    newGoogleMapController
        .animateCamera(CameraUpdate.newCameraPosition(cameraPosition));

    Marker marker = Marker(
      markerId: MarkerId("pickupId"),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
      infoWindow: InfoWindow(title: "Package", snippet: "parcel"),
      position: latLng,
    );

    setState(() {
      markerSet.add(marker);
    });
  }

  @override
  Widget build(BuildContext context) {
    var locationParameter = Provider.of<LocationParam>(context);
    final CameraPosition _kGooglePlex = CameraPosition(
      target: LatLng(locationParameter.longitude, locationParameter.latitude),
      zoom: 5.0,
    );
    return Scaffold(
      appBar: AppBar(
        title: Text("Parcel Tracker"),
      ),
      body: Column(
        children: [
          Expanded(
              child: Stepper(
            controlsBuilder: (BuildContext context,
                {VoidCallback onStepContinue, VoidCallback onStepCancel}) {
              return Row(
                children: [Text("")],
              );
            },
            steps: Steps().steps,
            type: stepperType,
            onStepTapped: (step) {
              setState(() {
                goTo(step);
              });
            },
          )),
          Expanded(
              child: Padding(
                  padding: EdgeInsets.all(15),
                  child: Container(
                    child: GoogleMap(
                      mapType: MapType.normal,
                      myLocationButtonEnabled: true,
                      myLocationEnabled: true,
                      zoomControlsEnabled: true,
                      zoomGesturesEnabled: true,
                      initialCameraPosition: _kGooglePlex,
                      onMapCreated: (GoogleMapController controller) {
                        _controller.complete(controller);
                        newGoogleMapController = controller;
                        locationPosition();
                      },
                    ),
                  )))
        ],
      ),
    );
  }
}
