import 'dart:ui';
import 'package:app/user_distance/app/views/District-information/LocationAndVolunterrs/SylhetRegion.dart';
import 'package:app/app/profile-pages/liveChatADH/livechat.dart';
import 'package:app/profilepage/profile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import '../../Dontaion/donation.dart';
import '../../about_us/about_us.dart';
import '../../constants/text.dart';
import '../../function/user_func.dart';
import '../../login_reg/login.dart';
import '../../shelter/shelter_page_view.dart';
import '../../weather-parts/app/district-profile_page_sylhet.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

class SixProfileView extends StatefulWidget {
  const SixProfileView({super.key});

  @override
  _SixProfileViewState createState() => _SixProfileViewState();
}

class _SixProfileViewState extends State<SixProfileView> {
  dynamic lat, lon, sunRise, sunSet, wind;

  User? user = FirebaseAuth.instance.currentUser;
  UserFunc loggedUser = UserFunc();

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.email)
        .get()
        .then((value) {
      loggedUser = UserFunc.fromMap(value.data());
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              AwesomeDialog(
                context: context,
                dialogType: DialogType.question,
                animType: AnimType.rightSlide,
                title: ExitMessage,
                desc: decsTitle,
                btnCancelOnPress: () {},
                btnOkOnPress: () {
                  SystemNavigator.pop();
                },
              ).show();
            },
            icon: const Icon(Icons.exit_to_app_outlined),
          ),
        ],
        title: const Center(child: Text("HOME PAGE")),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
          child: Column(
        children: [
          const SizedBox(
            height: 75,
          ),

          // ignore: unnecessary_new
          Expanded(
              child: GridView.extent(
            primary: false,
            padding: const EdgeInsets.all(14),
            crossAxisSpacing: 15,
            mainAxisSpacing: 40,
            maxCrossAxisExtent: 200.0,
            children: <Widget>[
              GestureDetector(
                  child: Column(
                    children: [
                      Container(
                        height: 80,
                        width: 80,
                        padding: const EdgeInsets.all(8),
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/clouds_sun.png"),
                            fit: BoxFit.cover,
                            repeat: ImageRepeat.noRepeat,
                          ),
                        ),
                      ),
                      const Text(
                        Tweather,
                        style: TextStyle(fontSize: 18),
                      )
                    ],
                  ),
                  onTap: () {
                    Get.to(DistrictGridPage());
                  }),
              GestureDetector(
                  child: Column(
                    children: [
                      Container(
                        height: 80,
                        width: 80,
                        padding: const EdgeInsets.all(8),
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/shelter.png"),
                            fit: BoxFit.cover,
                            repeat: ImageRepeat.noRepeat,
                          ),
                        ),
                      ),
                      const Text(
                        Tshelter,
                        style: TextStyle(fontSize: 18),
                      )
                    ],
                  ),
                  onTap: () {
                    setState(() {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SchoolWithData()),
                      );
                    });
                  }),
              GestureDetector(
                  child: Column(
                    children: [
                      Container(
                        height: 80,
                        width: 80,
                        padding: const EdgeInsets.all(8),
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/volunteer.png"),
                            fit: BoxFit.cover,
                            repeat: ImageRepeat.noRepeat,
                          ),
                        ),
                      ),
                      const Text(
                        Tvolunteer,
                        style: TextStyle(fontSize: 18),
                      )
                    ],
                  ),
                  onTap: () {
                    setState(() {
                      Get.to(const SylhetRegion());
                    });
                  }),
              GestureDetector(
                  child: Column(
                    children: [
                      Container(
                        height: 80,
                        width: 80,
                        padding: const EdgeInsets.all(8),
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/donation.png"),
                            fit: BoxFit.cover,
                            repeat: ImageRepeat.noRepeat,
                          ),
                        ),
                      ),
                      const Text(
                        Tdonation,
                        style: TextStyle(fontSize: 18),
                      )
                    ],
                  ),
                  onTap: () {
                    setState(() {
                      Get.to(const donation());
                    });
                  }),
              GestureDetector(
                  child: Column(
                    children: [
                      Container(
                        height: 80,
                        width: 80,
                        padding: const EdgeInsets.all(8),
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/LC.png"),
                            fit: BoxFit.cover,
                            repeat: ImageRepeat.noRepeat,
                          ),
                        ),
                      ),
                      const Text(
                        Tlivechat,
                        style: TextStyle(fontSize: 18),
                      )
                    ],
                  ),
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => livecaht()));
                  }),
              GestureDetector(
                  child: Column(
                    children: [
                      Container(
                        height: 80,
                        width: 80,
                        padding: const EdgeInsets.all(8),
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/about_us.png"),
                            fit: BoxFit.cover,
                            repeat: ImageRepeat.noRepeat,
                          ),
                        ),
                      ),
                      const Text(
                        Taboutus,
                        style: TextStyle(fontSize: 18),
                      )
                    ],
                  ),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const AboutusPage()));
                  }),
            ],
          )),
          // ElevatedButton(
          //     onPressed: () {
          //       logout(context);
          //     },
          //     child: const Text("Log out")),
          const SizedBox(
            height: 20,
          ),
        ],
      )),
      backgroundColor: Color.fromARGB(251, 253, 253, 253),
      drawer: Drawer(
        child: Container(
          color: Color.fromARGB(255, 43, 152, 224),
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              UserAccountsDrawerHeader(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('img/save.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                accountName:
                    Text("${loggedUser.firstName} ${loggedUser.lastName}",
                        style: const TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontSize: 20,
                        )),
                accountEmail: Text("${loggedUser.email}",
                    style: const TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontSize: 20,
                    )),
              ),
              Divider(
                height: 10,
                thickness: 20,
              ),
              ListTile(
                title: const Text(
                  'Profile ',
                  style: TextStyle(
                      color: Color.fromARGB(255, 29, 29, 29), fontSize: 20),
                ),
                leading: const Icon(Icons.account_box_rounded),
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => ProfilePage()));
                },
              ),
              ListTile(
                title: const Text(
                  'Logout',
                  style: TextStyle(
                      color: Color.fromARGB(255, 29, 29, 29), fontSize: 20),
                ),
                leading: const Icon(Icons.logout),
                onTap: () {
                  logout(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();

    // ignore: use_build_context_synchronously
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const loginscreen()));
    Fluttertoast.showToast(
        msg: "Logout Successfully",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 3,
        backgroundColor: Colors.orange,
        textColor: Colors.black,
        fontSize: 16.0);
  }
}
