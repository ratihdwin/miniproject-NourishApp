import 'package:flutter/material.dart';

class PustakaPage extends StatelessWidget {
  const PustakaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Icon(Icons.arrow_back),
                ),
                const Text(
                  "Daftar Pustaka",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 26,
                  ),
                ),
                const Text(
                  'https://www.alodokter.com/stunting#:~:text=Penanganan%20stunting%20dapat%20meliputi%20pengobatan%20penyakit%20penyebabnya%2C%20perbaikan,misalnya%20memberikan%20obat-obatan%20antituberkulosis%20bila%20anak%20menderita%20TBC',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w300,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
