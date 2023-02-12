import 'package:flutter/material.dart';
import 'dart:math';

class UserPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Two Point Distance'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Distance between Point A and Point B:',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              calculateDistance().toString() + ' km',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }

  double calculateDistance() {
    final double lat1 = 40.7128;
    final double long1 = -74.0060;
    final double lat2 = 37.7749;
    final double long2 = -122.4194;

    double theta = long1 - long2;
    double dist = sin(degToRad(lat1)) * sin(degToRad(lat2)) +
        cos(degToRad(lat1)) * cos(degToRad(lat2)) * cos(degToRad(theta));
    dist = acos(dist);
    dist = radToDeg(dist);
    dist = dist * 60 * 1.1515;
    return dist;
  }

  double degToRad(double deg) {
    return (deg * pi / 180.0);
  }

  double radToDeg(double rad) {
    return (rad * 180 / pi);
  }
}
