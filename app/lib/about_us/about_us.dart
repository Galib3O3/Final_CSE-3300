import 'package:flutter/material.dart';
import 'package:vector_math/vector_math.dart' as math;

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
                SizedBox(
                  height: 30,
                ),
                Center(child: Text(" D E S C R I P T I  O N ")),
                SizedBox(
                  height: 20,
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(0),
                  height: 200,
                  width: 320,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color.fromARGB(255, 59, 178, 234),
                        Color.fromARGB(255, 35, 186, 213),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    border: Border.all(
                      color: Color.fromARGB(255, 36, 11, 20),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color:
                            Color.fromARGB(255, 230, 219, 219).withOpacity(0.2),
                        spreadRadius: 3,
                        blurRadius: 5,
                        offset: Offset(1, 3),
                      ),
                    ],
                  ),
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
                SizedBox(
                  height: 40,
                ),
                Center(
                  child: InkWell(
                    child: Text(" C O N T I B U T O R S  "),
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return Dialog(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: SingleChildScrollView(
                              child: Container(
                                padding: EdgeInsets.all(16.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
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
                        },
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget customeButton(BuildContext context) {
  return TextButton(
    style: TextButton.styleFrom(
      backgroundColor: Colors.blue,
      primary: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      textStyle: TextStyle(fontSize: 18.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
    ),
    onPressed: () {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
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
                        fontSize: 24.0,
                        color: Colors.blue,
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      'Dialog Title',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                        color: Colors.black87,
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      'Dialog Subtitle',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                        color: Colors.grey[600],
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Text(
                      'Dialog Content',
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.black87,
                      ),
                    ),
                    SizedBox(height: 20.0),
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

Widget customeContibutors(BuildContext context) {
  return Dialog(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15.0),
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
                fontSize: 24.0,
                color: Colors.blue,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              'Dialog Title',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              'Dialog Subtitle',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              'Dialog Content',
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 20.0),
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
}

String st3 =
    "The Save Community and Save Nation is a comprehensive solution that "
    " combines all essential features on a single platform, including shelter information,"
    " weather status alerts, volunteer information "
    " (user-to-volunteer distances), and the ability to join a community as a volunteer.";
