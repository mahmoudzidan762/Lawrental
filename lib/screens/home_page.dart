import 'package:flutter/material.dart';
import 'package:lawrental/constants.dart';
import 'package:lawrental/screens/Profile_page.dart';
import 'package:lawrental/widgets/bottom_appbar.dart';
import 'package:lawrental/widgets/custom_card.dart';
import 'package:lawrental/widgets/tabbar_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody:
            true, // This will make the body extend under the navigation bar
        bottomNavigationBar: Padding(
          padding: EdgeInsets.all(16.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(
                32.0), // Adjust the corner radius as desired
            child: BottomNavigationBar(
              currentIndex: 0,
              onTap: (index) {
                // Handle navigation to the desired page
                // based on the selected index
              },
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.search),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.notifications),
                  label: '',
                ),
              ],
              backgroundColor: Color(0xFF565E74), // Set the background color
              elevation: 8.0, // Add a shadow effect
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
                itemCount: 3,
              ),
            ),
          ],
        ));
  }
}
