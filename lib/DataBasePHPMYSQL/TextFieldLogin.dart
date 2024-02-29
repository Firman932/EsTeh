import 'package:flutter/material.dart';
import 'package:lji/styles/color.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginInput extends StatefulWidget {
  final TextEditingController textController;
  final String hintText;
  final IconData? leftIcon;
  final bool isObsecure;
  final VoidCallback? onLeftIconPressed;

  const LoginInput({
    Key? key, // Perbaiki key menjadi Key?
    required this.hintText,
    this.isObsecure = false,
    this.leftIcon,
    required this.textController,
    this.onLeftIconPressed,
    required String? Function(dynamic value) validator,
  });

  @override
  State<LoginInput> createState() => LoginInputState();
}

class LoginInputState extends State<LoginInput> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: greenPrimary,
      style: GoogleFonts.poppins(fontSize: 12),
      obscureText: widget.isObsecure,
      controller: widget.textController,
      decoration: InputDecoration(
        hintText: widget.hintText,
        contentPadding: EdgeInsets.zero,
        hintStyle: GoogleFonts.poppins(fontSize: 12),
        prefixIcon: Icon(widget.leftIcon, color: Color(0xff49A013)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            width: 1,
            color: Colors.grey,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(width: 1, color: Colors.grey),
        ),
      ),
    );
  }
}
