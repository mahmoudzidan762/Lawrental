import 'package:flutter/material.dart';
import 'package:lawrental/constants.dart';
import 'package:lawrental/screens/messages_page.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'custom_button.dart';

class CustomCardLawyer extends StatefulWidget {
  CustomCardLawyer();

  @override
  State<CustomCardLawyer> createState() => _CustomCardLawyerState();
}

class _CustomCardLawyerState extends State<CustomCardLawyer> {
  bool current = false;

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
                  CircleAvatar(
                    maxRadius: 25.sp,
                    child: Center(
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.person_rounded,
                          size: 30.sp,
                          color: Color(0xFF565E74),
                        ),
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Lawyer Name',
                        style: TextStyle(
                          fontFamily: "medium",
                          fontWeight: FontWeight.bold,
                          fontSize: 18.sp,
                          color: KPrimaryColor,
                        ),
                      ),
                      Text(
                        'Lawyer informations',
                        style: TextStyle(
                          fontFamily: "medium",
                          fontSize: 15.sp,
                          color: KPrimaryColor,
                        ),
                      ),
                      Text(
                        'Lawyer governorate',
                        style: TextStyle(
                          fontFamily: "thin",
                          fontWeight: FontWeight.bold,
                          fontSize: 14.sp,
                          color: KPrimaryColor,
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        current ^= true;
                      });
                    },
                    icon: Icon(
                      Icons.favorite,
                      size: 25.sp,
                    ),
                    color: (current) ? KPrimaryColor : Colors.grey,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomButton(
                fontSize: 17,
                text: "chat",
                textcolor: Colors.white,
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
