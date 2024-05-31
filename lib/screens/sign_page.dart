import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lawrental/constants.dart';
import 'package:lawrental/screens/signup_lawyer.dart';
import 'package:lawrental/screens/signup_user.dart';
import 'package:lawrental/widgets/custom_button.dart';
import 'package:lawrental/widgets/custom_text_field.dart';
import 'package:lawrental/widgets/textfield_email.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});
  static String id = 'SignUpPage';

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
            child: ListView(
              children: [
                Center(
                  child: Stack(
                    children: [
                      CircleAvatar(
                        backgroundColor: KPrimaryTextFieldColor,
                        maxRadius: 80,
                        minRadius: 50,
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.person_rounded,
                            size: 50.sp,
                            color: Color(0xFF565E74),
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.add_circle_sharp,
                          color: KPrimaryColor,
                          size: 23.sp,
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      customTextField(
                        text: 'first name',
                        color: KPrimaryTextFieldColor,
                        textColor: Colors.white,
                        width: 42.w,
                        height: 1.h,
                        fontFamily: 'medium',
                      ),
                      customTextField(
                        text: 'last name',
                        color: KPrimaryTextFieldColor,
                        textColor: Colors.white,
                        width: 42.w,
                        height: 1.h,
                        fontFamily: 'medium',
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
                    onTap: () {
                      Navigator.pushNamed(context, SignUpLawyer.id);
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
                    onTap: () {
                      Navigator.pushNamed(context, SignUpUser.id);
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
