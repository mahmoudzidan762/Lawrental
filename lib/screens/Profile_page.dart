import 'package:flutter/material.dart';
import 'package:lawrental/screens/login_screen.dart';
import 'package:lawrental/widgets/custom_button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});
  static String id = "ProfilePage";
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            height: 45.h,
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
                    text: 'edit Profile',
                    textColor: const Color(0xFF14213D),
                    color: Colors.white,
                    height: 6.h,
                    width: 75.w),
                CustomButton(
                  onTap: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, LoginScreen.id, (route) => false);
                  },
                  text: 'Log out',
                  textColor: const Color(0xFF9D0101),
                  color: Colors.white,
                  height: 6.h,
                  width: 75.w,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Text(
                  'favourites',
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'medium',
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Image.asset(
            'assets/image/Favorite.png',
            height: 15.h,
          ),
          Text(
            'add favourite',
            style: TextStyle(
                color: Color(0xffA1A6B1),
                fontWeight: FontWeight.bold,
                fontSize: 18.sp),
          ),
        ],
      ),
    );
  }
}
