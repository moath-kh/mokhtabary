// ignore: unnecessary_import
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Mybuuton extends StatelessWidget {
  Mybuuton({
    Key? key,
    required this.tittle,
    required this.color,
    this.onPressed,
    this.buttonPressed,
  }) : super(key: key);
  final Color color;
  final String tittle;
  final VoidCallback? onPressed;
  bool? buttonPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 9),
      child: Material(
        color: color,
        borderRadius: BorderRadius.circular(20),
        elevation: 5,
        child: buttonPressed ?? false
            ? Container()
            : MaterialButton(
                onPressed: onPressed,
                disabledColor: Colors.red,
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
