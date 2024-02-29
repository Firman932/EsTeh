import 'package:flutter/material.dart';
import 'package:lji/styles/color.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterInput extends StatefulWidget {
  final TextEditingController textController;
  final String hintText;
  final IconData? leftIcon;
  final IconData? rightIcon;
  final bool isObsecure;
  final VoidCallback? onLeftIconPressed;
  final VoidCallback? onRightconPressed;

  const RegisterInput({
    super.key,
    required this.hintText,
    this.isObsecure = false,
    this.leftIcon,
    this.rightIcon,
    required this.textController,
    this.onLeftIconPressed,
    this.onRightconPressed,
    required String? Function(dynamic value) validator,
  });
  @override
  State<RegisterInput> createState() => _RegisterInputState();
}

class _RegisterInputState extends State<RegisterInput> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: greenPrimary,
      obscureText: widget.isObsecure,
      controller: widget.textController,
      style: GoogleFonts.poppins(fontSize: 12),
      decoration: InputDecoration(
          contentPadding: EdgeInsets.zero,
          hintText: widget.hintText,
          hintStyle: GoogleFonts.poppins(fontSize: 12),
          prefixIcon: Icon(widget.leftIcon, color: Color(0xff49A013)),
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
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              width: 1,
              color: Colors.grey,
            ),
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(width: 1, color: Colors.grey))),
    );
  }
}
