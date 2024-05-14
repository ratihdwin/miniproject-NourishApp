import 'package:flutter/material.dart';

class StuntingBar extends StatelessWidget {
  final List<Widget> mainChild;
  const StuntingBar({required this.mainChild, super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 125,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(
                top: -160,
                left: -MediaQuery.of(context).size.width * 0.25,
                child: Image.asset(
                  "assets/ellipse1.png",
                  width: 447,
                  height: 339,
                ),
              ),
              Positioned(
                top: -130,
                left: MediaQuery.of(context).size.width * 0.5,
                child: Image.asset(
                  "assets/ellipse2.png",
                  width: 282,
                  height: 252,
                ),
              ),
              Positioned(
                left: MediaQuery.of(context).size.width * 0.1,
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hello",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      "Ratih Dwi Nurlitasari",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                right: MediaQuery.of(context).size.width * 0.1,
                child: Image.asset(
                  "assets/profile.png",
                  width: 50,
                  height: 50,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 30,
            right: 30,
            bottom: 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: mainChild,
          ),
        ),
      ],
    );
  }
}
