import 'package:flutter/material.dart';
import 'package:lji/Admin/Stok/stok_produk.dart';

class SearchFilter extends StatefulWidget {
  final bool isChecklistMode;
  final Function(bool) onCheckAll;
  final VoidCallback onCancel;

  const SearchFilter(
      {Key? key,
      required this.isChecklistMode,
      required this.onCancel,
      required this.onCheckAll})
      : super(key: key);

  @override
  _SearchFilterState createState() => _SearchFilterState();
}

class _SearchFilterState extends State<SearchFilter> {
  bool isFilterChecked = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Color.fromRGBO(156, 156, 156, 0.28999999165534973),
                  offset: Offset(0, 0),
                  blurRadius: 55.5,
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Expanded(
                    child: widget.isChecklistMode
                        ? IconButton(
                            onPressed: widget.onCancel,
                            icon: Icon(Icons.close),
                          )
                        : TextField(
                            decoration: InputDecoration(
                              hintText: 'Search',
                              border: InputBorder.none,
                              icon: Icon(Icons.search),
                            ),
                          ),
                  ),
                ],
              ),
            ),
          ),
        ),
        widget.isChecklistMode
    ? Checkbox(
      activeColor: Color.fromRGBO(73, 160, 19, 1),
        value: isFilterChecked,
        onChanged: (value) {
          setState(() {
            isFilterChecked = value!;
          });
          widget.onCheckAll(value!);
        },
      )
    : IconButton(
        onPressed: () {},
        icon: Icon(Icons.filter_list_rounded),
      ),
      ],
    );
  }
}
