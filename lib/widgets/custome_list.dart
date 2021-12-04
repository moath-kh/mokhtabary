import 'package:flutter/material.dart';

class CustomeTitle extends StatelessWidget {
  const CustomeTitle(
      {Key? key,
      required this.title,
      required this.icon,
      this.onClick,
      this.color = Colors.amber})
      : super(key: key);

  final String title;
  final IconData icon;
  final Color color;
  final void Function()? onClick;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onClick,
      title: Text(title),
      leading: Icon(
        icon,
        size: 30,
        color: color,
      ),
    );
  }
}
