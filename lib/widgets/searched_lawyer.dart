import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lawrental/constants.dart';
import 'package:lawrental/screens/lawyer_profile_page.dart';
import 'package:lawrental/screens/messages_page.dart';
import 'package:lawrental/widgets/custom_button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SearchedLawyer extends StatelessWidget {
  SearchedLawyer({this.lawyerInfo, this.lawyerName, this.photo});
  String? photo;
  String? lawyerName;
  String? lawyerInfo;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 16, right: 16),
      color: Colors.white,
      height: 10.h,
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, LawyerProfilePage.id);
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleAvatar(
              backgroundColor: KPrimaryTextFieldColor,
              maxRadius: 35.Q,
              child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.person_rounded,
                  size: 30.sp,
                  color: Color(0xFF565E74),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${lawyerName!.split(' ')[0]}...',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontFamily: 'medium',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '${lawyerInfo!.split(' ')[0]}...',
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontFamily: 'thin',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            CustomButton(
              onTap: () {
                Navigator.pushNamed(context, MessagesPage.id);
              },
              text: 'chat',
              textColor: Colors.white,
              color: KPrimaryColor,
              height: 5.h,
              width: 25.w,
            ),
          ],
        ),
      ),
    );
  }
}
