import 'package:flutter/material.dart';
import '../../SunamganjDistancePage/dirai-sunamganj-volunteer.dart';
import '../../SunamganjDistancePage/tahirpur-sunamganj-volunter.dart';
import '../../SunamganjDistancePage/userDistanceProfileSunamganj.dart';

class Info1 extends StatelessWidget {
  final data;
  Info1(this.data);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Areas")),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: [
          Column(
            children: [
              const SizedBox(height: 5.0),
              Column(
                children: [
                  const SizedBox(height: 15.0),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Card(
                      color: const Color.fromARGB(255, 6, 172, 218),
                      child: ListTile(
                        title: Text(
                          data["sunamgonj"],
                          style: const TextStyle(
                            fontSize: 19,
                            color: Colors.black,
                          ),
                        ),
                        onTap: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) =>
                                      UserDistanceProfilePage_sunamganj()));
                        },
                        leading: const CircleAvatar(
                          backgroundColor: Color.fromARGB(255, 9, 129, 241),
                          child: Icon(
                            Icons.location_pin,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  const SizedBox(height: 5.0),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Card(
                      color: const Color.fromARGB(255, 6, 172, 218),
                      child: ListTile(
                        title: Text(
                          data["dirai"],
                          style: const TextStyle(
                            fontSize: 19,
                            color: Colors.black,
                          ),
                        ),
                        onTap: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) =>
                                      UserDistanceProfilePage_dirai()));
                        },
                        leading: const CircleAvatar(
                          backgroundColor: Color.fromARGB(255, 9, 129, 241),
                          child: Icon(
                            Icons.location_pin,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                //mainAxisSize: MainAxisSize.max,
                children: [
                  const SizedBox(height: 5.0),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Card(
                      color: Color.fromARGB(255, 6, 172, 218),
                      child: ListTile(
                        title: Text(
                          data["tahirpur"],
                          style: const TextStyle(
                            fontSize: 19,
                            color: Colors.black,
                          ),
                        ),
                        onTap: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) =>
                                      UserDistanceProfilePage_tahirpur()));
                        },
                        //
                        // leading: Icon(Icons.location_pin,
                        //     size: 40, color: Colors.blue),

                        leading: const CircleAvatar(
                          backgroundColor: Color.fromARGB(255, 9, 129, 241),
                          child: Icon(
                            Icons.location_pin,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                      ),
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
