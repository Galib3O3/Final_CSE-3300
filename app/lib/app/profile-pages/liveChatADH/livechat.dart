import 'package:flutter/material.dart';

class livecaht extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Live Chat'),
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
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 300.0,
              height: 200.0,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/lc.gif"),
                  fit: BoxFit.cover,
                  repeat: ImageRepeat.noRepeat,
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              'আমরা শীঘ্রই লাইভ চ্যাট নিয়ে আসবো।',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 19.0),
            Text(
              'Ad-Hoc নেটওয়ার্ক নিয়ে আমরা কাজ করতেছি',
              style: TextStyle(
                fontFamily: AutofillHints.givenName,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              'ইউজার নেটওয়ার্ক ছাড়া একে অন্যের  সাথে ',
              style: TextStyle(
                fontFamily: AutofillHints.givenName,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              'বার্তা আদান প্রদান করতে পারবে।',
              style: TextStyle(
                fontFamily: AutofillHints.givenName,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
