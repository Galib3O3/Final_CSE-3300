import 'dart:math';
import 'package:flutter/material.dart';

class DistanceCalculator {
  static final double _earthRadius = 6371;

  static double haversineDistance(
      double lat1, double lon1, double lat2, double lon2) {
    var dLat = _toRadians(lat2 - lat1);
    var dLon = _toRadians(lon2 - lon1);

    lat1 = _toRadians(lat1);
    lat2 = _toRadians(lat2);

    var a = sin(dLat / 2) * sin(dLat / 2) +
        sin(dLon / 2) * sin(dLon / 2) * cos(lat1) * cos(lat2);
    var c = 2 * atan2(sqrt(a), sqrt(1 - a));

    return _earthRadius * c;
  }

  static double _toRadians(double degree) {
    return degree * pi / 180;
  }
}

class DistanceBetweenUserAndVolunteerPage extends StatefulWidget {
  @override
  _DistanceBetweenUserAndVolunteerPageState createState() =>
      _DistanceBetweenUserAndVolunteerPageState();
}

class _DistanceBetweenUserAndVolunteerPageState
    extends State<DistanceBetweenUserAndVolunteerPage> {
  double _userLatitude = 37.4219999;
  double _userLongitude = -122.0840575;
  double _volunteerLatitude = 37.33233141;
  double _volunteerLongitude = -122.0312186;
  double _distance = 0;

  void _calculateDistance() {
    setState(() {
      _distance = DistanceCalculator.haversineDistance(_userLatitude,
          _userLongitude, _volunteerLatitude, _volunteerLongitude);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Distance between user and volunteer"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "User Latitude",
              ),
              onChanged: (value) {
                setState(() {
                  _userLatitude = double.parse(value);
                });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "User Longitude",
              ),
              onChanged: (value) {
                setState(() {
                  _userLongitude = double.parse(value);
                });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Volunteer Latitude",
              ),
              onChanged: (value) {
                setState(() {
                  _volunteerLatitude = double.parse(value);
                });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Volunteer Longitude",
              ),
              onChanged: (value) {
                setState(() {
                  _volunteerLongitude = double.parse(value);
                });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              child: Text("Calculate Distance"),
              onPressed: _calculateDistance,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Distance: $_distance km"),
          ),
        ],
      ),
    );
  }
}
