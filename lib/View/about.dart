import 'package:NourishApp/View/daftar_pustaka.dart';
import 'package:NourishApp/View/privacy_policy.dart';
import 'package:flutter/material.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: const Icon(
                  Icons.close,
                  size: 32,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "About",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 26,
                ),
              ),
              const SizedBox(height: 10),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const PustakaPage(),
                    ),
                  );
                },
                child: const Row(
                  children: [
                    Text(
                      "Daftar Pustaka",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                    Spacer(),
                    Icon(Icons.navigate_next),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const PrivacyPolicy(),
                    ),
                  );
                },
                child: const Row(
                  children: [
                    Text(
                      "Privacy Policy",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                    Spacer(),
                    Icon(Icons.navigate_next),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              const Row(
                children: [
                  Text(
                    "Licenses",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                  Spacer(),
                  Icon(Icons.navigate_next),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
