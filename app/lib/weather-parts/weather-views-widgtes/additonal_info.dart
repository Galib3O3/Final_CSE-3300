import 'package:flutter/material.dart';

TextStyle titleFont =
    const TextStyle(fontWeight: FontWeight.w600, fontSize: 18.0);
Widget additionalInformation(String wind, String humidity, String pressure,
    String feels_like, dynamic id) {
  return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "wind",
                      style: titleFont,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "humidity ",
                      style: titleFont,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Pressure ",
                      style: titleFont,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Feels Like  ",
                      style: titleFont,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "ID  ",
                      style: titleFont,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ]),
              Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "$wind",
                      style: titleFont,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "$humidity ",
                      style: titleFont,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "$pressure ",
                      style: titleFont,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "$feels_like ",
                      style: titleFont,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "$id ",
                      style: titleFont,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ])
            ],
          )
        ],
      ));
}
