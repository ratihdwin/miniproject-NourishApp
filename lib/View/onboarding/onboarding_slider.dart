// ignore_for_file: prefer_const_constructors

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:NourishApp/View/login.dart';
import 'package:NourishApp/View/register.dart';
import 'onboarding_page.dart';

class OnboardingSlider extends StatefulWidget {
  const OnboardingSlider({Key? key}) : super(key: key);

  @override
  State<OnboardingSlider> createState() => _OnboardingSliderState();
}

class _OnboardingSliderState extends State<OnboardingSlider> {
  int _currentIndex = 0;

  final List<OnboardingPage> _pages = [
    OnboardingPage(
      imageUrl: 'https://cdn-icons-png.flaticon.com/256/8662/8662332.png',
      title: 'Pahami Stunting',
      description: 'Pelajari tentang stunting dan pengaruhnya terhadap pertumbuhan anak.',
    ),
    OnboardingPage(
      imageUrl: 'https://cdn-icons-png.flaticon.com/256/8662/8662351.png',
      title: 'Gizi Seimbang',
      description: 'Kenali pentingnya gizi seimbang untuk mencegah stunting pada anak.',
    ),
    OnboardingPage(
      imageUrl: 'https://cdn-icons-png.flaticon.com/256/8662/8662464.png',
      title: 'Cara Penanganan',
      description: 'Temukan cara penanganan stunting dan langkah-langkah pencegahannya.',
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
                      autoPlay: true, // Make it autoplay
                      autoPlayInterval: Duration(seconds: 3), // Set interval
                      autoPlayAnimationDuration: Duration(milliseconds: 800), // Animation duration
                      autoPlayCurve: Curves.fastOutSlowIn, // Animation curve
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(24),
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
                          margin: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 4),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle, // Set the shape to circle
                            color: _currentIndex == entry.key
                                ? Colors.green[700]!
                                : Colors.grey.shade400,
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
              margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginPage(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.green[700]!,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text('Login'),
              ),
            ),
          ),
          ButtonTheme(
            minWidth: 50.0,
            height: 20.0,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const RegisterPage(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.green[700]!,
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text('Register'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
