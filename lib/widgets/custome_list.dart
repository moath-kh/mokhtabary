import 'package:flutter/material.dart';

class CustomeTitle extends StatelessWidget {
  const CustomeTitle({Key? key, required this.title, required this.icon})
      : super(key: key);

  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {},
      title: Text(title),
      leading: Icon(
        icon,
        size: 30,
        color: Colors.amber[600],
      ),
    );
  }
}
