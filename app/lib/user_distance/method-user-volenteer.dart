import 'package:flutter/material.dart';
import 'dart:math';

class DistanceUserVolenmCalculator {
  static double calculateDistance(
      double lat1, double lon1, double lat2, double lon2) {
    double angelLon = lon1 - lon2;
    double totalDistance = sin(degToRad(lat1)) * sin(degToRad(lat2)) +
        cos(degToRad(lat1)) * cos(degToRad(lat2)) * cos(degToRad(angelLon));

    totalDistance = acos(totalDistance);
    totalDistance = radToDeg(totalDistance);
    totalDistance = totalDistance * 60 * 1.1515 * 1.60934;
    return totalDistance.ceilToDouble();

    // double p = 0.017453292519943295;
    // double a = 0.5 -
    //     cos((lat2 - lat1) * p) / 2 +
    //     cos(lat1 * p) * cos(lat2 * p) * (1 - cos((lon2 - lon1) * p)) / 2;

    // double total = 12742 * asin(sqrt(a));
    // return total.ceilToDouble();
  }

  static double degToRad(double deg) {
    return (deg * pi / 180.0);
  }

  static double radToDeg(double rad) {
    return (rad * 180 / pi);
  }
}
