import 'dart:async';

import 'package:location/location.dart';
import 'package:parcel_tracking/models/location_model.dart';

class LocationService {
  Location location = Location();
  LocationParam locationParam;

  StreamController<LocationParam> locationController =
      StreamController<LocationParam>.broadcast();

  Stream<LocationParam> get getStreamData => locationController.stream;

  LocationService() {
    location.requestPermission().then((locationPermission) {
      if (locationPermission == PermissionStatus.granted) {
        location.onLocationChanged.listen((locationValue) {
          locationController.add(
            LocationParam(
                latitude: locationValue.latitude,
                longitude: locationValue.latitude),
          );
        });
      }
    });
  }
}
