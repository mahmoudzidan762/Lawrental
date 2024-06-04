import 'package:flutter/material.dart';
import 'package:lawrental/screens/login_screen.dart';
import 'package:lawrental/screens/messages_page.dart';
import 'package:lawrental/widgets/custom_button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class LawyerProfilePage extends StatefulWidget {
  const LawyerProfilePage({super.key});
  static String id = "LawyerProfilePage";

  @override
  State<LawyerProfilePage> createState() => _LawyerProfilePageState();
}

class _LawyerProfilePageState extends State<LawyerProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            height: 35.h,
            color: Color(0xff14213D),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CircleAvatar(
                      backgroundColor: Color(0xffDDE3EB),
                      maxRadius: 35.sp,
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.person_rounded,
                          size: 45.sp,
                          color: Color(0xff565E74),
                        ),
                      ),
                    ),
                    Text(
                      'Mahmoud Zidan',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: "medium",
                          fontSize: 18.sp),
                    ),
                  ],
                ),
                CustomButton(
                    onTap: () {
                      Navigator.pushNamed(context, MessagesPage.id);
                    },
                    text: 'CHAT',
                    textColor: const Color(0xFF14213D),
                    color: Colors.white,
                    height: 6.h,
                    width: 75.w),
              ],
            ),
          ),
          Text('Lawyer Information'),
        ],
      ),
    );
  }
}
