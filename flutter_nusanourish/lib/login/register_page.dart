// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool _agreedToTerms = false;

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
              'Create your account',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.0),
            TextField(
              decoration: InputDecoration(
                labelText: 'Username',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
            ),
            SizedBox(height: 20.0),
            TextField(
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
            ),
            SizedBox(height: 20.0),
            TextField(
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
              children: [
                Checkbox(
                  value: _agreedToTerms,
                  onChanged: (value) {
                    setState(() {
                      _agreedToTerms = value!;
                    });
                  },
                ),
                Text('Agree to terms and conditions'),
              ],
            ),
            SizedBox(height: 20.0),
            Center(
              child: ElevatedButton(
                onPressed: _agreedToTerms ? () {} : null, // Disable button if terms not agreed
                child: Text('REGISTER'),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith<Color>(
                    (Set<MaterialState> states) {
                      if (states.contains(MaterialState.disabled)) {
                        return Colors.teal.shade100; // Disabled color
                      }
                      return Colors.teal; // Enabled color
                    },
                  ),
                  minimumSize: MaterialStateProperty.all<Size>(Size(double.infinity, 50.0)),
                ),
              ),
            ),
            SizedBox(height: 10.0),
            Center(
              child: TextButton(
                child: Text('Already have an account? Login'),
                onPressed: () {
                  // Handle navigation to login page
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
