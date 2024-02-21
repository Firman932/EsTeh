import 'package:flutter/material.dart';

class Filter extends StatefulWidget {
  const Filter({super.key});

  @override
  State<Filter> createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  int selectedIndex = 0;

  List<String> assetPaths = [
    "assets/minum_black.png",
    "assets/makan.png",
  ];

  List<String> selectedAssetPaths = [
    "assets/minum.png",
    "assets/makan_white.png",
  ];
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width*0.338;
    return Center(
      child: Wrap(
        direction: Axis.horizontal,
        spacing: 8.0,
        children: List.generate(
          assetPaths.length,
          (index) => buildFilterChip(index, screenWidth),
        ),
      ),
    );
  }

  Widget buildFilterChip(int index, double screenWidth) {
    return FilterChip(
      label: Container(
        height: 23,
        width: screenWidth,
        // Set the width as a fraction of the screen width
        child: Image.asset(
          index == selectedIndex
              ? selectedAssetPaths[index]
              : assetPaths[index],
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(
          color: index == selectedIndex
              ? Color.fromRGBO(73, 160, 19, 1)
              : Colors.white,
        ),
      ),
      backgroundColor: index == selectedIndex
          ? Color.fromRGBO(73, 160, 19, 1)
          : Colors.white,
      onSelected: (bool selected) {
        setState(() {
          selectedIndex = selected ? index : -1;
        });
      },
      shadowColor: Color.fromRGBO(156, 156, 156, 0.29),
      elevation: 5.0,
    );
  }
}
