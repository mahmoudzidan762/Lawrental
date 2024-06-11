import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lawrental/constants.dart';
import 'package:lawrental/model/lawyer_model.dart';
import 'package:lawrental/screens/Profile_page.dart';
import 'package:lawrental/screens/chat_page.dart';
import 'package:lawrental/screens/lawyer_profile_page.dart';
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
  List<QueryDocumentSnapshot> lawyers = [];
  List<QueryDocumentSnapshot> mans = [];
  List<QueryDocumentSnapshot> womans = [];

  Color getColor(bool s) {
    if (s)
      return KPrimaryColor;
    else
      return Color.fromARGB(255, 109, 111, 122);
  }

  bind1() {
    mans = lawyers
        .where((element) => (element['gender'] as String)
            .toLowerCase()
            .contains('man'.toLowerCase()))
        .toList();
    setState(() {});
  }

  bind2() {
    womans = lawyers
        .where((element) => (element['gender'] as String)
            .toLowerCase()
            .contains('woman'.toLowerCase()))
        .toList();
    setState(() {});
  }

  getLawyers() async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('Lawyer Info').get();
    lawyers.addAll(querySnapshot.docs);
    setState(() {});
  }

  @override
  void initState() {
    getLawyers();
    super.initState();
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
            DefaultTabController(length: 3, child: TabBarWidget()),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  LawyerModel lawyerModel = LawyerModel(
                      about_me: lawyers[index]['about me'],
                      photo: lawyers[index]['image Profile Url'],
                      experience: lawyers[index]['experience'],
                      first_address: lawyers[index]['first address'],
                      second_address: lawyers[index]['second address'],
                      first_name: lawyers[index]['first name'],
                      last_name: lawyers[index]['last name'],
                      gender: lawyers[index]['gender'],
                      phone: lawyers[index]['phone'],
                      specialty: lawyers[index]['specialty']);
                  return GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, LawyerProfilePage.id,
                          arguments: lawyerModel);
                    },
                    child: CustomCardLawyer(
                      profileImageCard: Image.network(
                        '${lawyerModel.photo}',
                      ),
                      lawyerName: lawyers[index]['first name'],
                      lawyerspecialty: lawyers[index]['specialty'],
                      about_me: lawyers[index]['about me'],
                    ),
                  );
                },
                itemCount: lawyers.length,
              ),
            ),
          ],
        ));
  }
}
