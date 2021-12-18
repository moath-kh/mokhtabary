import 'package:flutter/foundation.dart';

class AuthState extends ChangeNotifier {
  Map<String, dynamic> auth = {};

  updateUser(user) {
    // ignore: avoid_print
    print(user);
    auth = user;
    notifyListeners();
  }
}
