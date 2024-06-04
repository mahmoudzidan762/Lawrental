import 'package:flutter/material.dart';
import 'package:lawrental/constants.dart';
import 'package:lawrental/screens/chat_page.dart';
import 'package:lawrental/screens/home_page.dart';
import 'package:lawrental/screens/notification_page.dart';
import 'package:lawrental/screens/searchpage.dart';
import 'package:lawrental/widgets/chat_Card.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ChatPage extends StatefulWidget {
  ChatPage({super.key});
  static String id = "ChatPage";

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  int curridx = 0;

  bool selected = true;

  Color getColor(bool s) {
    if (s)
      return KPrimaryColor;
    else
      return Color.fromARGB(255, 109, 111, 122);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody:
          true, // This will make the body extend under the navigation bar
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(top: 24, bottom: 24, left: 32, right: 32),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(
              32.0), // Adjust the corner radius as desired
          child: BottomNavigationBar(
            backgroundColor: Color.fromARGB(255, 218, 222, 243),
            selectedItemColor: KPrimaryColor,
            unselectedItemColor: Color.fromARGB(255, 109, 111, 122),
            type: BottomNavigationBarType.fixed,
            elevation: 8.0,
            currentIndex: curridx,
            onTap: (value) {
              setState(() {
                curridx = value;
                selected = false;
              });
              if (value == 0)
                Navigator.popAndPushNamed(context, HomePage.id);
              else if (value == 1)
                Navigator.popAndPushNamed(context, SearchPage.id);
              else if (value == 2)
                Navigator.popAndPushNamed(context, NotificationPage.id);
            },
            showUnselectedLabels: false,
            showSelectedLabels: false,
            iconSize: 15.sp,
            items: [
              BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/image/Home_fill 2.png',
                  scale: 4.5.sp,
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/image/Group 2.png',
                  scale: 4.5.sp,
                ),
                label: 'Search',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/image/Ring_fill.png',
                  scale: 4.5.sp,
                ),
                label: 'Notifications',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/image/Chat_fill.png',
                  color: getColor(selected),
                  scale: 4.5.sp,
                ),
                label: 'Chats',
              ),
            ],
          ),
        ),
      ),

      body: Container(
        height: 20.h,
        width: double.infinity,
        color: KPrimaryColor,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'chats',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25.sp,
                  fontFamily: 'medium',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
