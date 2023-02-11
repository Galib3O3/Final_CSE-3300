import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Info1 extends StatelessWidget {
  final data;
  Info1(this.data);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Areas")),
      body: ListView(
        children: [
          Column(
            children: [
              SizedBox(height: 15.0),
              Column(
                children: [
                  SizedBox(height: 15.0),
                  Card(
                    child: ListTile(
                      title: Text(
                        data["sunamgonj"],
                        style: TextStyle(
                          fontSize: 19,
                          color: Colors.black,
                        ),
                      ),
                      leading: Icon(Icons.location_pin,
                          size: 40, color: Colors.blue),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  SizedBox(height: 15.0),
                  Card(
                    child: ListTile(
                      title: Text(
                        data["dirai"],
                        style: TextStyle(
                          fontSize: 19,
                          color: Colors.black,
                        ),
                      ),
                      leading: Icon(Icons.location_pin,
                          size: 40, color: Colors.blue),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  SizedBox(height: 15.0),
                  Card(
                    child: ListTile(
                      title: Text(
                        data["chattak"],
                        style: TextStyle(
                          fontSize: 19,
                          color: Colors.black,
                        ),
                      ),
                      leading: Icon(Icons.location_pin,
                          size: 40, color: Colors.blue),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  SizedBox(height: 15.0),
                  Card(
                    child: ListTile(
                      title: Text(
                        data["jagannathpur"],
                        style: TextStyle(
                          fontSize: 19,
                          color: Colors.black,
                        ),
                      ),
                      leading: Icon(Icons.location_pin,
                          size: 40, color: Colors.blue),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  SizedBox(height: 15.0),
                  Card(
                    child: ListTile(
                      title: Text(
                        data["tahirpur"],
                        style: TextStyle(
                          fontSize: 19,
                          color: Colors.black,
                        ),
                      ),
                      leading: Icon(Icons.location_pin,
                          size: 40, color: Colors.blue),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  SizedBox(height: 15.0),
                  Card(
                    child: ListTile(
                      title: Text(
                        data["jamalgonj"],
                        style: TextStyle(
                          fontSize: 19,
                          color: Colors.black,
                        ),
                      ),
                      leading: Icon(Icons.location_pin,
                          size: 40, color: Colors.blue),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  SizedBox(height: 15.0),
                  Card(
                    child: ListTile(
                      title: Text(
                        data["shalla"],
                        style: TextStyle(
                          fontSize: 19,
                          color: Colors.black,
                        ),
                      ),
                      leading: Icon(Icons.location_pin,
                          size: 40, color: Colors.blue),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
