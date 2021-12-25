// ignore: implementation_imports

import 'package:flutter/material.dart';

import 'package:mokhtabary/widgets/Drawer/drawer.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: ComponentDrawer());
  }
}
