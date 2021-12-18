import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mokhtabary/views/controller/auth.dart';
import 'package:provider/provider.dart';

class Lappp extends StatefulWidget {
  static const String screenRoute = 'lappp';
  const Lappp({Key? key}) : super(key: key);

  @override
  State<Lappp> createState() => _LapppState();
}

class _LapppState extends State<Lappp> {
  @override
  Widget build(BuildContext context) {
    final rules = Provider.of<AuthState>(context).auth['rules'];

if(rules == 'admin'){
  // get orders from firebase
}
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: ElevatedButton(
          child: const Text('Log Out'),
          onPressed: () async {
            await FirebaseAuth.instance.signOut();
          },
        ),
      )),
    );
  }
}
