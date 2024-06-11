import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lawrental/constants.dart';
import 'package:lawrental/model/lawyer_model.dart';
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
    LawyerModel lawyerModel =
        ModalRoute.of(context)!.settings.arguments as LawyerModel;
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
                    Container(
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: KPrimaryColor,
                      ),
                      width: 35.w,
                      height: 20.h,
                      child: Image.network('${lawyerModel.photo}'),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '${lawyerModel.first_name}',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: "medium",
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '${lawyerModel.last_name}',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: "medium",
                            fontSize: 15.sp,
                          ),
                        ),
                      ],
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
          Expanded(
            child: ListView(
              children: [
                Container(
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(10),
                  // height: 12.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: KPrimaryColor,
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'about :',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'medium',
                              fontWeight: FontWeight.bold,
                              fontSize: 18.sp,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            '${lawyerModel.about_me}',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(10),
                  // height: 12.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: KPrimaryColor,
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'experience :',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'medium',
                              fontWeight: FontWeight.bold,
                              fontSize: 18.sp,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            '${lawyerModel.experience}',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(10),
                  // height: 12.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: KPrimaryColor,
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'first address :',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'medium',
                              fontWeight: FontWeight.bold,
                              fontSize: 18.sp,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            '${lawyerModel.first_address}',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(10),
                  // height: 12.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: KPrimaryColor,
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'gender :',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'medium',
                              fontWeight: FontWeight.bold,
                              fontSize: 18.sp,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            '${lawyerModel.gender}',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(10),
                  // height: 12.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: KPrimaryColor,
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'phone :',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'medium',
                              fontWeight: FontWeight.bold,
                              fontSize: 18.sp,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            '${lawyerModel.phone}',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(10),
                  // height: 12.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: KPrimaryColor,
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'second address :',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'medium',
                              fontWeight: FontWeight.bold,
                              fontSize: 18.sp,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            '${lawyerModel.second_address}',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(10),
                  // height: 12.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: KPrimaryColor,
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'specialty :',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'medium',
                              fontWeight: FontWeight.bold,
                              fontSize: 18.sp,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            '${lawyerModel.specialty}',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
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
