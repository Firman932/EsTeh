import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

class SIGN extends StatefulWidget {
  final TextEditingController textController;
  final String hintText;
  final IconData? leftIcon;
  final IconData? rightIcon;
  final bool isObsecure;
  final VoidCallback? onLeftIconPressed;
  final VoidCallback? onRightconPressed;

  const SIGN({
    super.key,
    required this.hintText,
    this.isObsecure = false,
    this.leftIcon,
    this.rightIcon,
    required this.textController,
    this.onLeftIconPressed,
    this.onRightconPressed,
  });
  @override
  State<SIGN> createState() => _SignInputState();
}

class _SignInputState extends State<SIGN> {
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
        obscureText: widget.isObsecure,
        controller: widget.textController,
        decoration: InputDecoration(
            hintText: widget.hintText,
            prefixIcon: InkWell(
              onTap: () {
                if (widget.onLeftIconPressed != null) ;
                {
                  widget.onLeftIconPressed!();
                }
              },
              child: Icon(widget.leftIcon, color: Color(0xff49A013)),
            ),
            suffixIcon: InkWell(
              onTap: () {
                if (widget.onRightconPressed != null) ;
                {
                  widget.onRightconPressed!();
                }
              },
              child: Icon(widget.rightIcon, color: Color(0xff49A013)),
            ),
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
