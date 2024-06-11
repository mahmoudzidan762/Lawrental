import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lawrental/constants.dart';
import 'package:lawrental/model/lawyer_model.dart';
import 'package:lawrental/screens/chat_page.dart';
import 'package:lawrental/screens/home_page.dart';
import 'package:lawrental/screens/lawyer_profile_page.dart';
import 'package:lawrental/screens/notification_page.dart';
import 'package:lawrental/widgets/searched_lawyer.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});
  static String id = "SearchPage";

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  int curridx = 1;
  bool selected = true;
  List<QueryDocumentSnapshot> searched = [];
  List<QueryDocumentSnapshot> lawyers = [];
  TextEditingController searchField = TextEditingController();

  bind() {
    searched = lawyers
        .where((e) => (e['first name'] as String)
            .toLowerCase()
            .contains(searchField.text.toLowerCase()))
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

  Color getColor(bool s) {
    if (s)
      return KPrimaryColor;
    else
      return Color.fromARGB(255, 109, 111, 122);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
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
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/image/Group 2.png',
                  color: getColor(selected),
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
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 25, right: 25, top: 20, bottom: 13),
                child: Container(
                  height: 6.h,
                  child: TextField(
                    controller: searchField,
                    textAlignVertical: TextAlignVertical.bottom,
                    onChanged: (value) {
                      if (!value.isEmpty) {
                        bind();
                      } else {
                        searched.clear();
                        setState(() {});
                      }
                    },
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xFFDDE3EB),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(11),
                        borderSide: BorderSide.none,
                      ),
                      hintStyle: TextStyle(
                        color: Colors.white,
                        fontFamily: 'medium',
                        fontSize: 20.sp,
                      ),
                      hintText: 'search in Lawrental.',
                      prefixIcon: Icon(
                        Icons.search,
                        size: 25.sp,
                      ),
                      prefixIconColor: KPrimaryColor,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: searched.length,
              itemBuilder: (context, index) {
                LawyerModel lawyerModel = LawyerModel(
                    about_me: searched[index]['about me'],
                    photo: searched[index]['image Profile Url'],
                    experience: searched[index]['experience'],
                    first_address: searched[index]['first address'],
                    second_address: searched[index]['second address'],
                    first_name: searched[index]['first name'],
                    last_name: searched[index]['last name'],
                    gender: searched[index]['gender'],
                    phone: searched[index]['phone'],
                    specialty: searched[index]['specialty']);
                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, LawyerProfilePage.id,
                        arguments: lawyerModel);
                  },
                  child: SearchedLawyer(
                    lawyerName: searched[index]['first name'],
                    lawyerInfo: searched[index]['about me'],
                  ),
                );
                //   ListTile(
                //     title: GestureDetector(
                //       onTap: () {
                //         Navigator.push(
                //             context,
                //             MaterialPageRoute(
                //                 builder: (context) => const LawyerProfilePage()));
                //       },
                //       child: Text(
                //         display_list[index].title!,
                //         style: const TextStyle(
                //             color: Color(0xFF14213D),
                //             fontWeight: FontWeight.w600,
                //             fontFamily: "Unigeo64",
                //             fontSize: 20),
                //       ),
                //     ),
                //     subtitle: Text(
                //       display_list[index].subTitle!,
                //       style: const TextStyle(
                //           color: Color(0xFF14213D),
                //           fontWeight: FontWeight.w300,
                //           fontFamily: "Unigeo64",
                //           fontSize: 16),
                //     ),
                //     trailing: CustomButton(
                //       text: 'Chat',
                //       textColor: Colors.white,
                //       color: const Color(0xFF14213D),
                //       height: 46,
                //       width: 115,
                //     ),
                //     leading: CircleAvatar(
                //       maxRadius: 35,
                //       minRadius: 25,
                //       child: IconButton(
                //         onPressed: () {},
                //         icon: const Icon(
                //           Icons.person_rounded,
                //           size: 32,
                //           color: Color(0xFF565E74),
                //         ),
                //       ),
                //     ),
                //   );
              },
            ),
          )
        ],
      ),
    );
  }
}
