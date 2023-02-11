// // ignore_for_file: unused_local_variable

// import 'package:app/Dontaion/donation.dart';
// import 'package:app/app/profile-pages/six_profile_page.dart';
// import 'package:app/function/user_func.dart';
// import 'package:app/pages/home.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:get/get.dart';
// import '../function/donation_model.dart';

// class donation1 extends StatefulWidget {
//   const donation1({super.key});

//   @override
//   State<donation1> createState() => _donation1State();
// }

// class _donation1State extends State<donation1> {
//   final _auth = FirebaseAuth.instance;

//   final _formkey = GlobalKey<FormState>();
//   bool hidepass = true;

//   //1st Name
//   final nameEditingController = TextEditingController();
//   //Email
//   final EmailEditingController = TextEditingController();
//   //pass
//   final passEditingController = TextEditingController();
//   //2nd name
//   final numberEditingController = TextEditingController();
//   //Cpass
//   final T_idEditingController = TextEditingController();
//   //amount
//   final amountEditingController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     //Fname
//     final nameField = TextFormField(
//       autofocus: false,
//       controller: nameEditingController,
//       keyboardType: TextInputType.emailAddress,
//       validator: (Value) {
//         RegExp rgx = new RegExp(r'^.{4,}$');
//         if (Value!.isEmpty) {
//           return ("Name can't be empty");
//         }
//         if (!rgx.hasMatch(Value)) {
//           return ("Enter valid name ");
//         }
//         return null;
//       },
//       onSaved: (value) {
//         nameEditingController.text = value!;
//       },
//       textInputAction: TextInputAction.next,
//       decoration: InputDecoration(
//           prefixIcon: Icon(Icons.people),
//           contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
//           hintText: "Name",
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(10),
//           )),
//     );
//     //email
//     final EmailnameField = TextFormField(
//       autofocus: false,
//       controller: EmailEditingController,
//       keyboardType: TextInputType.emailAddress,
//       validator: (value) {
//         if (value!.isEmpty) {
//           return ("Email Required");
//           //regex for mail varification
//         }
//         //regex for email varifivation
//         if (!RegExp("^[a-z0-9]+@(gmail|yahoo|lus.ac.bd|hotmail|).[a-z]{2,3}")
//             .hasMatch(value)) {
//           return ("Oops! Enter the valid mail");
//         }
//         return null;
//       },
//       onSaved: (value) {
//         EmailEditingController.text = value!;
//       },
//       textInputAction: TextInputAction.next,
//       decoration: InputDecoration(
//           prefixIcon: Icon(Icons.mail),
//           contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
//           hintText: "Email",
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(10),
//           )),
//     );

//     //Lname
//     final numberField = TextFormField(
//       autofocus: false,
//       controller: numberEditingController,
//       keyboardType: TextInputType.emailAddress,
//       validator: (Value) {
//         if (Value!.isEmpty) {
//           return ("number required");
//         }
//         return null;
//       },
//       onSaved: (value) {
//         numberEditingController.text = value!;
//       },
//       textInputAction: TextInputAction.next,
//       decoration: InputDecoration(
//           prefixIcon: Icon(Icons.phone_android),
//           contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
//           hintText: "Number",
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(10),
//           )),
//     );

//     // password
//     final PassnameField = TextFormField(
//       autofocus: false,
//       obscureText: !this.hidepass,
//       controller: passEditingController,
//       keyboardType: TextInputType.emailAddress,
//       validator: (Value) {
//         RegExp rgx = new RegExp(r'^.{10,}$');
//         if (Value!.isEmpty) {
//           return ("Password is Required");
//         }
//         if (!rgx.hasMatch(Value)) {
//           return ("Use valid password \n password contains latters and characters(upto10)");
//         }
//         return null;
//       },
//       onSaved: (value) {
//         passEditingController.text = value!;
//       },
//       textInputAction: TextInputAction.next,
//       decoration: InputDecoration(
//           prefixIcon: const Icon(Icons.dialpad),
//           suffixIcon: IconButton(
//             icon: Icon(Icons.remove_red_eye,
//                 color: this.hidepass ? Colors.blue : Colors.grey),
//             onPressed: () {
//               setState(() {
//                 this.hidepass = !this.hidepass;
//               });
//             },
//           ),
//           contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
//           hintText: "Password",
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(10),
//           )),
//     );
//     final T_idField = TextFormField(
//       autofocus: false,
//       controller: T_idEditingController,
//       keyboardType: TextInputType.emailAddress,
//       validator: (Value) {
//         if (Value!.isEmpty) {
//           return ("Transiction ID required");
//         }
//         return null;
//       },
//       onSaved: (value) {
//         T_idEditingController.text = value!;
//       },
//       textInputAction: TextInputAction.next,
//       decoration: InputDecoration(
//           prefixIcon: Icon(Icons.payment_sharp),
//           contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
//           hintText: "Transiction ID",
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(10),
//           )),
//     );
//     final amountField = TextFormField(
//       autofocus: false,
//       controller: amountEditingController,
//       keyboardType: TextInputType.emailAddress,
//       validator: (Value) {
//         if (Value!.isEmpty) {
//           return ("amount required");
//         }
//         return null;
//       },
//       onSaved: (value) {
//         amountEditingController.text = value!;
//       },
//       textInputAction: TextInputAction.next,
//       decoration: InputDecoration(
//           prefixIcon: Icon(Icons.money),
//           contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
//           hintText: "amount",
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(10),
//           )),
//     );

