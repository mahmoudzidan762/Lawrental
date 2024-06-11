import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lawrental/constants.dart';
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
  List<QueryDocumentSnapshot> allDocs = [];
  String? photo;

  getLawyers() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('Lawyer Info')
        .where('id', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get();
    allDocs.addAll(querySnapshot.docs);
    setState(() {});
    for (int i = 0; i < allDocs.length; i++) {
      if (allDocs[i]['id'] == FirebaseAuth.instance.currentUser!.uid) {
        photo = allDocs[i]['image Profile Url'];
      }
    }
  }

  @override
  void initState() {
    getLawyers();
    super.initState();
  }

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
                    Container(
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: KPrimaryColor,
                      ),
                      width: 35.w,
                      height: 20.h,
                      child: (photo == null)
                          ? Text('deta')
                          : Image.network(photo!),
                    ),
                    Text(
                      FirebaseAuth.instance.currentUser!.displayName.toString(),
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: "medium",
                          fontSize: 18.sp),
                    ),
                  ],
                ),
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
