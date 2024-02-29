import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Color.fromRGBO(156, 156, 156, 0.28999999165534973),
                offset: Offset(0, 0),
                blurRadius: 55.5)
          ] // Ganti warna sesuai kebutuhan
          ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        child: TextField(
          style: TextStyle(fontSize: 14),
          decoration: InputDecoration(
            hintText: 'Search',
            hintStyle: TextStyle(fontSize: 14),
            border: InputBorder.none,
            icon: Icon(Icons.search),
          ),
        ),
      ),
    );
  }
}
