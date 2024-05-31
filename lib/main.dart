import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:lawrental/constants.dart';
import 'package:lawrental/screens/login_screen.dart';
import 'package:lawrental/screens/sign_page.dart';
import 'package:lawrental/screens/signup_lawyer.dart';
import 'package:lawrental/screens/signup_user.dart';
import 'package:lawrental/screens/splash_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void main() => runApp(const LawRental());

class LawRental extends StatelessWidget {
  const LawRental({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (p0, p1, p2) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          routes: {
            SplashScreen.id: (context) => SplashScreen(),
            LoginScreen.id:(context) => LoginScreen(),
            SignUpPage.id:(context) => SignUpPage(),
            SignUpLawyer.id:(context) => SignUpLawyer(),
            SignUpUser.id:(context) => SignUpUser(), 
          },
          home: AnimatedSplashScreen(
            duration: 2500,
            splash: Image.asset(KLogo),
            nextScreen: LoginScreen(),
            backgroundColor: KPrimaryColor,
          ),
        );
      },
    );
  }
}
