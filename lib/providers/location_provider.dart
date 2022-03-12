import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geocode/geocode.dart';
import 'package:location/location.dart';

class LocationProvider with ChangeNotifier {

  bool serviceEnabled = false;
  double latitude = 0.0;
  double longitude = 0.0;
  PermissionStatus permissionGranted = PermissionStatus.denied;
  LocationData? userLocation;
  Address address = Address();
  GeoCode geoCode = GeoCode();
  late StreamSubscription<LocationData> stream;
  Location location = Location();

  Future<String> getUserCurrentLocation() async {
    // Check if location service is enable
    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return "Service-Disabled";
      }
    }

    // Check if permission is granted
    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return "Permission-Denied";
      }
    }

    final _locationData = await location.getLocation();
    userLocation = _locationData;
    stream = location.onLocationChanged.listen((LocationData currentLocation) {
      userLocation = currentLocation;
      getAddress(userLocation!.latitude, userLocation!.longitude).then((value) {
        address = value;
      });
      notifyListeners();
      Future.delayed(const Duration(seconds: 2));
    });
    return "Success";
  }

  void locationDispose() {
    stream.cancel();
  }

  Future<Address> getAddress(latitude, longitude) async {
    this.latitude = latitude;
    this.longitude = longitude;
    Address address = await geoCode.reverseGeocoding(latitude: latitude, longitude: longitude);
    return address;
  }

}