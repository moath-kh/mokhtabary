import 'package:flutter/material.dart';
import 'package:mokhtabary/widgets/hello.dart';
import 'package:mokhtabary/widgets/my_button.dart';
import 'package:mokhtabary/widgets/rigester_button.dart';

class LoginScreen extends StatefulWidget {
  static const String screenRoute = 'LoginScreen';
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const HelloScreen(),
            RigsterButton(
              titlle: 'Enter youe Email',
              bord: TextInputType.emailAddress,
              icon: const Icon(Icons.email),
              onClick: (value) {},
            ),
            RigsterButton(
              titlle: 'Password',
              icon: const Icon(Icons.lock),
              bord: TextInputType.text,
              scure: true,
              onClick: (value) {},
            ),
            Mybuuton(
              tittle: 'Login',
              color: Colors.blue,
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
