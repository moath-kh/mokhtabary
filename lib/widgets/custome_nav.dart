import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class CustomNavigationbar extends StatelessWidget {
  const CustomNavigationbar(
      {Key? key, required this.index, required this.onClick})
      : super(key: key);
  final int index;
  final void Function(int) onClick;
  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      index: index,
      color: Colors.orange[900]!,
      backgroundColor: Colors.grey.shade50,
      items: const [
        Icon(Icons.home),
        Icon(Icons.menu),
      ],
      onTap: (value) {
        onClick(value);
      },
    );
  }
}
