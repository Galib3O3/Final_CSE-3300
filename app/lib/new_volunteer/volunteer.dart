import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../LocationAndVolunterrs/SylhetRegion.dart';

class NewVolunteerFromPage extends StatefulWidget {
  const NewVolunteerFromPage({Key? key}) : super(key: key);

  @override
  _NewVolunteerFromPageState createState() => _NewVolunteerFromPageState();
}

class _NewVolunteerFromPageState extends State<NewVolunteerFromPage> {
  String? _name;
  String? _id;
  String? _phoneNo;

  void _uploadData() {
    FirebaseFirestore.instance
        .collection('NewVolunteer')
        .add({'name': _name, 'id': _id, 'phone': _phoneNo});
  }

  Future<void> _getImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Volunteer Form')),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Color.fromARGB(255, 0, 0, 0),
          ),
          onPressed: () {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => SylhetRegion()));
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 200,
                child: Image.asset(
                  "img/sv.png",
                  fit: BoxFit.contain,
                ),
              ),
              const Divider(
                  // color: Colors.blue,
                  ),
              const Text(""),
              TextFormField(
                decoration: const InputDecoration(hintText: 'Name'),
                onChanged: (value) {
                  _name = value;
                },
              ),
              const SizedBox(
                height: 20.0,
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(hintText: 'NID/Birth_ID'),
                onChanged: (value) {
                  _id = value;
                },
              ),
              const SizedBox(
                height: 20.0,
              ),
              TextFormField(
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(hintText: 'Phone No'),
                onChanged: (value) {
                  _phoneNo = value;
                },
              ),
              const SizedBox(
                height: 20.0,
              ),
              // Center(
              //   child: _image == null
              //       ? Text(
              //           'No image selected.Note-upload your NID/Birth_certificate only')
              //       : Image.file(_image!),
              // ),
              // SizedBox(
              //   height: 20.0,
              // ),
              // ElevatedButton(
              //   onPressed: _getImage,
              //   child: Text('Pick Image'),
              // ),
              const SizedBox(
                height: 20.0,
              ),
              ElevatedButton(
                onPressed: _uploadData,
                child: const Text('Upload'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
