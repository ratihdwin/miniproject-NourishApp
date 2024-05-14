import 'package:flutter/material.dart';

class KonsultasiCard extends StatelessWidget {
  const KonsultasiCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 125,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 55, 123, 138),
        borderRadius: BorderRadius.circular(
          16,
        ),
      ),
      padding: const EdgeInsets.all(15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 100,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 49, 169, 194),
              borderRadius: BorderRadius.circular(
                16,
              ),
            ),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "11",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Apr",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 5),
          const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "09.30 AM",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              Text(
                "Dr. Bambang P.",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Stunting itu apasih dok?",
                style: TextStyle(
                  color: Colors.white,
                ),
              )
            ],
          ),
          const Spacer(),
          const Icon(
            Icons.more_horiz,
            color: Colors.white,
          )
        ],
      ),
    );
  }
}
