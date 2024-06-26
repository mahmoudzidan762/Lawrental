import 'package:flutter/material.dart';

class TextFieldEmail extends StatefulWidget {
  TextFieldEmail(
      {super.key,
      this.inputType,
      this.onChanged,
      this.hintText,
      required this.height,
      required this.width});
  final TextInputType? inputType;
  final String? hintText;
  final Function(String)? onChanged;
  final double height;
  final double width;
  @override
  State<TextFieldEmail> createState() => _TextFieldEmailState();
}

class _TextFieldEmailState extends State<TextFieldEmail> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      width: widget.width,
      child: Padding(
        padding: const EdgeInsets.only(top: 5, bottom: 5),
        child: TextFormField(
          keyboardType: widget.inputType,
          onChanged: widget.onChanged,
          // validator: (data) {
          //   if (data == null || data.isEmpty) {
          //     return ('Field is Empty');
          //   }
          // },
          decoration: InputDecoration(
              filled: true,
              fillColor: const Color(0xFFDDE3EB),
              border: OutlineInputBorder(
                  borderSide:
                      const BorderSide(style: BorderStyle.none, width: 0),
                  borderRadius: BorderRadius.circular(13.0)),
              hintText: widget.hintText,
              hintStyle: const TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Unigeo64')),
        ),
      ),
    );
  }
}
