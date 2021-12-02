import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mokhtabary/views/patient_screen.dart';
import 'package:mokhtabary/widgets/hello.dart';
import 'package:mokhtabary/widgets/my_button.dart';
import 'package:mokhtabary/widgets/rigester_button.dart';

class Rigsteraition extends StatefulWidget {
  static const String screenRoute = 'rigsterscreen';
  const Rigsteraition({Key? key}) : super(key: key);

  @override
  _RigsteraitionState createState() => _RigsteraitionState();
}

class _RigsteraitionState extends State<Rigsteraition> {
  final _auth = FirebaseAuth.instance;
  late String email;
  late String password;
  late String phone;

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
            const SizedBox(
              height: 10,
            ),
            RigsterButton(
              titlle: 'Enter your Email',
              icon: const Icon(Icons.email),
              onClick: (value) {
                email = value;
              },
            ),
            RigsterButton(
              titlle: 'Number Phone',
              icon: const Icon(
                Icons.phone,
              ),
              bord: TextInputType.phone,
              onClick: (value) {
                phone = value;
              },
            ),
            RigsterButton(
              bord: TextInputType.text,
              titlle: 'Enter your Password',
              icon: const Icon(Icons.lock),
              scure: true,
              onClick: (value) {
                password = value;
              },
            ),
            Mybuuton(
              tittle: 'Rigster',
              color: Colors.blue,
              onPressed: () async {
                try {
                  final newUSer = await _auth.createUserWithEmailAndPassword(
                    email: email,
                    password: password,
                  );
                  Navigator.pushNamed(context, PatientSCreen.screenRoute);
                } catch (e) {
                  print(e);
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
/*
            onClick: (value) {
              email = value;
            },
            
            onClick: (value) {
              phone = value;
            },
             onClick: (value) {
              password = value;
            },


             print(email);
              print(phone);
              print(password);
            
            */ 