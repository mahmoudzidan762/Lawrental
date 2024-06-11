import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lawrental/screens/lawyer_profile_page.dart';
import 'package:lawrental/widgets/chat_bubble.dart';
import 'package:lawrental/widgets/chat_bubble1.dart';
import 'package:lawrental/widgets/chat_bubble2.dart';
import 'package:lawrental/widgets/custom_text_field.dart';
import 'package:lawrental/widgets/textfield_email.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../model/message_model.dart';

class MessagesPage extends StatefulWidget {
  const MessagesPage({Key? key}) : super(key: key);
  static String id = "MessagesPage";

  @override
  State<MessagesPage> createState() => _MessagesPageState();
}

class _MessagesPageState extends State<MessagesPage> {
  String? text;
  final ScrollController scrollController = ScrollController();

  CollectionReference messages =
      FirebaseFirestore.instance.collection('messages');

  TextEditingController controler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var list = ModalRoute.of(context)!.settings.arguments as List<String?>;
    return StreamBuilder<QuerySnapshot>(
        stream: messages.orderBy('createdAt', descending: true).snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Message> messageList = [];
            for (int i = 0; i < snapshot.data!.docs.length; i++) {
              messageList.add(Message.fromjeson(snapshot.data!.docs[i]));
            }
            List<Message> myList = [];
            for (int i = 0; i < messageList.length; i++) {
              if ((messageList[i].to ==
                          FirebaseAuth.instance.currentUser!.uid &&
                      list[2] == messageList[i].id) ||
                  (messageList[i].to == list[2] &&
                      messageList[i].id ==
                          FirebaseAuth.instance.currentUser!.uid)) {
                myList.add(messageList[i]);
              }
            }
            return Scaffold(
              body: Column(
                children: [
                  Container(
                    height: 120,
                    width: double.infinity,
                    color: const Color(0xFF14213D),
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          IconButton(
                            color: Colors.white,
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(Icons.arrow_back),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: CircleAvatar(
                              maxRadius: 20,
                              minRadius: 10,
                              child: IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.person_rounded,
                                  size: 25,
                                  color: Color(0xFF565E74),
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, LawyerProfilePage.id);
                            },
                            child: const Text('Muhamed Khaled',
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: "Unigeo64",
                                    decoration: TextDecoration.none)),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                        reverse: true,
                        controller: scrollController,
                        itemCount: myList.length,
                        itemBuilder: (context, index) {
                          return myList[index].id ==
                                  FirebaseAuth.instance.currentUser!.uid
                              ? chatBubble2(
                                  message: myList[index],
                                )
                              : chatBubble(
                                  message: myList[index],
                                );
                        }),
                  ),
                  Container(
                    alignment: Alignment.bottomCenter,
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Icon(Icons.image_rounded,
                            color: Color(0xFF14213D)),
                        const Icon(Icons.keyboard_voice_sharp,
                            color: Color(0xFF14213D)),
                        Container(
                          height: 7.h,
                          width: 70.w,
                          child: TextField(
                            controller: controler,
                            onChanged: (value) {
                              text = value;
                            },
                            decoration: InputDecoration(
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  if (list[2] ==
                                      FirebaseAuth.instance.currentUser!.uid) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                            content: Text(
                                                'can\'t send to yourself')));
                                  } else {
                                    messages.add({
                                      'message': text,
                                      'createdAt': DateTime.now(),
                                      'id': FirebaseAuth
                                          .instance.currentUser!.uid,
                                      'imageUrl': list[0],
                                      'userName': FirebaseAuth
                                          .instance.currentUser!.displayName,
                                      'to': list[2],
                                    });
                                  }

                                  controler.clear();
                                  scrollController.animateTo(
                                    0,
                                    duration: Duration(seconds: 2),
                                    curve: Curves.fastOutSlowIn,
                                  );
                                },
                                child: Icon(
                                  Icons.send,
                                  color: Colors.blue,
                                ),
                              ),
                              hintText: 'Send a message',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                            ),
                          ),
                        ),
                        const Icon(
                          Icons.send,
                          color: Color(0xFF14213D),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            );
          }
        });
  }
}
