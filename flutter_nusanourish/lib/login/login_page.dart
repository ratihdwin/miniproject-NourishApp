import 'package:flutter/material.dart';
import 'package:flutter_nusanourish/homescreen/home_page.dart'; // Import home_page.dart

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nourish App',
      initialRoute: '/', // Route awal aplikasi
      routes: {
        '/': (context) => LoginPage(), // Rute awal aplikasi
        '/homescreen/home_page': (context) => HomePage(), // Rute home_page.dart di dalam folder homescreen
      },
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _rememberMe = false;
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nourish App'),
        backgroundColor: Colors.teal, // Assuming the teal color from the image
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(20.0, 100.0, 20.0, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Welcome Back',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 16.0,
              ),
            ),
            SizedBox(height: 20.0),
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: 'Username',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
            ),
            SizedBox(height: 20.0),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
            ),
            SizedBox(height: 10.0),
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
                Text('Keep Sign In'),
                Spacer(),
                TextButton(
                  child: Text('Forgot Password?'),
                  onPressed: () {
                    // Handle forgot password functionality
                  },
                ),
              ],
            ),
            SizedBox(height: 20.0),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // **Login Button Functionality**
                  if (_usernameController.text == 'ratih' &&
                      _passwordController.text == 'ratih123') {
                    // Valid credentials, navigate to home page
                    Navigator.pushReplacementNamed(context, '/homescreen/home_page');
                  } else {
                    // Invalid credentials, show an error message
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Invalid username or password'),
                      ),
                    );
                  }
                },
                child: Text('SIGN IN'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal, // Assuming the teal color from the image
                  minimumSize: Size(double.infinity, 50.0),
                ),
              ),
            ),
            SizedBox(height: 10.0),
            Center(
              child: TextButton(
                child: Text('Don\'t have an account? Sign Up'),
                onPressed: () {
                  // Handle sign up navigation
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

