import 'package:flutter/material.dart';

class User extends ChangeNotifier {
  Map<String, String> userData = {
    'name': 'Anonymous', 
    'pass': ''};

  static String username = '';
  static String email = '';
  static String password = '';

  void updateUserData(Map<String, String> input) {
    userData = input;
    notifyListeners();
  }
}
