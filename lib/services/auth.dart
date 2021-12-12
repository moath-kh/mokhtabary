import 'package:firebase_auth/firebase_auth.dart';
import 'package:mokhtabary/models/user.dart';

class Autthservic {
  final FirebaseAuth _auth = FirebaseAuth.instance;
//creat user obj bassed on firebas
  Users _userFromFirebase(User user) {
    // ignore: unnecessary_null_comparison
    if (user == null) {
      // ignore: null_check_always_fails
      return null!;
    }
    return Users(uid: user.uid);
  }
/*
  Stream<User?> get muser {
    return _auth.authStateChanges().map(_userFromFirebase);
  }*/
  //auth cjange user stream

  //Rigster With Email password

  Future regsterwithemailpassowrd(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      return _userFromFirebase(user!);
    } catch (e) {
      // ignore: avoid_print
      print(e.toString());
      return null;
    }
  }

// Signin Anon
  // ignore: non_constant_identifier_names
  Future SigninAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      return _userFromFirebase(user!);
    } catch (e) {
      // ignore: avoid_print
      print(e.toString());
      return null;
    }
  }
}
