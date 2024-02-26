import 'package:flutter/material.dart';
import 'package:lji/styles/color.dart';
// import 'package:google_fonts/google_fonts.dart';

class LoginInput extends StatefulWidget {
  final TextEditingController textController;
  final String hintText;
  final IconData? leftIcon;
  final bool isObsecure;
  final VoidCallback? onLeftIconPressed;

  const LoginInput({
    super.key,
    required this.hintText,
    this.isObsecure = false,
    this.leftIcon,
    required this.textController,
    this.onLeftIconPressed, required String? Function(dynamic value) validator,
  });
  @override
  State<LoginInput> createState() => LoginInputState();
}

class LoginInputState extends State<LoginInput> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                blurRadius: 10,
                spreadRadius: 3,
                offset: Offset(2, 2),
                color: Colors.transparent),
          ]),
      child: TextField(
        cursorColor: greenPrimary,
        obscureText: widget.isObsecure,
        controller: widget.textController,
        decoration: InputDecoration(
            hintText: widget.hintText,
            prefixIcon: Icon(widget.leftIcon, color: Color(0xff49A013)),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(
                width: 1,
                color: Colors.grey,
              ),
            ),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(width: 1, color: Colors.grey))),
      ),
    );
  }
}
