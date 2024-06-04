import 'package:flutter/material.dart';
import 'package:lawrental/constants.dart';
import 'package:lawrental/screens/Profile_page.dart';
import 'package:lawrental/screens/chat_page.dart';
import 'package:lawrental/screens/notification_page.dart';
import 'package:lawrental/screens/searchpage.dart';
import 'package:lawrental/widgets/custom_card_lawyer.dart';
import 'package:lawrental/widgets/tabbar_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static String id = 'HomePage';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
                if (value == 1)
                  Navigator.popAndPushNamed(context, SearchPage.id);
                else if (value == 2)
                  Navigator.popAndPushNamed(context, NotificationPage.id);
                else if (value == 3)
                  Navigator.popAndPushNamed(context, ChatPage.id);
              },
              showUnselectedLabels: false,
              showSelectedLabels: false,
              iconSize: 15.sp,
              items: [
                BottomNavigationBarItem(
                  icon: Image.asset(
                    'assets/image/Home_fill 2.png',
                    scale: 4.5.sp,
                    color: getColor(selected),
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
                    scale: 4.5.sp,
                  ),
                  label: 'Chats',
                ),
              ],
            ),
          ),
        ),
        body: Column(
          children: [
            Container(
              height: 20.h,
              width: double.infinity,
              color: KPrimaryColor,
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      // maxRadius: 22,
                      // minRadius: 20,
                      child: IconButton(
                        onPressed: () {
                          Navigator.pushNamed(context, ProfilePage.id);
                        },
                        icon: Icon(
                          Icons.person_rounded,
                          size: 20.sp,
                          color: Color(0xFF565E74),
                        ),
                      ),
                    ),
                    Text(
                      'Lawrental.',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: "MADEOkine",
                        fontSize: 25.sp,
                        fontWeight: FontWeight.bold,
                        // decoration: TextDecoration.none,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            DefaultTabController(length: 4, child: TabBarWidget()),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) => CustomCardLawyer(),
                itemCount: 4,
              ),
            ),
          ],
        ));
  }
}
