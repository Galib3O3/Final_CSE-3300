import 'package:flutter/material.dart';

String history = "\nOUR app is mainly divided into 4 parts here"
    "\n\n 1. Careful Message based on Weather\n"
    "\n 2. Nearest Volenteer\n"
    "\n 3. .....\n"
    "\n 4. .....\n"
    "\n .\n .\n .\n .\n .\n .\n"
    "**** Weather Informations ***\n"
    "It return current weather along side some additional informations "
    "Also the weather careful informations is based on the ID status "
    "\n  \n"
    "**** Volunteer ***\n"
    "There is 2 parts one can show the user list of the messenger\n"
    "another one is volunteer form where new user can want to join"
    "\n  \n"
    " Shlter Part \n"
    " In this function we are trying to add shelter name and populations"
    "\nanother one ";

// ignore: camel_case_types
class AboutusPage extends StatelessWidget {
  const AboutusPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(
              Icons.developer_board,
              color: Color.fromARGB(255, 250, 253, 255),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
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
              const Padding(padding: EdgeInsets.only(top: 10)),
              Container(
                child: Image.asset(
                  'img/sv.png',
                  fit: BoxFit.fitWidth,
                  height: 120,
                  width: 120,
                ),
              ),
              // Container(
              //   height: 100,
              //   width: 150,
              //   color: Colors.amber,
              //   child: SingleChildScrollView(
              //     child: Column(children: [
              //       Container(
              //         height: 100,
              //         width: 100,
              //         color: Colors.black,
              //       ),
              //       SizedBox(
              //         width: 45,
              //       ),
              //       Container(
              //         height: 100,
              //         width: 100,
              //         color: Color.fromARGB(255, 4, 173, 29),
              //       ),
              //       SizedBox(
              //         width: 45,
              //       ),
              //       Container(
              //         height: 100,
              //         width: 100,
              //         color: Color.fromARGB(255, 171, 11, 11),
              //       ),
              //       SizedBox(
              //         width: 45,
              //       ),
              //       Container(
              //         height: 100,
              //         width: 100,
              //         color: Color.fromARGB(255, 16, 203, 10),
              //       )
              //     ]),
              //   ),
              // ),

              Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(0),
                height: 280,
                // color: Color.fromARGB(255, 7, 181, 255),
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 111, 210, 189),
                    border: Border.all(
                        color: Color.fromARGB(255, 36, 11, 20), width: 2),
                    borderRadius: BorderRadius.circular(10)),
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
                  child: Image.asset(
                'assets/contibutor.png',
                fit: BoxFit.cover,
                height: 200,
                width: 320,
              )),
            ],
          ),
        ),
      ),
    );
  }
}