//     final SignupBtn = Material(
//       elevation: 5,
//       borderRadius: BorderRadius.circular(30),
//       color: const Color.fromARGB(255, 14, 99, 237),
//       child: MaterialButton(
//         padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
//         minWidth: MediaQuery.of(context).size.width,
//         onPressed: () {
//           signUp(EmailEditingController.text, passEditingController.text);
//           const CircularProgressIndicator();
//         },
//         child: const Text(
//           "SignUp",
//           style: TextStyle(
//               fontSize: 20,
//               color: Color.fromARGB(255, 255, 255, 255),
//               fontWeight: FontWeight.bold),
//         ),
//       ),
//     );

//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         leading: IconButton(
//           icon: const Icon(
//             Icons.arrow_back,
//             color: Colors.blue,
//           ),
//           onPressed: () {
//             //go to login section
//             Navigator.of(context).pop();
//           },
//         ),
//       ),
//       backgroundColor: Colors.white,
//       body: Center(
//         child: SingleChildScrollView(
//           child: Container(
//             color: Colors.white,
//             child: Padding(
//               padding: const EdgeInsets.all(36.0),
//               child: Form(
//                 key: _formkey,
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: <Widget>[
//                     SizedBox(
//                       height: 180,
//                       child: Image.asset(
//                         "img/sv.png",
//                         fit: BoxFit.contain,
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 45,
//                     ),
//                     nameField,
//                     const SizedBox(
//                       height: 15,
//                     ),
//                     EmailnameField,
//                     const SizedBox(
//                       height: 15,
//                     ),
//                     numberField,
//                     const SizedBox(
//                       height: 15,
//                     ),
//                     PassnameField,
//                     const SizedBox(
//                       height: 15,
//                     ),
//                     amountField,
//                     const SizedBox(
//                       height: 15,
//                     ),
//                     T_idField,
//                     const SizedBox(
//                       height: 15,
//                     ),
//                     SignupBtn,
//                     const SizedBox(
//                       height: 100,
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Future<void> signUp(String email, String password) async {
//     if (_formkey.currentState!.validate()) {
//       await _auth
//           .createUserWithEmailAndPassword(email: email, password: password)
//           .then((value) => {postDetailsToFirestore()})
//           .catchError((er) {
//         Fluttertoast.showToast(msg: er!.message);
//       });
//     }
//   }

//   postDetailsToFirestore() async {
//     //call firestore/userfunc/sending the values

//     FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

//     User? Users = _auth.currentUser;

//     DonationFunc userFunc = DonationFunc();

//     //write all the value
//     userFunc.email = Users!.email;
//     // userFunc.uid = Users.uid; //get UID
//     userFunc.password = passEditingController.text;
//     userFunc.name = nameEditingController.text;
//     userFunc.number = numberEditingController.text;
//     userFunc.transiction_id = T_idEditingController.text;
//     userFunc.amount = amountEditingController.text;
//     await firebaseFirestore
//         .collection("Donation")
//         .doc(Users.email)
//         .set(userFunc.toMap());
//     Fluttertoast.showToast(msg: "Thank you for funding");

//     Navigator.pushAndRemoveUntil(
//         (context),
//         MaterialPageRoute(builder: (context) => SixProfileView()),
//         (route) => false);
//   }
// }
