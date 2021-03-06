import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:location/location.dart';
class LocationService{
  late UserLocation _currentLocation;
  var location= Location();
  Future<UserLocation> getLocation() async{
    try{
      var userLocation = await location.getLocation();
      _currentLocation= UserLocation(userLocation.latitude!, userLocation.longitude!);
    } on Exception catch(e){
      if (kDebugMode) {
        print("Could Not Get Location : ${e.toString()}");
      }
    }
    return _currentLocation;
  }
  final StreamController<UserLocation> _locationController = StreamController<UserLocation>.broadcast();
  Stream<UserLocation> get locationStream => _locationController.stream;
  LocationService() {
    location.requestPermission().then((PermissionStatus granted){
      if (kDebugMode) {
        print("MockLocation $granted");
      }

      if(granted==PermissionStatus.granted){
        location.onLocationChanged.listen((locationData) {
          _locationController.add(UserLocation(locationData.latitude!, locationData.longitude!));
        });
      }
    });
  }
}
class UserLocation{
  final double latitude;
  final double longitude;
  UserLocation(this.latitude,this.longitude);
}

