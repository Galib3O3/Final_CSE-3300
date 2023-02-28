import 'package:app/function/user_func.dart';
import 'package:app/profilepage/profile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RegScreen extends StatefulWidget {
  const RegScreen({super.key});

  @override
  State<RegScreen> createState() => _RegScreenState();
}

class _RegScreenState extends State<RegScreen> {
  final _auth = FirebaseAuth.instance;

  final _formkey = GlobalKey<FormState>();
  bool hidepass = true;

  //1st Name
  final FnameEditingController = TextEditingController();
  //2nd name
  final LnameEditingController = TextEditingController();
  //Email
  final EmailEditingController = TextEditingController();
  //pass
  final passEditingController = TextEditingController();
  //Cpass
  final CpassEditingController = TextEditingController();
  //category

  // final roleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //Fname
    final FnameField = TextFormField(
      autofocus: false,
      controller: FnameEditingController,
      keyboardType: TextInputType.emailAddress,
      validator: (Value) {
        RegExp rgx = new RegExp("[a-zA-Z .-]");
        if (Value!.isEmpty) {
          return ("First name can't be empty");
        }
        if (!rgx.hasMatch(Value)) {
          return ("Enter valid name ");
        }
        return null;
      },
      onSaved: (value) {
        FnameEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: const Icon(Icons.people),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "First Name",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )),
    );

    //Lname
    final LnameField = TextFormField(
      autofocus: false,
      controller: LnameEditingController,
      keyboardType: TextInputType.name,
      validator: (Value) {
        RegExp rgx = new RegExp(r"^[a-zA-Z .-]$");
        if (Value!.isEmpty) {
          return ("Last name required");
        }
        return null;
      },
      onSaved: (value) {
        LnameEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.people),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Last Name",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )),
    );

    //email
    final EmailnameField = TextFormField(
      autofocus: false,
      controller: EmailEditingController,
      keyboardType: TextInputType.emailAddress,
      validator: (Value) {
        RegExp rgx = new RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

        if (Value!.isEmpty) {
          return ("Email can't be empty");
        }
        if (!rgx.hasMatch(Value)) {
          return ("Enter valid Email ");
        }
        return null;
      },
      onSaved: (value) {
        EmailEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.mail),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Email",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )),
    );

    // password
    final PassnameField = TextFormField(
      autofocus: false,
      obscureText: !this.hidepass,
      controller: passEditingController,
      keyboardType: TextInputType.emailAddress,
      validator: (Value) {
        RegExp rgx = new RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$');
        if (Value!.isEmpty) {
          return ("Password is Required");
        }
        if (!rgx.hasMatch(Value)) {
          return ("contains at least one letter, at least one digit, \nand is at least 8 characters long. The password can contain only letters and digits.");
        }
        return null;
      },
      onSaved: (value) {
        passEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: const Icon(Icons.lock),
          suffixIcon: IconButton(
            icon: Icon(Icons.remove_red_eye,
                color: this.hidepass ? Colors.blue : Colors.grey),
            onPressed: () {
              setState(() {
                this.hidepass = !this.hidepass;
              });
            },
          ),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Password",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )),
    );
    //Confirm Password
    final CpassnameField = TextFormField(
      autofocus: false,
      obscureText: hidepass, //!this.
      controller: CpassEditingController,
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (CpassEditingController.text != passEditingController.text) {
          return "Password didn't match";
        }
        return null;
      },
      onSaved: (value) => CpassEditingController.text = value!,
      textInputAction: TextInputAction.next,
      onFieldSubmitted: (value) => signUp,
      decoration: InputDecoration(
          prefixIcon: const Icon(Icons.lock),
          suffixIcon: IconButton(
            icon: Icon(Icons.remove_red_eye,
                color: this.hidepass ? Colors.blue : Colors.grey),
            onPressed: () {
              setState(() {
                this.hidepass = !this.hidepass;
              });
            },
          ),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Confirm Password",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )),
    );

    //this is for role
    // final roleField = DropdownButtonFormField(
    //   dropdownColor: Colors.blueGrey[300],
    //   focusColor: Colors.blueGrey[800],
    //   autofocus: false,
    //   decoration: const InputDecoration(
    //     prefixIcon: Icon(Icons.person),
    //     contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
    //     hintText: 'Role',
    //     // labelText: 'Role',
    //     border: OutlineInputBorder(
    //       borderRadius: BorderRadius.all(
    //         Radius.circular(10.0),
    //       ),
    //     ),
    //   ),
    //   items: const [
    //     DropdownMenuItem(
    //       value: 'User',
    //       child: Text('User'),
    //     ),
    //     DropdownMenuItem(
    //       value: 'Volunteer',
    //       child: Text('Volunteer'),
    //     ),
    //     // DropdownMenuItem(
    //     //   value: '',
    //     //   child: Text('Staff'),
    //     // ),
    //   ],
    //   onChanged: (value) {
    //     roleController.text = value!.toString();
    //   },
    //   validator: (value) {
    //     if (value == null || value.toString().isEmpty) {
    //       return 'Please enter your role';
    //     }
    //     return null;
    //   },
    //   onSaved: (newValue) => roleController.text = newValue!.toString(),
    // );

    final SignupBtn = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(50),
      color: Color.fromARGB(255, 0, 0, 0),
      child: MaterialButton(
        padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () {
          signUp(EmailEditingController.text, passEditingController.text);
          const CircularProgressIndicator();
        },
        child: const Text(
          "SignUp",
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
                key: _formkey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 180,
                      child: Image.asset(
                        "img/sv.png",
                        fit: BoxFit.contain,
                      ),
                    ),
                    const SizedBox(
                      height: 45,
                    ),
                    FnameField,
                    const SizedBox(
                      height: 15,
                    ),
                    LnameField,
                    const SizedBox(
                      height: 15,
                    ),
                    EmailnameField,
                    const SizedBox(
                      height: 15,
                    ),
                    PassnameField,
                    const SizedBox(
                      height: 15,
                    ),
                    CpassnameField,
                    const SizedBox(
                      height: 55,
                    ),
                    // roleField,
                    // const SizedBox(
                    //   height: 15,
                    // ),
                    SignupBtn,
                    const SizedBox(
                      height: 10,
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

  Future<void> signUp(String email, String password) async {
    if (_formkey.currentState!.validate()) {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => {postDetailsToFirestore()})
          .catchError((er) {
        Fluttertoast.showToast(msg: er!.message);
      });
    }
  }

  postDetailsToFirestore() async {
    //call firestore/userfunc/sending the values

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

    User? Users = _auth.currentUser;

    UserFunc userFunc = UserFunc();

    //write all the value
    userFunc.email = Users!.email;
    userFunc.uid = Users.uid; //get UID
    userFunc.password = passEditingController.text;
    userFunc.firstName = FnameEditingController.text;
    userFunc.lastName = LnameEditingController.text;
    // userFunc.role = roleController.text;

    await firebaseFirestore
        .collection("users")
        .doc(Users.email)
        .set(userFunc.toMap());
    Fluttertoast.showToast(
        msg: "Registration Successfully completed",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.orange,
        textColor: Colors.black,
        fontSize: 16.0);

    Navigator.pushAndRemoveUntil(
        (context),
        MaterialPageRoute(builder: (context) => ProfilePage()),
        (route) => false);
  }
}
