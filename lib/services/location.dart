import 'package:geolocator/geolocator.dart';

class Location {
  late double long;
  late double lat;

  Future<void> getCurrentLocation() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.deniedForever ||
        permission == LocationPermission.denied) {
        print("Locatoin Denied");
        LocationPermission ask = await Geolocator.requestPermission();
    }
    else {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
          lat = position.latitude;
          long = position.longitude;
    }
  }
}