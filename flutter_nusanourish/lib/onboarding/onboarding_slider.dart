import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'onboarding_page.dart';
import 'package:flutter_nusanourish/login/login_page.dart'; // Import halaman login
import 'package:flutter_nusanourish/login/register_page.dart'; // Import halaman registrasi

class OnboardingSlider extends StatefulWidget {
  @override
  _OnboardingSliderState createState() => _OnboardingSliderState();
}

class _OnboardingSliderState extends State<OnboardingSlider> {
  int _currentIndex = 0;

  final List<OnboardingPage> _pages = [
    OnboardingPage(
      imageUrl: 'https://cdn-icons-png.flaticon.com/256/8662/8662332.png',
      title: 'Title 1',
      description: 'Description 1',
    ),
    OnboardingPage(
      imageUrl: 'https://cdn-icons-png.flaticon.com/256/8662/8662351.png',
      title: 'Title 2',
      description: 'Description 2',
    ),
    OnboardingPage(
      imageUrl: 'https://cdn-icons-png.flaticon.com/256/8662/8662464.png',
      title: 'Title 3',
      description: 'Description 3',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Column(
              children: [
                Expanded(
                  child: CarouselSlider(
                    items: _pages,
                    options: CarouselOptions(
                      height: double.infinity,
                      viewportFraction: 1,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _currentIndex = index;
                        });
                      },
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: _pages.asMap().entries.map((entry) {
                      return GestureDetector(
                        onTap: () => setState(() {
                          _currentIndex = entry.key;
                        }),
                        child: Container(
                          width: 12,
                          height: 12,
                          margin: EdgeInsets.symmetric(vertical: 8, horizontal: 4),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle, // Set the shape to circle
                            color: _currentIndex == entry.key ? Colors.green[700]! : Colors.grey.shade400,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
          ButtonTheme(
            minWidth: 50.0,
            height: 20.0,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()), // Arahkan ke halaman login
                  );
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.green[700]!,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text('Login'),
              ),
            ),
          ),
          ButtonTheme(
            minWidth: 50.0,
            height: 20.0,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegisterPage()), // Arahkan ke halaman registrasi
                  );
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.green[700]!,
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text('Register'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
