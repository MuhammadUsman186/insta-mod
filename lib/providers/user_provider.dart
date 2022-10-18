import 'package:flutter/material.dart';
import 'package:instagram_mod/models/user.dart';
import 'package:instagram_mod/resources/auth_method.dart';

class UserProvider with ChangeNotifier {
  final AuthMethods _authMethods = AuthMethods();
  User? _user;
  User? get getUser => _user;

  Future<void> refershUser() async {
    User user = await _authMethods.getUserDetails();
    _user = user;
    notifyListeners();
  }
}
