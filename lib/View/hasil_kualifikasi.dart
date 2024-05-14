import 'package:flutter/material.dart';
import 'package:NourishApp/Shared/stunting_bar.dart';

class HasilKualifikasi extends StatelessWidget {
  const HasilKualifikasi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StuntingBar(
        mainChild: [
          const Text(
            "Standar Tinggi Badan Menurut Umur (TB/U) Anak Laki-Laki 24-60 Bulan",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          Image.asset("assets/hasil_stunting.png"),
          const Text(
            "Hasil Kualifikasi",
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 0, 215, 185),
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.all(20),
            child: const Text(
              "Pendek",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
