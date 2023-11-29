import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class Location {
  var latitude;
  var longitude;

  Future<void> getCurrentLocation() async {

    final hasPermission = await handlePermission();

    if(!hasPermission) {
       return;
    }
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high,forceAndroidLocationManager: false);
      latitude = position.latitude;
      longitude = position.longitude;
      print(latitude);
      print(longitude);
    }
    catch(e) {
      print(e);
    }
  }

  Future<bool> handlePermission() async {
    LocationPermission permission;
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return false;
      }
    }
    return true;
  }


}
