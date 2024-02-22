import 'package:flutter/material.dart';

class FilterUser extends StatefulWidget {
  const FilterUser({Key? key}) : super(key: key);

  @override
  State<FilterUser> createState() => _FilterUserState();
}

class _FilterUserState extends State<FilterUser> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = 0;
              });
            },
            child: Container(
              color: selectedIndex == 0 ? Colors.grey : Colors.transparent,
              height: 40,
              padding: EdgeInsets.all(8.0), // Adjust padding as needed
              child: Image.asset(
                "assets/minum.png",
                height: 25,
                width: 25,
              ),
            ),
          ),
        ),
        SizedBox(width: 10),
        Expanded(
          child: GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = 1;
              });
            },
            child: Container(
              color: selectedIndex == 1 ? Colors.grey : Colors.transparent,
              height: 40,
              padding: EdgeInsets.all(8.0), // Adjust padding as needed
              child: Image.asset(
                "assets/makan.png",
                height: 25,
                width: 25,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
