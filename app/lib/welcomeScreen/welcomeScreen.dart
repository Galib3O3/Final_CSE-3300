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
        padding: const EdgeInsets.all(tDefaultSize),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Image(
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
                      Get.to((const loginscreen()));
                    },
                    style: OutlinedButton.styleFrom(
                        shape: const RoundedRectangleBorder(),
                        foregroundColor: secondary_color,
                        side: const BorderSide(color: secondary_color),
                        padding:
                            const EdgeInsets.symmetric(vertical: buttonSize)),
                    child: Text(Tlogin.toUpperCase())),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: ElevatedButton(
                    onPressed: () {
                      Get.to(RegScreen());
                    },
                    style: ElevatedButton.styleFrom(
                        elevation: 1,
                        shape: const RoundedRectangleBorder(),
                        foregroundColor: white_color,
                        backgroundColor: secondary_color,
                        side: const BorderSide(color: white_color),
                        padding:
                            const EdgeInsets.symmetric(vertical: buttonSize)),
                    child: Text(SignupT.toUpperCase())),
              )
            ]),
          ],
        ),
      ),
    );
  }
}
