import 'package:app/user_distance/UserDistanceSylhet/UserDistanceCompaniganj/user_distance_page_comp.dart';
import 'package:app/user_distance/UserDistanceSylhet/UserDistanceJaintapur/UserDistanceJaintapur.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../user_distance/UserDistanceSylhet/UserDistanceSylSadar/user_distance_page.dart';

class Info extends StatelessWidget {
  final data;
  Info(this.data);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Areas"),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Color.fromARGB(255, 255, 255, 255),
          ),
          onPressed: () {
            //go to login section
            Navigator.of(context).pop();
          },
        ),
      ),
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
                      onTap: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) =>
                                UserDistanceProfilePage_SYL()));
                      },
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
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    UserDistanceProfilePage_Companigonj()));
                      },
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
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    UserDistanceProfilePage_Jaintapur()));
                      },
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
