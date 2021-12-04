import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mokhtabary/views/patient_screen.dart';
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
  final _auth = FirebaseAuth.instance;
  late String email;
  late String password;

  var formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Form(
          key: formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const HelloScreen(),
              RigsterButton(
                titlle: 'Enter youe Email',
                bord: TextInputType.emailAddress,
                icon: const Icon(Icons.email),
                onEmpty: (value) {
                  if (value!.isEmpty) {
                    return 'Please Enter Your Email';
                  }
                  return null;
                },
                onClick: (value) {
                  email = value;
                },
              ),
              RigsterButton(
                titlle: 'Password',
                icon: const Icon(Icons.lock),
                bord: TextInputType.visiblePassword,
                scure: true,
                onEmpty: (value) {
                  if (value!.isEmpty) {
                    return 'Please Enter Password';
                  }
                  return null;
                },
                onClick: (value) {
                  password = value;
                },
              ),
              Mybuuton(
                tittle: 'Login',
                color: Colors.blue,
                onPressed: () async {
                  if (formkey.currentState!.validate()) {
                    try {
                      final user = _auth.signInWithEmailAndPassword(
                          email: email, password: password);
                      // ignore: unnecessary_null_comparison
                      if (user != null) {
                        Navigator.pushReplacementNamed(
                            context, PatientSCreen.screenRoute);
                      }
                    } catch (e) {
                      // ignore: avoid_print
                      print(e);
                    }
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
