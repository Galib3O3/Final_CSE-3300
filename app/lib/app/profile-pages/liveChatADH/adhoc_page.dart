import 'package:flutter/material.dart';

class AdhocPageView extends StatefulWidget {
  @override
  State<AdhocPageView> createState() => _AdhocPageViewState();
}

class _AdhocPageViewState extends State<AdhocPageView> {
  List data = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        title: Text(
          'More Information about ad hoc ',
          style: TextStyle(fontSize: 18),
        ),
        leading: customeIncon(context),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                child: Container(
                  decoration: customeBoxDecoration(),
                  padding: EdgeInsets.all(20.0), // padding
                  child: Text(
                    'Ad Hoc Algorithm\n          Name', // child widget
                    style: TextStyle(
                      fontSize: 24.0,
                      color: Colors.white,
                    ),
                  ),
                ),
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return customeColumn(context);
                    },
                  );
                },
              ),
              SizedBox(
                height: 30,
              ),
              GestureDetector(
                child: Container(
                  width: 300.0,
                  height: 100.0,
                  color: Colors.red,
                ),
                onTap: () {
                  print("sajjjad");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

TextStyle textStyle(double size) {
  return TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: size,
    color: Colors.blue,
  );
}

IconButton customeIncon(BuildContext context) {
  return IconButton(
    icon: const Icon(
      Icons.arrow_back,
      color: Color.fromARGB(255, 255, 255, 255),
    ),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );
}

BoxDecoration customeBoxDecoration() {
  return BoxDecoration(
    color: Color.fromARGB(255, 34, 162, 225), // background color
    border: Border.all(
      color: Colors.black, // border color
      width: 2.0, // border width
    ),
    borderRadius: BorderRadius.all(Radius.circular(10.0)), // border radius
  );
}

Widget customeColumn(BuildContext context) {
  return Dialog(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15.0),
    ),
    child: SingleChildScrollView(
      child: Container(
        width: 320,
        padding: EdgeInsets.all(15.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Text(
                  "1. Routing Algorithms",
                  style: textStyle(20),
                ),
                Divider(),
                Text('Routing Algorithms\n\n'
                    'Distance Vector Routing (DVR),\n\n'
                    'Link State Routing (LSR),\n\n'
                    'Hybrid Routing.\n\n'),
                Divider(),
              ],
            ),
            Text(
              "2. Clustering Algorithms",
              style: textStyle(20),
            ),
            Divider(),
            Text(
              "3. Security Algorithms",
              style: textStyle(20),
            ),
            Divider(),
            Column(
              children: [
                Text(
                  "4. Mobility Management ",
                  style: textStyle(20),
                ),
                Text(
                  '\n\n- - - - - sub type - - - - -  \n\n'
                  ' Location-Aided Routing (LAR) \n\n'
                  'Grid Location Service (GLS) ,\n\n'
                  'Distance-Based Mobility Prediction (DMP).\n\n'
                  'Quality of Service (QoS) \n\n',
                ),
              ],
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
