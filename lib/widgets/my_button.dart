import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Mybuuton extends StatelessWidget {
  const Mybuuton(
      {Key? key,
      required this.tittle,
      required this.color,
      required this.onPressed})
      : super(key: key);
  final Color color;
  final String tittle;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 9),
      child: Material(
        color: color,
        borderRadius: BorderRadius.circular(20),
        elevation: 5,
        child: MaterialButton(
          onPressed: onPressed,
          height: 5,
          minWidth: 150,
          child: Text(tittle,
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 25)),
        ),
      ),
    );
  }
}
