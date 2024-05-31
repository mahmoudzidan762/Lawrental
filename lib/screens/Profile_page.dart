import 'package:flutter/material.dart';
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
      body: ListView(
        children: [
          Container(
            color: Color(0xff14213D),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 25),
                  child: Row(children: [
                    CircleAvatar(
                        backgroundColor: Color(0xffDDE3EB),
                        maxRadius: 50,
                        minRadius: 45,
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.person_rounded,
                            size: 35.sp,
                            color: Color(0xff565E74),
                          ),
                        )),
                    Padding(
                      padding: const EdgeInsets.only(left: 25, bottom: 25),
                      child: Text(
                        'Mahmoud Zidan',
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: "medium",
                            fontSize: 18.sp),
                      ),
                    ),
                  ]),
                ),
                CustomButton(
                    text: 'edit Profile',
                    textColor: const Color(0xFF14213D),
                    color: Colors.white,
                    height: 6.h,
                    width: 70.w),
                CustomButton(
                    text: 'Log out',
                    textColor: const Color(0xFF9D0101),
                    color: Colors.white,
                    height: 6.h,
                    width: 70.w),
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
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
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
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
