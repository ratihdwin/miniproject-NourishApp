// ignore_for_file: prefer_const_constructors

import 'package:NourishApp/Model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:NourishApp/Service/login_service.dart';
import 'package:NourishApp/View/home.dart';
import 'package:NourishApp/View/register.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _rememberMe = false;
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  Future<bool> onTryLogin() async {
    final response =
        await loginCheck(_usernameController.text, _passwordController.text);
    return response;
  }

  @override
  Widget build(BuildContext context) {
    final userMapData = {
      'name':'',
      'pass':''
    };
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text(
          "Nourish App",
          key: Key("titleNourishApp"),
        ),
        backgroundColor: Colors.teal,
      ),
      body: Container(
        padding: const EdgeInsets.fromLTRB(20.0, 100.0, 20.0, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              'Welcome Back',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10.0),
            const Text(
              'Welcome back! Please log in to continue.',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 16.0,
              ),
            ),
            const SizedBox(height: 20.0),
            TextField(
              controller: _usernameController,
              key: Key("usernameTextField"),
              decoration: InputDecoration(
                labelText: 'Username',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            TextField(
              controller: _passwordController,
              obscureText: true,
              key: Key("passwordTextField"),
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
            ),
            const SizedBox(height: 10.0),
            Row(
              children: <Widget>[
                Checkbox(
                  value: _rememberMe,
                  onChanged: (value) {
                    setState(() {
                      _rememberMe = value!;
                    });
                  },
                ),
                const Text('Keep Sign In'),
                const Spacer(),
                TextButton(
                  child: const Text('Forgot Password?'),
                  onPressed: () {},
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            Center(
              child: ElevatedButton(
                key: const Key("signinButton"),
                onPressed: () {
                  if (_usernameController.text.isEmpty ||
                      _passwordController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Please fill in all fields'),
                      ),
                    );
                    return;
                  }
                  onTryLogin().then((value) {
                    if (value) {
                      userMapData['name'] = _usernameController.text.toString();
                      userMapData['pass'] = _passwordController.text.toString();
                      Provider.of<User>(context, listen: false)
                          .updateUserData(userMapData);
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) {
                            return const HomePage();
                          },
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Invalid username or password'),
                        ),
                      );
                    }
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  minimumSize: const Size(double.infinity, 50.0),
                ),
                child: const Text('SIGN IN'),
              ),
            ),
            const SizedBox(height: 10.0),
            Center(
              child: TextButton(
                child: const Text('Don\'t have an account? Sign Up'),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return const RegisterPage();
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
