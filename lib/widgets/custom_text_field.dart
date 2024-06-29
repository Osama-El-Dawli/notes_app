import 'package:flutter/material.dart';
import 'package:notes/consts.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key, this.maxLines = 1, required this.hintText});

  final int maxLines;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TextField(
        maxLines: maxLines,
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(color: kPrimaryColor),
          border: buildBorder(),
          enabledBorder: buildBorder(),
          focusedBorder: buildBorder(color: kPrimaryColor),
        ),
      ),
    );
  }

  OutlineInputBorder buildBorder({color}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: color ?? Colors.white),
    );
  }
}
