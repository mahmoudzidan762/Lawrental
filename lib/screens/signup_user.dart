import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lawrental/constants.dart';
import 'package:lawrental/widgets/custom_button.dart';
import 'package:lawrental/widgets/textfield_email.dart';
import 'package:lawrental/widgets/textfield_password.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SignUpUser extends StatefulWidget {
  const SignUpUser({Key? key}) : super(key: key);
  static String id = 'SignUpUser';

  @override
  State<SignUpUser> createState() => _SignUpUserState();
}

class _SignUpUserState extends State<SignUpUser> {
  @override
  Widget build(BuildContext context) {
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
              child: ListView(
                children: [
                  TextFieldEmail(
                    height: 9.h,
                    width: 1.w,
                    hintText: 'gender',
                  ),
                  TextFieldEmail(
                    height: 9.h,
                    width: 1.w,
                    hintText: 'email',
                  ),
                  TextFieldEmail(
                    height: 9.h,
                    width: 1.w,
                    hintText: 'phone number',
                  ),
                  TextFieldPassword(
                    height: 9.h,
                    width: 1.w,
                    hintText: 'password',
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomButton(
                      text: 'Sign up',
                      textColor: const Color(0xFF14213D),
                      color: Colors.white,
                      height: 8.h,
                      width: 1.w,
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
