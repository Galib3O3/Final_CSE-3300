import 'package:app/app/profile-pages/six_profile_page.dart';
import 'package:app/function/user_func.dart';
import 'package:app/pages/home.dart';
import 'package:app/user_distance/app/views/District-information/LocationAndVolunterrs/SylhetRegion.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class NewVolunteerFromPage extends StatefulWidget {
  const NewVolunteerFromPage({super.key});

  @override
  State<NewVolunteerFromPage> createState() => _NewVolunteerFromPageState();
}

class _NewVolunteerFromPageState extends State<NewVolunteerFromPage> {
  final nameEditingController = TextEditingController();

  final numberEditingController = TextEditingController();

  final IDEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final nameField = TextFormField(
      // autofocus: false,
      controller: nameEditingController,
      keyboardType: TextInputType.name,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.people),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Name",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )),
    );
    //Lname
    final numberField = TextFormField(
      autofocus: false,
      controller: numberEditingController,
      keyboardType: TextInputType.number,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.phone),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "number",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )),
    );
    final amountField = TextFormField(
      autofocus: false,
      controller: IDEditingController,
      keyboardType: TextInputType.number,
      onSaved: (value) {
        numberEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.numbers),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "NID/BID",
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
            'Name': nameEditingController.text,
            "Number": numberEditingController.text,
            "NID/B_ID": IDEditingController.text,
          };

          if (nameEditingController.text != "" &&
              IDEditingController.text != "" &&
              numberEditingController.text != "") {
            FirebaseFirestore.instance.collection("NewVolunteer").add(data);
            Fluttertoast.showToast(
                msg: "New volunteer Added\n soon our team will contact you");
            Get.to(SylhetRegion());
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
                          nameField,
                          const SizedBox(
                            height: 15,
                          ),
                          numberField,
                          const SizedBox(
                            height: 15,
                          ),
                          amountField,
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
