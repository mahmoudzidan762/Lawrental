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
<<<<<<< HEAD
=======
                      ],
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      border: Border.all(color: const Color(0xFF14213D)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                maxRadius: 40,
                                minRadius: 30,
                                child: Center(
                                  child: IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.person_rounded,
                                      size: 65,
                                      color: Color(0xFF565E74),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              const Padding(
                                padding: EdgeInsets.only(top: 8),
                                child: Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Muhamed Khaled Muhamed',
                                        style: TextStyle(
                                          fontFamily: "Unigeo64",
                                          fontWeight: FontWeight.w600,
                                          fontSize: 20,
                                          color: Color(0xFF14213D),
                                        ),
                                      ),
                                       SizedBox(
                                          height: 5), // Add some spacing here
                                      Text(
                                        'Cassation lawyer',
                                        style: TextStyle(
                                          fontFamily: "Unigeo64",
                                          fontWeight: FontWeight.w400,
                                          fontSize: 20,
                                          color: Color(0xFF14213D),
                                        ),
                                      ),
                                       SizedBox(
                                          height: 5), // Add some spacing here
                                      Text(
                                        'Alexandria',
                                        style: TextStyle(
                                          fontFamily: "Unigeo64",
                                          fontWeight: FontWeight.w200,
                                          fontSize: 16,
                                          color: Color(0xFF14213D),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    current = index;
                                  });
                                },
                                icon: Icon(
                                  Icons.favorite,
                                  size: 42,
                                  color: current == index
                                      ? Colors.white
                                      : const Color(0xFF14213D),
                                ),
                              ),
                            ],
                          ),
                          CustomButton(
                              text: "Chat",
                              textColor: Colors.white,
                              color: const Color(0xFF14213D),
                              height: 46,
                              width: 355,
                          onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=> const MessagesPage()));
                          },
                          )
                        ],
>>>>>>> f19aa386997383b43244555cc8c463926469f24c
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
