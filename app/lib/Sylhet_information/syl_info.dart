import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Info extends StatelessWidget {
  final data;
  Info(this.data);

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
                        data["Sylhet Sadar"],
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
                        data["Companigonj"],
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
                        data["Dokkhin Surma"],
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
                        data["Fenchuganj"],
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
                        data["Golapgonj"],
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
                        data["Jaintapur"],
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
                        data["Kanaighat"],
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
                        data["Osmani Nagar"],
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
                        data["Zakiganj"],
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
                        data["Balaganj"],
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
