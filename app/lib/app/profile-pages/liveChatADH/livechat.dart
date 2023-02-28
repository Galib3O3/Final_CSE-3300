import 'package:app/app/profile-pages/liveChatADH/adhoc_page.dart';
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
        child: SingleChildScrollView(
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
              Divider(
                height: 20,
              ),
              Container(
                height: 180,
                width: 340,
                padding: EdgeInsets.all(15),
                color: Color.fromARGB(237, 93, 205, 225),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: 10.0),
                      Text(
                        'আমরা শীঘ্রই লাইভ চ্যাট নিয়ে আসবো।',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        'Ad-Hoc নেটওয়ার্ক নিয়ে আমরা কাজ করতেছি',
                        style: TextStyle(
                          fontFamily: AutofillHints.givenName,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 20.0),
                      Text(
                        'ইউজার নেটওয়ার্ক ছাড়া একে অন্যের  সাথে \n\t\t\t\tবার্তা আদান প্রদান করতে পারবে।',
                        style: TextStyle(
                          fontFamily: AutofillHints.givenName,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              GestureDetector(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.all(10),
                      height: 100,
                      width: 130,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/adhoc.jpg"),
                          fit: BoxFit.cover,
                          repeat: ImageRepeat.noRepeat,
                        ),
                      ),
                    ),
                    Center(
                        child: Text(
                      '     More Adhoc',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 16, 223, 40),
                      ),
                    ))
                  ],
                ),
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => AdhocPageView()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
