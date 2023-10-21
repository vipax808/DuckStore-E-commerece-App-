import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:duckstore/widgets/Auth_widget.dart';
import 'package:duckstore/widgets/ShowSnackBar.dart';
import 'package:duckstore/widgets/categ_List.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final TextEditingController _namecontroller = TextEditingController();
final TextEditingController _emailcontroller = TextEditingController();
final TextEditingController _passwordcontroller = TextEditingController();

class AuthSignUp extends StatefulWidget {
  const AuthSignUp({
    super.key,
  });

  @override
  State<AuthSignUp> createState() => _AuthSignUpState();
}

class _AuthSignUpState extends State<AuthSignUp> {
  late String name;
  late String email;
  late String _uid;
  late String password;
  late String profileImage;
  bool processing = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldMessengerState> _scaffoldKey =
      GlobalKey<ScaffoldMessengerState>();
  bool passwordVisible = false;

  XFile? _imageFile;
  dynamic _pickImageError;

  CollectionReference customers =
      FirebaseFirestore.instance.collection('customers');

  final ImagePicker _picker = ImagePicker();

  void _pickImageFromCamera() async {
    try {
      final pickedImage = await _picker.pickImage(
        source: ImageSource.camera,
        maxHeight: 300,
        maxWidth: 300,
        imageQuality: 95,
      );
      setState(() {
        _imageFile = pickedImage;
      });
    } catch (e) {
      setState(() {
        _pickImageError = e;
      });
      print(_pickImageError);
    }
  }

  void _pickImageFromGallery() async {
    try {
      final pickedImage = await _picker.pickImage(
        source: ImageSource.gallery,
        maxHeight: 300,
        maxWidth: 300,
        imageQuality: 95,
      );
      setState(() {
        _imageFile = pickedImage;
      });
    } catch (e) {
      setState(() {
        _pickImageError = e;
      });
      print(_pickImageError);
    }
  }

  void SignUp() async {
    setState(() {
      processing = true;
    });
    if (_formKey.currentState!.validate()) {
      if (_imageFile != null) {
        try {
          await FirebaseAuth.instance
              .createUserWithEmailAndPassword(email: email, password: password);

          firebase_storage.Reference ref = firebase_storage
              .FirebaseStorage.instance
              .ref('cust-images/$email.jpg');

          await ref.putFile(File(_imageFile!.path));

          profileImage = await ref.getDownloadURL();
          _uid = FirebaseAuth.instance.currentUser!.uid;
          await customers.doc(_uid).set({
            'name': name,
            'email': email,
            'profileimage': profileImage,
            'phone': '',
            'address': '',
            'cid': _uid
          });
          _formKey.currentState!.reset();
          setState(() {
            _imageFile = null;
          });
          Navigator.pushReplacementNamed(context, 'CustomerHomeScreen');
        } on FirebaseAuthException catch (e) {
          if (e.code == 'weak-password') {
            setState(() {
              processing = false;
            });
            MyMessageHandler.showSnackBar(
                _scaffoldKey, 'The password provided is too weak');
          } else if (e.code == 'email-already-in-use') {
            setState(() {
              processing = false;
            });
            MyMessageHandler.showSnackBar(
                _scaffoldKey, 'The account already exists for that email');
          }
        }
      } else {
        setState(() {
          processing = false;
        });
        MyMessageHandler.showSnackBar(_scaffoldKey, 'please pick image first');
      }
      print('valid');
    } else {
      setState(() {
        processing = false;
      });
      MyMessageHandler.showSnackBar(_scaffoldKey, 'please fill all fields ');
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger(
      key: _scaffoldKey,
      child: Scaffold(
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              reverse: true,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      SignUpHeader(
                        headerLabel: 'Sign Up',
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 20, horizontal: 40),
                            child: CircleAvatar(
                              radius: 60,
                              backgroundImage: _imageFile == null
                                  ? null
                                  : FileImage(File(_imageFile!.path)),
                              backgroundColor: Colors.purpleAccent,
                            ),
                          ),
                          Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.purple,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(15),
                                      topRight: Radius.circular(15),
                                    )),
                                child: IconButton(
                                  icon: Icon(
                                    Icons.camera_alt,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {
                                    _pickImageFromCamera();
                                  },
                                ),
                              ),
                              SizedBox(
                                height: 6,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.purple,
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(15),
                                      bottomRight: Radius.circular(15),
                                    )),
                                child: IconButton(
                                  icon: Icon(
                                    Icons.photo,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {
                                    _pickImageFromGallery();
                                  },
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'please enter your full name';
                              }
                              return null;
                            },
                            onChanged: (value) {
                              name = value;
                            },
                            decoration: textFormDecoration.copyWith(
                                labelText: 'Full Name',
                                hintText: 'Enter your Full Name')),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'please enter your Email Address';
                              } else if (value.isValidEmail() == false) {
                                return 'invalid email';
                              } else if (value.isValidEmail() == true) {
                                MyMessageHandler.showSnackBar(
                                  _scaffoldKey,
                                  'your email is valid',
                                );
                              }
                              return null;
                            },
                            onChanged: (value) {
                              email = value;
                            },
                            // controller: _emailcontroller,
                            decoration: textFormDecoration.copyWith(
                              labelText: 'Email Address',
                              hintText: 'Enter your email',
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'please enter your Password';
                              }
                              return null;
                            },
                            obscureText: passwordVisible,
                            onChanged: (value) {
                              password = value;
                            },
                            // controller: _passwordcontroller,
                            keyboardType: TextInputType.emailAddress,
                            decoration: textFormDecoration.copyWith(
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      passwordVisible = !passwordVisible;
                                    });
                                  },
                                  icon: Icon(
                                    passwordVisible
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: Colors.purple,
                                  )),
                              labelText: 'Password',
                              hintText: 'Enter your password',
                            )),
                      ),
                      HaveAccount(
                        haveAccount: 'Already have account?',
                        actionLabel: 'Log In',
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, 'AuthLogin');
                        },
                      ),
                      processing == true
                          ? CircularProgressIndicator()
                          : AuthMainButton(
                              mainButtonLabel: 'Sign Up',
                              onPressed: () {
                                SignUp();
                              },
                            )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(
            r'^([a-zA-Z0-9]+)([\-\_\.]*)([a-zA-Z0-9]*)([@])([a-zA-Z0-9]{2,})([\.][a-zA-Z]{2,3})$')
        .hasMatch(this);
  }
}
