
// import 'package:flutter/material.dart';
// import 'package:lawrental/model/message_model.dart';

// class chatBubble2 extends StatelessWidget {
//   const chatBubble2({
//     super.key,
//     required this.message,
//   });
//   final Message message;
//   @override
//   Widget build(BuildContext context) {
//     return Align(
//       alignment: Alignment.centerRight,
//       child: Container(
//         margin: EdgeInsets.all(8),
//         padding: EdgeInsets.all(16),
//         decoration: BoxDecoration(
//           color: Colors.blue,
//           borderRadius: BorderRadius.only(
//             topLeft: Radius.circular(32),
//             topRight: Radius.circular(32),
//             bottomLeft: Radius.circular(32),
//           ), 
//         ),
//         child: Text(message.message,
//         style: TextStyle(color: Colors.white),
//         ),
//       ),
//     );
//   }
// }