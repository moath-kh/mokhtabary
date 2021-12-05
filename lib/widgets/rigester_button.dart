import 'package:flutter/material.dart';

// ignore: must_be_immutable
class RigsterButton extends StatelessWidget {
  RigsterButton(
      {Key? key,
      this.scure = false,
      required this.onClick,
      required this.onEmpty,
      required this.titlle,
      required this.icon,
      this.sicon,
      this.suFF,
      this.bord = TextInputType.emailAddress})
      : super(key: key);
  final Icon icon;
  final String titlle;
  final TextInputType bord;
  final void Function(String)? onClick;
  final String? Function(String?) onEmpty;
  final bool scure;
  final IconData? sicon;
  void Function()? suFF;

  get v => null;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: TextFormField(
        onFieldSubmitted: (value) {
          // ignore: avoid_print
          print(value);
        },
        validator: onEmpty,
        keyboardType: bord,
        obscureText: scure,
        onChanged: onClick,
        decoration: InputDecoration(
          prefixIcon: icon,
          suffixIcon: IconButton(
            onPressed: suFF,
            icon: Icon(sicon),
          ),
          hintText: titlle,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(4.0))),
          enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(4.0)),
              borderSide: BorderSide(color: Colors.orange, width: 1)),
          focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(4.0)),
              borderSide: BorderSide(color: Colors.blue, width: 2)),
        ),
      ),
    );
  }
}
