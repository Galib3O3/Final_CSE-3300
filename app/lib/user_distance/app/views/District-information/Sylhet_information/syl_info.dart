import 'package:app/user_distance/app/views/UserDistanceSylhet/UserDistanceCompaniganj/user_distance_page_comp.dart';
import 'package:app/user_distance/app/views/UserDistanceSylhet/UserDistanceJaintapur/UserDistanceJaintapur.dart';
import 'package:flutter/material.dart';

import '../../UserDistanceSylhet/UserDistanceSylSadar/user_distance_page.dart';

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
              const SizedBox(height: 15.0),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    const SizedBox(height: 15.0),
                    Card(
                      color: const Color.fromARGB(255, 6, 172, 218),
                      child: ListTile(
                        title: Text(
                          data["Sylhet Sadar"],
                          style: const TextStyle(
                            fontSize: 19,
                            color: Colors.black,
                          ),
                        ),
                        onTap: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) =>
                                      UserDistanceProfilePage_SYL()));
                        },
                        leading: const Icon(Icons.location_pin,
                            size: 40, color: Colors.blue),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    const SizedBox(height: 15.0),
                    Card(
                      color: const Color.fromARGB(255, 6, 172, 218),
                      child: ListTile(
                        title: Text(
                          data["Companigonj"],
                          style: const TextStyle(
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
                        leading: const Icon(Icons.location_pin,
                            size: 40, color: Colors.blue),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    const SizedBox(height: 15.0),
                    Card(
                      color: const Color.fromARGB(255, 6, 172, 218),
                      child: ListTile(
                        title: Text(
                          data["Jaintapur"],
                          style: const TextStyle(
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
                        leading: const Icon(Icons.location_pin,
                            size: 40, color: Colors.blue),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
