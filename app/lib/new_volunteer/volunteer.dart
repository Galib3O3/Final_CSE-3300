import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class newvolunteer extends StatefulWidget {
  const newvolunteer({Key? key}) : super(key: key);

  @override
  _newvolunteerState createState() => _newvolunteerState();
}

class _newvolunteerState extends State<newvolunteer> {
  String? _name;
  String? _id;
  String? _group;
  File? _image;

  void _uploadData() {
    if (_image == null) {
      return;
    }
    FirebaseFirestore.instance
        .collection('data')
        .add({'name': _name, 'id': _id, 'group': _group, 'image': 'imageUrl'});
  }

  Future<void> _getImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      _image = File(pickedFile!.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('New Volunteer')),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(hintText: 'Name'),
                onChanged: (value) {
                  _name = value;
                },
              ),
              SizedBox(
                height: 20.0,
              ),
              TextFormField(
                decoration: InputDecoration(hintText: 'NID/Birth_ID'),
                onChanged: (value) {
                  _id = value;
                },
              ),
              SizedBox(
                height: 20.0,
              ),
              TextFormField(
                decoration: InputDecoration(hintText: 'working Group'),
                onChanged: (value) {
                  _group = value;
                },
              ),
              SizedBox(
                height: 20.0,
              ),
              Center(
                child: _image == null
                    ? Text(
                        'No image selected.Note-upload your NID/Birth_certificate only')
                    : Image.file(_image!),
              ),
              SizedBox(
                height: 20.0,
              ),
              ElevatedButton(
                onPressed: _getImage,
                child: Text('Pick Image'),
              ),
              SizedBox(
                height: 20.0,
              ),
              ElevatedButton(
                onPressed: _uploadData,
                child: Text('Upload'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
