import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lawrental/constants.dart';
import 'package:lawrental/screens/lawyer_profile_page.dart';
import 'package:lawrental/screens/messages_page.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'custom_button.dart';

class CustomCardLawyer extends StatelessWidget {
  CustomCardLawyer(
      {this.profileImageCard,
      this.lawyerName,
      this.lawyerspecialty,
      this.about_me});
  Widget? profileImageCard;
  String? lawyerName;
  String? lawyerspecialty;
  String? about_me;
  // bool current = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Card(
        surfaceTintColor: Colors.white,
        elevation: 10,
        shadowColor: KPrimaryColor,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: KPrimaryColor,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 20.w,
                    height: 10.h,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: profileImageCard,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        lawyerName!,
                        style: TextStyle(
                          fontFamily: "medium",
                          fontWeight: FontWeight.bold,
                          fontSize: 18.sp,
                          color: KPrimaryColor,
                        ),
                      ),
                      Text(
                        about_me!,
                        style: TextStyle(
                          fontFamily: "medium",
                          fontSize: 15.sp,
                          color: KPrimaryColor,
                        ),
                      ),
                      Text(
                        lawyerspecialty!,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14.sp,
                          color: KPrimaryColor,
                        ),
                      ),
                    ],
                  ),
                  // IconButton(
                  //   onPressed: () {
                  //     setState(() {
                  //       current ^= true;
                  //     });
                  //   },
                  //   icon: Icon(
                  //     Icons.favorite,
                  //     size: 25.sp,
                  //   ),
                  //   color: (current) ? KPrimaryColor : Colors.grey,
                  // ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomButton(
                fontSize: 17,
                text: "chat",
                textColor: Colors.white,
                color: KPrimaryColor,
                height: 5.h,
                width: 80.w,
                onTap: () {
                  Navigator.pushNamed(context, MessagesPage.id);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
