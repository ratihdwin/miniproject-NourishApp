import 'package:NourishApp/Model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:NourishApp/View/login.dart';
import 'package:NourishApp/View/onboarding/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => User(),
        child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'StuntingCare',
          home: LoginPage(),
        ));
  }
}
