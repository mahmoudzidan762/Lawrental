import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lawrental/constants.dart';
import 'package:lawrental/screens/home_page.dart';
import 'package:lawrental/screens/sign_page.dart';
import 'package:lawrental/widgets/custom_button.dart';
import 'package:lawrental/widgets/custom_text_field.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});
  static String id = 'LoginScreen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController email = TextEditingController();

  TextEditingController password = TextEditingController();

  GlobalKey<FormState> formState = GlobalKey<FormState>();

  bool isLoaing = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: (isLoaing)
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
                      reverse: true,
                      children: [
                        Row(
                          children: [
                            ColorFiltered(
                              colorFilter: ColorFilter.mode(
                                  Colors.white.withOpacity(0.2),
                                  BlendMode.dstATop),
                              child: Image.asset(
                                ('assets/image/lawrentall.png'),
                                height: 30.h,
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5, bottom: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Don’t have an account? ',
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  fontFamily: "MADEOkine",
                                  color: Colors.black,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(context, SignUpPage.id);
                                },
                                child: const Text(
                                  ' sign up',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: KPrimaryColor,
                                      fontFamily: "medium"),
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 32, right: 32, top: 10, bottom: 10),
                          child: CustomButton(
                            text: 'log in',
                            color: KPrimaryColor,
                            height: 7.h,
                            width: 85.w,
                            textColor: Colors.white,
                            onTap: () async {
                              if (formState.currentState!.validate()) {
                                try {
                                  isLoaing = true;
                                  setState(() {});
                                  final credential = await FirebaseAuth.instance
                                      .signInWithEmailAndPassword(
                                          email: email.text,
                                          password: password.text);
                                  Navigator.pushNamed(context, HomePage.id);
                                  isLoaing = false;
                                  setState(() {});
                                } on FirebaseAuthException catch (e) {
                                  isLoaing = false;
                                  setState(() {});
                                  if (e.code == 'user-not-found') {
                                    print('No user found for that email.');
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                            content: Text(
                                                'No user found for that email.')));
                                  } else if (e.code == 'wrong-password') {
                                    print(
                                        'Wrong password provided for that user.');
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                            content: Text(
                                                'Wrong password provided for that user.')));
                                  } else {
                                    print('${e.toString()}');
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                            content: Text(
                                                'incorrect email or password')));
                                  }
                                } catch (e) {
                                  isLoaing = false;
                                  setState(() {});
                                  print('${e.toString()}');
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content: Text(
                                              'No user found for that email.')));
                                }
                              }
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 32, right: 32, top: 10, bottom: 10),
                          child: customTextFormField(
                            validator: (p0) {
                              if (p0 == '') return 'shouldn\'t empty';
                            },
                            controller: password,
                            obscureText: true,
                            text: 'password',
                            textSize: 17.sp,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 32, right: 32, top: 10, bottom: 10),
                          child: customTextFormField(
                            validator: (p0) {
                              if (p0 == '') return 'shouldn\'t empty';
                            },
                            controller: email,
                            text: 'Email Address',
                            textSize: 17.sp,
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
