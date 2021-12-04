import 'package:flutter/material.dart';

class RigsterButton extends StatelessWidget {
  const RigsterButton(
      {Key? key,
      this.scure = false,
      required this.onClick,
      required this.onEmpty,
      required this.titlle,
      required this.icon,
      this.bord = TextInputType.emailAddress})
      : super(key: key);
  final Icon icon;

  final String titlle;
  final TextInputType bord;
  final void Function(String)? onClick;
  final String? Function(String?) onEmpty;
  final bool scure;

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
