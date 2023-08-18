import 'dart:math';

import 'package:geolocator/geolocator.dart';

import '../models/hospital_model.dart';

class Helper {
  static Future<Position> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }

  double calculateDistance(double lat1, double lon1, double lat2, double lon2) {
    const R = 6371.0; // Earth's radius in kilometers
    final lat1Rad = degreesToRadians(lat1);
    final lon1Rad = degreesToRadians(lon1);
    final lat2Rad = degreesToRadians(lat2);
    final lon2Rad = degreesToRadians(lon2);

    final dlat = lat2Rad - lat1Rad;
    final dlon = lon2Rad - lon1Rad;

    final a = pow(sin(dlat / 2), 2) +
        cos(lat1Rad) * cos(lat2Rad) * pow(sin(dlon / 2), 2);
    final c = 2 * atan2(sqrt(a), sqrt(1 - a));

    return R * c;
  }

  double degreesToRadians(double degrees) {
    return degrees * (pi / 180.0);
  }

  double calculateBearing(double lat1, double lon1, double lat2, double lon2) {
    final y = sin(degreesToRadians(lon2 - lon1)) * cos(degreesToRadians(lat2));
    final x = cos(degreesToRadians(lat1)) * sin(degreesToRadians(lat2)) -
        sin(degreesToRadians(lat1)) *
            cos(degreesToRadians(lat2)) *
            cos(degreesToRadians(lon2 - lon1));
    final bearing = atan2(y, x);

    return (bearing + 2 * pi) % (2 * pi); // Normalize to [0, 2*pi]
  }

  List<Hospital> sortPositionsByFewestDirections(
      Position currentPos, List<Hospital> positions) {
    positions.sort((pos1, pos2) {
      final bearing1 = calculateBearing(
          currentPos.latitude, currentPos.longitude, pos1.geolocation.latitude, pos1.geolocation.longitude);
      final bearing2 = calculateBearing(
          currentPos.latitude, currentPos.longitude, pos2.geolocation.latitude, pos2.geolocation.longitude);

      return bearing1.compareTo(bearing2);
    });

    return positions;
  }

}