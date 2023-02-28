import 'package:app/constants/color.dart';
import 'package:app/constants/size.dart';
import 'package:app/constants/text.dart';
import 'package:app/login_reg/login.dart';
import 'package:app/login_reg/registration.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constants/images.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Container(
        padding: EdgeInsets.all(tDefaultSize),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image(
                image: AssetImage(
              welcomeImage,
            )),
            Column(
              children: [
                Text(
                  welcomeT,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ],
            ),
            Row(children: [
              Expanded(
                child: OutlinedButton(
                    onPressed: () {
                      Get.to((loginscreen()));
                    },
                    style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(),
                        foregroundColor: secondary_color,
                        side: BorderSide(color: secondary_color),
                        padding: EdgeInsets.symmetric(vertical: buttonSize)),
                    child: Text(loginT.toUpperCase())),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: ElevatedButton(
                    onPressed: () {
                      Get.to(RegScreen());
                    },
                    style: ElevatedButton.styleFrom(
                        elevation: 1,
                        shape: RoundedRectangleBorder(),
                        foregroundColor: white_color,
                        backgroundColor: secondary_color,
                        side: BorderSide(color: white_color),
                        padding: EdgeInsets.symmetric(vertical: buttonSize)),
                    child: Text(SignupT.toUpperCase())),
              )
            ]),
          ],
        ),
      ),
    );
  }
}
