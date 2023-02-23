import 'package:app/app/profile-pages/six_profile_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class donation extends StatefulWidget {
  const donation({super.key});

  @override
  State<donation> createState() => _donationState();
}

class _donationState extends State<donation> {
  final nameEditingController = TextEditingController();
  //2nd name
  final numberEditingController = TextEditingController();
  //Email
  final amountEditingController = TextEditingController();

  final transication_ID_EditingController = TextEditingController();

  final moneytransfer_EditingController = TextEditingController();

  // Future send() async {
  //   final db = FirebaseFirestore.instance.collection("Donation_data").add({
  //     'name': nameEditingController,
  //     'number': numberEditingController,
  //     'amout': amountEditingController,
  //     'transiction_id': transication_ID_EditingController
  //   });
  // }

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
      controller: amountEditingController,
      keyboardType: TextInputType.number,
      onSaved: (value) {
        numberEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.money),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "amount",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )),
    );
    final transictionField = TextFormField(
      autofocus: false,
      controller: transication_ID_EditingController,
      keyboardType: TextInputType.name,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.payment),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Transiction ID",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )),
    );
    final moneyfiled = DropdownButtonFormField(
      dropdownColor: Colors.blueGrey[300],
      focusColor: Colors.blueGrey[800],
      autofocus: false,
      decoration: const InputDecoration(
        prefixIcon: Icon(Icons.note),
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        hintText: 'moneytrasfer',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
      ),
      items: const [
        DropdownMenuItem(
          value: 'Bkash',
          child: Text('Bkash'),
        ),
        DropdownMenuItem(
          value: 'Rocket',
          child: Text('Rocket'),
        ),
      ],
      onChanged: (value) {
        moneytransfer_EditingController.text = value!.toString();
      },
      
      onSaved: (newValue) =>
          moneytransfer_EditingController.text = newValue!.toString(),
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
            'name': nameEditingController.text,
            "number": numberEditingController.text,
            "amount": amountEditingController.text,
            "transicaiton_id": transication_ID_EditingController.text,
            "moneytransfertype": moneytransfer_EditingController.text,
          };

          if (nameEditingController.text != "" &&
              amountEditingController.text != "" &&
              numberEditingController.text != "" &&
              transication_ID_EditingController.text != "" &&
              moneytransfer_EditingController.text != "") {
            FirebaseFirestore.instance.collection("donation").add(data);
            Fluttertoast.showToast(
                msg: "Donatio information Submitted\n we will ensure you");
            Get.to(SixProfileView());
          } else {
            Fluttertoast.showToast(msg: "all field reqiure ");
          }
        },
        child: const Text(
          "send",
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
            Navigator.of(context).pop();
          },
        ),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: Form(
                //key: _formkey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 160,
                      child: Image.asset(
                        "img/fund.png",
                        fit: BoxFit.contain,
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
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
                    transictionField,
                    const SizedBox(
                      height: 15,
                    ),
                    moneyfiled,
                    const SizedBox(
                      height: 15,
                    ),
                    SendBtn,
                    const SizedBox(
                      height: 100,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
