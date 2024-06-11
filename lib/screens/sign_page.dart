import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lawrental/constants.dart';
import 'package:lawrental/screens/signup_lawyer.dart';
import 'package:lawrental/screens/signup_user.dart';
import 'package:lawrental/widgets/custom_button.dart';
import 'package:lawrental/widgets/custom_text_field.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});
  static String id = 'SignUpPage';

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController first_name = TextEditingController();
  TextEditingController last_name = TextEditingController();
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  bool isLoading = false;
  File? _selectedImage;
  String? imageUrl;

  CollectionReference lawyerInfo =
      FirebaseFirestore.instance.collection('Lawyer Info');
  CollectionReference usetInfo =
      FirebaseFirestore.instance.collection('User Info');

  Future _pickImaheFromGallery() async {
    final returnedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnedImage == null) return;
    setState(() {
      _selectedImage = File(returnedImage.path);
    });
  }

  Future<void> uploadLawyerImageToFirebase(String imagePath) async {
    try {
      String fileName = DateTime.now().millisecondsSinceEpoch.toString();
      firebase_storage.Reference ref =
          firebase_storage.FirebaseStorage.instance.ref().child(fileName);
      await ref.putFile(File(imagePath));

      // Image uploaded successfully
      imageUrl = await ref.getDownloadURL();
      print('Image URL: $imageUrl');

      // Store the image URL in Firestore
      // await lawyerInfo
      //     .add({
      //       'imageUrl': imageUrl,
      //       'First Name': first_name.text,
      //       'Last Name': last_name.text,
      //     })
      //     .then((value) => print("User Added"))
      //     .catchError((error) => print("Failed to add user: $error"));
      // print('Image URL stored in Firestore');
    } catch (e) {
      // Error uploading image or storing URL
      print('Error: $e');
    }
  }

  Future<void> uploadUserImageToFirebase(String imagePath) async {
    try {
      String fileName = DateTime.now().millisecondsSinceEpoch.toString();
      firebase_storage.Reference ref =
          firebase_storage.FirebaseStorage.instance.ref().child(fileName);
      await ref.putFile(File(imagePath));

      // Image uploaded successfully
      imageUrl = await ref.getDownloadURL();
      print('Image URL: $imageUrl');

      // Store the image URL in Firestore
      // await usetInfo
      //     .add({
      //       'imageUrl': imageUrl,
      //       'First Name': first_name.text,
      //       'Last Name': last_name.text,
      //     })
      //     .then((value) => print("User Added"))
      //     .catchError((error) => print("Failed to add user: $error"));
      // print('Image URL stored in Firestore');
    } catch (e) {
      // Error uploading image or storing URL
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: (isLoading)
          ? Center(child: CircularProgressIndicator())
          : Column(
              children: [
                Container(
                  height: 30.h,
                  width: double.infinity,
                  color: KPrimaryColor,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Welcome to',
                          style: TextStyle(
                            fontFamily: "Unigeo64",
                            fontSize: 20.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '         Lawrental.',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: "MADEOkine",
                            fontSize: 29.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Form(
                    key: formState,
                    child: ListView(
                      children: [
                        Center(
                          child: (_selectedImage == null)
                              ? Stack(
                                  children: [
                                    CircleAvatar(
                                      backgroundColor: KPrimaryTextFieldColor,
                                      maxRadius: 80,
                                      minRadius: 50,
                                      child: IconButton(
                                        onPressed: () {
                                          setState(() {
                                            _pickImaheFromGallery();
                                          });
                                        },
                                        icon: Icon(
                                          Icons.person_rounded,
                                          size: 50.sp,
                                          color: Color(0xFF565E74),
                                        ),
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        setState(() {
                                          _pickImaheFromGallery();
                                        });
                                      },
                                      icon: Icon(
                                        Icons.add_circle_sharp,
                                        color: KPrimaryColor,
                                        size: 23.sp,
                                      ),
                                    )
                                  ],
                                )
                              : Stack(
                                  children: [
                                    Container(
                                      clipBehavior: Clip.antiAlias,
                                      decoration: BoxDecoration(
                                        color: KPrimaryTextFieldColor,
                                        borderRadius:
                                            BorderRadius.circular(100),
                                      ),
                                      height: 20.h,
                                      width: 45.w,
                                      child: Image.file(
                                        _selectedImage!,
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        setState(() {
                                          _selectedImage = null;
                                        });
                                      },
                                      icon: Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                        size: 23.sp,
                                      ),
                                    ),
                                  ],
                                ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                width: 42.w,
                                height: 12.h,
                                child: customTextFormField(
                                  validator: (p0) {
                                    if (p0 == '') return 'shouldn\'t empty';
                                  },
                                  controller: first_name,
                                  text: 'first name',
                                  textSize: 17.sp,
                                ),
                              ),
                              Container(
                                width: 42.w,
                                height: 12.h,
                                child: customTextFormField(
                                  validator: (p0) {
                                    if (p0 == '') return 'shouldn\'t empty';
                                  },
                                  controller: last_name,
                                  text: 'last name',
                                  textSize: 17.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 20),
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Sign up as :',
                            style: TextStyle(
                                fontFamily: "medium",
                                fontSize: 24.sp,
                                fontWeight: FontWeight.bold,
                                color: KPrimaryColor),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 10, bottom: 10, left: 40, right: 40),
                          child: CustomButton(
                            text: 'LAWYER',
                            textColor: KPrimaryColor,
                            color: Colors.white,
                            height: 7.h,
                            width: 85.w,
                            onTap: () async {
                              if (formState.currentState!.validate()) {
                                try {
                                  isLoading = true;
                                  setState(() {});
                                  await uploadLawyerImageToFirebase(
                                      _selectedImage!.path);

                                  Navigator.pushNamed(context, SignUpLawyer.id,
                                      arguments: [
                                        first_name.text,
                                        last_name.text,
                                        imageUrl
                                      ]);
                                  isLoading = false;
                                  setState(() {});
                                } catch (e) {
                                  isLoading = false;
                                  setState(() {});
                                  print('============$e');
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content: Text(
                                              'You should select a photo')));
                                }
                              }
                            },
                          ),
                        ),
                        Center(
                          child: Text(
                            'OR',
                            style: TextStyle(
                                fontFamily: "Unigeo64",
                                fontSize: 20.sp,
                                fontWeight: FontWeight.bold,
                                color: KPrimaryColor),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 10, bottom: 10, left: 40, right: 40),
                          child: CustomButton(
                            text: 'USER',
                            textColor: KPrimaryColor,
                            color: Colors.white,
                            height: 7.h,
                            width: 85.w,
                            onTap: () async {
                              if (formState.currentState!.validate()) {
                                try {
                                  isLoading = true;
                                  setState(() {});
                                  await uploadUserImageToFirebase(
                                      _selectedImage!.path);

                                  Navigator.pushNamed(context, SignUpUser.id,
                                      arguments: [
                                        first_name.text,
                                        last_name.text,
                                        imageUrl
                                      ]);
                                  isLoading = false;
                                  setState(() {});
                                } catch (e) {
                                  isLoading = false;
                                  setState(() {});
                                  print('============$e');
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content: Text(
                                              'You should select a photo')));
                                }
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
