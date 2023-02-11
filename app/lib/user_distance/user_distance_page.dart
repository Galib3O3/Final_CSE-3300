import 'dart:math';

import 'package:flutter/material.dart';

class LGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("USER"),
      ),
      body: Center(
          child: Column(
        children: [
          SizedBox(
            height: 40,
          ),
          // ignore: unnecessary_new
          Expanded(
              child: GridView.extent(
            primary: false,
            padding: const EdgeInsets.all(14),
            crossAxisSpacing: 15,
            mainAxisSpacing: 30,
            maxCrossAxisExtent: 150.0,
            children: <Widget>[
              GestureDetector(
                  child: Column(
                    children: [
                      Container(
                        height: 80,
                        width: 80,
                        padding: const EdgeInsets.all(8),
                      ),
                    ],
                  ),
                  onTap: () {}),
              GestureDetector(
                  child: Column(
                    children: [
                      Container(
                        height: 80,
                        width: 80,
                        padding: const EdgeInsets.all(8),
                      ),
                      Text(
                        "User1",
                        style: TextStyle(fontSize: 18),
                      )
                    ],
                  ),
                  onTap: () {}),
              GestureDetector(
                  child: Column(
                    children: [
                      Container(
                        height: 80,
                        width: 80,
                        padding: const EdgeInsets.all(8),
                      ),
                    ],
                  ),
                  onTap: () {}),
              GestureDetector(
                  child: Column(
                    children: [
                      Container(
                        height: 80,
                        width: 80,
                        padding: const EdgeInsets.all(8),
                      ),
                    ],
                  ),
                  onTap: () {}),
              GestureDetector(
                  child: Column(
                    children: [
                      Container(
                        height: 80,
                        width: 80,
                        padding: const EdgeInsets.all(8),
                      ),
                    ],
                  ),
                  onTap: () {}),
              GestureDetector(
                  child: Column(
                    children: [
                      Container(
                        height: 80,
                        width: 80,
                        padding: const EdgeInsets.all(8),
                      ),
                      Text(
                        "User2",
                        style: TextStyle(fontSize: 18),
                      )
                    ],
                  ),
                  onTap: () {}),
              GestureDetector(
                  child: Column(
                    children: [
                      Container(
                        height: 80,
                        width: 80,
                        padding: const EdgeInsets.all(8),
                      ),
                      Text(
                        "Volunteer1",
                        style: TextStyle(fontSize: 18),
                      )
                    ],
                  ),
                  onTap: () {}),
              GestureDetector(
                  child: Column(
                    children: [
                      Container(
                        height: 80,
                        width: 80,
                        padding: const EdgeInsets.all(8),
                      ),
                    ],
                  ),
                  onTap: () {}),
              GestureDetector(
                  child: Column(
                    children: [
                      Container(
                        height: 80,
                        width: 80,
                        padding: const EdgeInsets.all(8),
                      ),
                    ],
                  ),
                  onTap: () {}),
              GestureDetector(
                  child: Column(
                    children: [
                      Container(
                        height: 80,
                        width: 80,
                        padding: const EdgeInsets.all(8),
                      ),
                    ],
                  ),
                  onTap: () {}),
              GestureDetector(
                  child: Column(
                    children: [
                      Container(
                        height: 80,
                        width: 80,
                        padding: const EdgeInsets.all(8),
                      ),
                      Text(
                        "Volunteer2",
                        style: TextStyle(fontSize: 18),
                      )
                    ],
                  ),
                  onTap: () {}),
              GestureDetector(
                  child: Column(
                    children: [
                      Container(
                        height: 80,
                        width: 80,
                        padding: const EdgeInsets.all(8),
                      ),
                      Text(
                        "Volunteer3",
                        style: TextStyle(fontSize: 18),
                      )
                    ],
                  ),
                  onTap: () {}),
            ],
          )),

          SizedBox(
            height: 20,
          )
        ],
      )),
      backgroundColor: Color.fromARGB(248, 245, 245, 245),
    );
  }
}
