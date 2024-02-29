import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lji/styles/color.dart';

class CustomTextField extends StatelessWidget {
  final String labelText;
  final String hintText;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  const CustomTextField({
    Key? key,
    required this.labelText,
    required this.hintText,
    required this.controller,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textField = GoogleFonts.poppins(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: Colors.black26,
    );
    final text = GoogleFonts.poppins(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: Colors.black,
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$labelText',
          style: text,
        ),
        SizedBox(height: 5,),
        TextFormField(
          cursorColor: greenPrimary,
          style: text,
          controller: controller,
          validator: validator,
          decoration: InputDecoration(
            hintText: hintText,
            border: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.black12, // Default border color
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.black, // Default border color
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: const Color.fromRGBO(73, 160, 19, 1), // Desired focus color
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
            hintStyle: textField,
          ),
        ),
      ],
    );
  }
}

class CustomDropdownField extends StatelessWidget {
  final String labelText;
  final List<String> dropdownValues;
  final String hintText;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  const CustomDropdownField({
    Key? key,
    required this.labelText,
    required this.dropdownValues,
    required this.hintText,
    required this.controller,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textField = GoogleFonts.poppins(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: Colors.black26,
    );
    final text = GoogleFonts.poppins(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: Colors.black,
    );
    final fieldCreate = BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color.fromARGB(255, 240, 240, 240));
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$labelText',
          style: text,
        ),
        SizedBox(height: 5,),
        DropdownButtonFormField(
          validator: validator,
          isExpanded: true,
          value: controller.text.isNotEmpty ? controller.text : null,
          onChanged: (newValue) {
            // Add any additional logic if needed
            controller.text = newValue.toString();
          },
          items: dropdownValues.map((value) {
            return DropdownMenuItem(
              value: value,
              child: Text(
                value,
                style: text,
              ),
            );
          }).toList(),
          decoration: InputDecoration(
            hintText: hintText,
            border: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.black12, // Default border color
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.black, // Default border color
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: const Color.fromRGBO(73, 160, 19, 1), // Desired focus color
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
            hintStyle: textField,
          ),
        ),
      ],
    );
  }
}
