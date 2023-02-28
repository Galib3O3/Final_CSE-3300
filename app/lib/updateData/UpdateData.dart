import 'package:app/app/profile-pages/six_profile_page.dart';
import 'package:app/function/user_func.dart';
import 'package:app/pages/home.dart';
import 'package:app/profilepage/profile.dart';
import 'package:app/user_distance/app/views/District-information/LocationAndVolunterrs/SylhetRegion.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class updatereq extends StatefulWidget {
  const updatereq({super.key});

  @override
  State<updatereq> createState() => _updatereqState();
}

class _updatereqState extends State<updatereq> {
  final OldFname = TextEditingController();
  final OldLname = TextEditingController();
  final NewFname = TextEditingController();
  final NewLname = TextEditingController();
  final email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final OldFnameField = TextFormField(
      // autofocus: false,
      controller: OldFname,
      keyboardType: TextInputType.name,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: const Icon(Icons.person),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          labelText: "Old First Name",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )),
    );
    //Lname
    final OldLnameField = TextFormField(
      autofocus: false,
      controller: OldLname,
      keyboardType: TextInputType.name,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.person),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          labelText: "Old Last Name",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )),
    );

    final NewFnameField = TextFormField(
      autofocus: false,
      controller: NewFname,
      keyboardType: TextInputType.name,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.person),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          labelText: "New First Name",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )),
    );

    final NewLnameField = TextFormField(
      autofocus: false,
      controller: NewLname,
      keyboardType: TextInputType.name,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.person),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          labelText: "New Last Name",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )),
    );

    final EmailField = TextFormField(
      autofocus: false,
      controller: email,
      keyboardType: TextInputType.name,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.email_sharp),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          labelText: "Email",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )),
    );

    final SendBtn = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.blueAccent,
      child: MaterialButton(
        padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () {
          Map<String, dynamic> data = {
            'OldFname': OldFname.text,
            "OldLname": OldLname.text,
            "NewFname": NewFname.text,
            "NewLname": NewLname.text,
            "Email": email.text,
          };

          if (OldFname.text != "" &&
              OldLname.text != "" &&
              NewFname.text != "" &&
              NewLname.text != "" &&
              email.text != "") {
            FirebaseFirestore.instance.collection("UpdateRequest").add(data);
            Fluttertoast.showToast(
                msg:
                    "Your Request Has been sent \n it will be updated within 4 working days");
            Get.to(ProfilePage());
          } else {
            Fluttertoast.showToast(msg: "all field reqiure ");
          }
        },
        child: const Text(
          "Submit",
          style: TextStyle(
              fontSize: 20,
              color: Color.fromARGB(255, 255, 255, 255),
              fontWeight: FontWeight.bold),
        ),
      ),
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.blue,
          ),
          onPressed: () {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const SylhetRegion()));
          },
        ),
      ),
      backgroundColor: Colors.white,
      body: Container(
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              color: Colors.white,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    child: Form(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(
                            height: 250,
                            child: Image.asset(
                              "img/sv.png",
                              fit: BoxFit.contain,
                            ),
                          ),
                          const SizedBox(
                            height: 45,
                          ),
                          // const Text(
                          //   "Add new volunteer",
                          //   style: TextStyle(
                          //       color: Colors.cyan,
                          //       fontSize: 20.0,
                          //       fontWeight: FontWeight.bold,
                          //       fontStyle: FontStyle.italic),
                          // ),
                          // const SizedBox(
                          //   height: 45,
                          // ),
                          OldFnameField,
                          const SizedBox(
                            height: 15,
                          ),
                          OldLnameField,
                          const SizedBox(
                            height: 15,
                          ),
                          NewFnameField,
                          const SizedBox(
                            height: 15,
                          ),
                          NewLnameField,
                          const SizedBox(
                            height: 15,
                          ),
                          EmailField,
                          const SizedBox(
                            height: 15,
                          ),
                          const SizedBox(height: 40),
                          SendBtn,
                          const SizedBox(
                            height: 100,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}





















































































































































// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';

// import '../user_distance/app/views/District-information/LocationAndVolunterrs/SylhetRegion.dart';

// class NewVolunteerFromPage extends StatefulWidget {
//   const NewVolunteerFromPage({Key? key}) : super(key: key);

//   @override
//   _NewVolunteerFromPageState createState() => _NewVolunteerFromPageState();
// }

// class _NewVolunteerFromPageState extends State<NewVolunteerFromPage> {
//   String? _name;
//   String? _id;
//   String? _phoneNo;

//   void _uploadData() {
//     FirebaseFirestore.instance
//         .collection('NewVolunteer')
//         .add({'name': _name, 'id': _id, 'phone': _phoneNo});
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Center(child: Text('Volunteer Form')),
//         leading: IconButton(
//           icon: const Icon(
//             Icons.arrow_back,
//             color: Color.fromARGB(255, 0, 0, 0),
//           ),
//           onPressed: () {
//             Navigator.of(context).pushReplacement(
//                 MaterialPageRoute(builder: (context) => SylhetRegion()));
//           },
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Container(
//           padding: const EdgeInsets.all(20.0),
//           child: Column(
//             // mainAxisAlignment: MainAxisAlignment.center,
//             // crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               SizedBox(
//                 height: 200,
//                 child: Image.asset(
//                   "img/sv.png",
//                   fit: BoxFit.contain,
//                 ),
//               ),
//               const Divider(
//                   // color: Colors.blue,
//                   ),
//               const Text(""),
//               TextFormField(
//                 decoration: const InputDecoration(hintText: 'Name'),
//                 onChanged: (value) {
//                   _name = value;
//                 },
//               ),
//               const SizedBox(
//                 height: 20.0,
//               ),
//               TextFormField(
//                 keyboardType: TextInputType.number,
//                 decoration: const InputDecoration(hintText: 'NID/Birth_ID'),
//                 onChanged: (value) {
//                   _id = value;
//                 },
//               ),
//               const SizedBox(
//                 height: 20.0,
//               ),
//               TextFormField(
//                 keyboardType: TextInputType.phone,
//                 decoration: const InputDecoration(hintText: 'Phone No'),
//                 onChanged: (value) {
//                   _phoneNo = value;
//                 },
//               ),
//               const SizedBox(
//                 height: 20.0,
//               ),
//               // Center(
//               //   child: _image == null
//               //       ? Text(
//               //           'No image selected.Note-upload your NID/Birth_certificate only')
//               //       : Image.file(_image!),
//               // ),
//               // SizedBox(
//               //   height: 20.0,
//               // ),
//               // ElevatedButton(
//               //   onPressed: _getImage,
//               //   child: Text('Pick Image'),
//               // ),
//               const SizedBox(
//                 height: 20.0,
//               ),
//               ElevatedButton(
//                 onPressed: _uploadData,
//                 child: const Text('Upload'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
