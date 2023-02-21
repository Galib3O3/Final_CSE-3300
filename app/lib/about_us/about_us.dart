import 'package:flutter/material.dart';

var history = "\nOUR app is mainly divided into 4 parts here"
    "\n\n 1. Careful Message based on Weather\n"
    "\n 2. Nearest Volenteer\n"
    "\n 3. .....\n"
    "\n 4. .....\n"
    "\n .\n .\n .\n .\n .\n .\n"
    "Weather Informations\n"
    "It return current weather along side some additional informations";

// ignore: camel_case_types
class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: const Icon(Icons.developer_board),
          title: const Text(
            'About us ',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 22,
              height: 2,
              letterSpacing: 5, //letter spacing
              decorationStyle: TextDecorationStyle.double,
              decorationThickness: 1.5,
              fontStyle: FontStyle.italic,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const Padding(padding: EdgeInsets.only(top: 30)),
              Container(
                child: Image.asset(
                  'img/sv.png',
                  fit: BoxFit.fitWidth,
                  height: 120,
                  width: 120,
                ),
              ),
              Container(
                height: 100,
                width: 150,
                color: Colors.amber,
                child: SingleChildScrollView(
                  child: Column(children: [
                    Container(
                      height: 100,
                      width: 100,
                      color: Colors.black,
                    ),
                    SizedBox(
                      width: 45,
                    ),
                    Container(
                      height: 100,
                      width: 100,
                      color: Color.fromARGB(255, 4, 173, 29),
                    ),
                    SizedBox(
                      width: 45,
                    ),
                    Container(
                      height: 100,
                      width: 100,
                      color: Color.fromARGB(255, 171, 11, 11),
                    ),
                    SizedBox(
                      width: 45,
                    ),
                    Container(
                      height: 100,
                      width: 100,
                      color: Color.fromARGB(255, 16, 203, 10),
                    )
                  ]),
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                height: 250,
                color: Color.fromARGB(255, 7, 181, 255),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Text(
                        "${history}",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                color: Colors.blue,
                child: Column(
                  children: [
                    Column(
                      //mainAxisAlignment: MainAxisAlignment.center,
                      //crossAxisAlignment: CrossAxisAlignment.center,

                      /// ignore: prefer_const_literals_to_create_immutables
                      children: [
                        const Padding(padding: EdgeInsets.only(top: 50)),
                        const Padding(padding: EdgeInsets.only(left: 20)),
                        const Text(
                          "Md.Asadullah-Al-Galib ",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        
                      ],
                    ),
                  ],
                ),
              ),
              Row(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  const Padding(padding: EdgeInsets.only(top: 50)),
                  const Padding(padding: EdgeInsets.only(left: 20)),
                  const Text(
                    "Md Sajjadur Rahman",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Row(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  const Padding(padding: EdgeInsets.only(top: 50)),
                  const Padding(padding: EdgeInsets.only(left: 20)),
                  const Text(
                    "Samina Hussain",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Row(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  const Padding(padding: EdgeInsets.only(top: 50)),
                  const Padding(padding: EdgeInsets.only(left: 20)),
                  const Text(
                    "Student of Leading University",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
