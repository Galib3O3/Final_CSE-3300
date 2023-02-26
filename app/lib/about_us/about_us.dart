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

String st =
    "The Save Community and Save Nation application is a disaster management app "
    "that provides useful information based on weather status ID, shelter information........";

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
        body: Center(
          child: SingleChildScrollView(
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
                customeButton(context),
                Container(
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(0),
                  height: 200,
                  width: 320,
                  // color: Color.fromARGB(255, 7, 181, 255),
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 111, 210, 189),
                      border: Border.all(
                          color: Color.fromARGB(255, 36, 11, 20), width: 2),
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    children: [
                      Text(
                        st,
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      customeButton(context),
                    ],
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
      ),
    );
  }
}

Widget customeButton(BuildContext context) {
  return ElevatedButton(
    onPressed: () {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      history,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                      ),
                    ),
                    Text(
                      'Dialog Title',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                      ),
                    ),
                    Text(
                      'Dialog Title',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                      ),
                    ),
                    Text(
                      'Dialog Content',
                      style: TextStyle(fontSize: 16.0),
                    ),
                    SizedBox(height: 16.0),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('Close'),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      );
    },
    child: Text('More Info'),
  );
}

String st3 =
    "The Save Community and Save Nation is a comprehensive solution that "
    " combines all essential features on a single platform, including shelter information,"
    " weather status alerts, volunteer information "
    " (user-to-volunteer distances), and the ability to join a community as a volunteer.";
