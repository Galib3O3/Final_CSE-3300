// import 'package:app/function/user_func.dart';
// import 'package:app/pages/home.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';

// import '../app/profile-pages/weather-main-page.dart';
// import 'donationForm.dart';

// class DonationForm extends StatefulWidget {
//   @override
//   _DonationFormState createState() => _DonationFormState();
// }

// class _DonationFormState extends State<DonationForm> {
//   final _formKey = GlobalKey<FormState>();
//   final nameController = TextEditingController();
//   final amountController = TextEditingController();
//   final idController = TextEditingController();
//   final numberController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Form(
//       key: _formKey,
//       child: Column(
//         children: <Widget>[
//           TextFormField(
//             controller: nameController,
//             validator: (value) {
//               if (value!.isEmpty) {
//                 return 'Please enter name';
//               }
//               return null;
//             },
//             decoration: InputDecoration(labelText: 'Name'),
//           ),
//           TextFormField(
//             controller: amountController,
//             validator: (value) {
//               if (value!.isEmpty) {
//                 return 'Please enter amount';
//               }
//               return null;
//             },
//             decoration: InputDecoration(labelText: 'Amount'),
//           ),
//           TextFormField(
//             controller: idController,
//             validator: (value) {
//               if (value!.isEmpty) {
//                 return 'Please enter id';
//               }
//               return null;
//             },
//             decoration: InputDecoration(labelText: 'ID'),
//           ),
//           TextFormField(
//             controller: numberController,
//             validator: (value) {
//               if (value!.isEmpty) {
//                 return 'Please enter number';
//               }
//               return null;
//             },
//             decoration: InputDecoration(labelText: 'Number'),
//           ),
//           ElevatedButton(
//             onPressed: () {
//               if (_formKey.currentState!.validate()) {
//                 final donation = Donation(
//                   name: nameController.text,
//                   amount: amountController.text,
//                   id: idController.text,
//                   number: numberController.text,
//                 );

//                 FirebaseFirestore.instance
//                     .collection("donation")
//                     .add(data as Map<String, dynamic>);
//               }
              
//             },
//             child: Text('Submit'),
//           ),
//         ],
//       ),
//     );
//   }
// }
