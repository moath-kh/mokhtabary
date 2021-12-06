import 'package:flutter/material.dart';

class EdittScreen extends StatefulWidget {
  const EdittScreen({Key? key}) : super(key: key);

  @override
  _EdittScreenState createState() => _EdittScreenState();
}

class _EdittScreenState extends State<EdittScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Center(child: Text('Editt Screen')),
      ),
    );
  }
}
