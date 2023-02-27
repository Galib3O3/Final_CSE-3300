import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dart_design/user-form/name_field.dart';
import 'package:flutter/material.dart';

class jela extends StatefulWidget {
  const jela({super.key});

  @override
  State<jela> createState() => _jelaState();
}

class _jelaState extends State<jela> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Column(children: [
            SizedBox(
              height: 300,
            ),
            GestureDetector(
              child: Container(
                height: 40,
                width: 150,
                child: Center(
                  child: Text(
                    "Sylhet",
                    style: TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontSize: 20),
                  ),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Colors.blue,
                ),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => namefield()));
              },
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              child: Container(
                height: 40,
                width: 150,
                child: Center(
                  child: Text(
                    "Sunamgang",
                    style: TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontSize: 20),
                  ),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Colors.blue,
                ),
              ),
              onTap: () {
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (context) => upjela2()));
                AwesomeDialog(
                  context: context,
                  dialogType: DialogType.info,
                  animType: AnimType.rightSlide,
                  title: 'Update',
                  desc: 'This page is not updated',
                  btnOkOnPress: () {},
                ).show();
              },
            ),
          ]),
        ),
      ),
    );
  }
}
