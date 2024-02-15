import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextField extends StatefulWidget {
  final String labelText;
  final String hintText;

  const CustomTextField({
    Key? key,
    required this.labelText,
    required this.hintText,
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  TextEditingController _controller = TextEditingController();

  void dispose() {
    _controller.dispose();
    super.dispose();
  }

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
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '     ${widget.labelText}',
            style: text,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            decoration: fieldCreate,
            height: 50,
            width: 140,
            child: TextField(
              style: text,
              controller: _controller,
              onChanged: (value) {
                // This ensures the value is updated in the parent widget
                setState(() {});
              },
              decoration: InputDecoration(
                hintText: widget.hintText,
                border: InputBorder.none,
                hintStyle: textField,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomDropdownField extends StatelessWidget {
  final String labelText;
  final List<String> dropdownValues;
  final String hintText;
  final TextEditingController controller;

  const CustomDropdownField({
    Key? key,
    required this.labelText,
    required this.dropdownValues,
    required this.hintText,
    required this.controller,
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
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '     $labelText',
            style: text,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            decoration: fieldCreate,
            height: 50,
            width: 140,
            child: DropdownButtonFormField(
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
                border: InputBorder.none,
                hintStyle: textField,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
