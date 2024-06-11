import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lawrental/constants.dart';
import 'package:lawrental/screens/home_page.dart';
import 'package:lawrental/widgets/custom_button.dart';
import 'package:lawrental/widgets/custom_text_field.dart';
import 'package:lawrental/widgets/textfield_email.dart';
import 'package:lawrental/widgets/textfield_password.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SignUpUser extends StatefulWidget {
  SignUpUser({this.f, this.s, this.image});
  static String id = 'SignUpUser';
  String? f, s, image;

  @override
  State<SignUpUser> createState() => _SignUpUserState();
}

class _SignUpUserState extends State<SignUpUser> {
  TextEditingController? email = TextEditingController();
  TextEditingController? password = TextEditingController();
  TextEditingController? phone = TextEditingController();
  TextEditingController? gender = TextEditingController();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  bool isLoading = false;
  CollectionReference userInfo =
      FirebaseFirestore.instance.collection('user Info');

  @override
  Widget build(BuildContext context) {
    List<String?> list =
        ModalRoute.of(context)!.settings.arguments as List<String?>;
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 30.h,
                width: double.infinity,
                color: KPrimaryColor,
              ),
              Positioned(
                bottom: 50,
                left: -30,
                child: ClipRect(
                  child: Opacity(
                    opacity: 0.3,
                    child: Image(
                      image: AssetImage('assets/image/lawIcon.png'),
                      height: 20.h,
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 10,
                right: 30,
                child: Text(
                  '          Lawrental.',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: "MADEOkine",
                    fontSize: 29.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Form(
                key: formkey,
                child: ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: customTextFormField(
                          validator: (p0) {
                            if (p0 == '') return 'shoudn\'t empty';
                          },
                          controller: email,
                          text: 'email address'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: customTextFormField(
                        validator: (p0) {
                          if (p0 == '') return 'shoudn\'t empty';
                        },
                        controller: password,
                        text: 'password',
                        obscureText: true,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: customTextFormField(
                          validator: (p0) {
                            if (p0 == '') return 'shoudn\'t empty';
                          },
                          controller: phone,
                          text: 'phone number'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: customTextFormField(
                          validator: (p0) {
                            if (p0 == '') return 'shoudn\'t empty';
                          },
                          controller: gender,
                          text: 'gender'),
                    ),
                    CustomButton(
                      text: 'Sign up',
                      textColor: Color(0xFF14213D),
                      color: Colors.white,
                      height: 8.h,
                      width: 1.w,
                      onTap: () async {
                        if (formkey.currentState!.validate()) {
                          try {
                            isLoading = true;
                            setState(() {});
                            final credential = await FirebaseAuth.instance
                                .createUserWithEmailAndPassword(
                              email: email!.text,
                              password: password!.text,
                            );
                            userInfo.add({
                              'image Profile Url': list[2],
                              'first name': list[0],
                              'last name': list[1],
                              'email': email!.text,
                              'password': password!.text,
                              'phone': phone!.text,
                              'gender': gender!.text,
                              'id':FirebaseAuth.instance.currentUser!.uid,
                            });
                            isLoading = false;
                            setState(() {});
                            Navigator.pushNamed(context, HomePage.id);
                          } on FirebaseAuthException catch (e) {
                            isLoading = false;
                            setState(() {});
                            if (e.code == 'weak-password') {
                              print('The password provided is too weak.');
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                  content: Text(
                                      'The password provided is too weak.')));
                            } else if (e.code == 'email-already-in-use') {
                              print(
                                  'The account already exists for that email.');
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                  content: Text(
                                      'The account already exists for that email.')));
                            } else {
                              print('${e.toString()}');
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text('Error')));
                            }
                          } catch (e) {
                            isLoading = false;
                            setState(() {});
                            print(e);
                          }
                        }
                      },
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
