import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lawrental/constants.dart';
import 'package:lawrental/screens/home_page.dart';
import 'package:lawrental/screens/sign_page.dart';
import 'package:lawrental/widgets/custom_button.dart';
import 'package:lawrental/widgets/custom_text_field.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  static String id = 'LoginScreen';

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
              reverse: true,
              children: [
                Row(
                  children: [
                    ColorFiltered(
                      colorFilter: ColorFilter.mode(
                          Colors.white.withOpacity(0.2), BlendMode.dstATop),
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
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomePage()));
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 32, right: 32, top: 10, bottom: 10),
                  child: customTextField(
                    height: 2.h,
                    text: 'password',
                    width: 85.w,
                    color: KPrimaryTextFieldColor,
                    textColor: Colors.white,
                    fontFamily: 'Unigeo64',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 32, right: 32, top: 10, bottom: 10),
                  child: customTextField(
                    height: 2.h,
                    text: 'email or phone number',
                    width: 85.w,
                    color: KPrimaryTextFieldColor,
                    textColor: Colors.white,
                    fontFamily: 'Unigeo64',
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
