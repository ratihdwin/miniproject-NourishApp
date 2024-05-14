import 'package:flutter/material.dart';
import 'package:NourishApp/Shared/stunting_bar.dart';
import 'package:NourishApp/View/hasil_kualifikasi.dart';

class InputKualifikasi extends StatefulWidget {
  const InputKualifikasi({super.key});

  @override
  State<InputKualifikasi> createState() => _InputKualifikasiState();
}

class _InputKualifikasiState extends State<InputKualifikasi> {
  final TextEditingController umurController = TextEditingController();
  final TextEditingController tinggiController = TextEditingController();
  String? selectedOption;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StuntingBar(
        mainChild: [
          Image.asset(
            "assets/mengenai_stunting.png",
          ),
          const SizedBox(height: 30),
          ...customTextField(
            umurController,
            "Umur",
            "Masukkan Umur (Bulan)",
          ),
          const SizedBox(height: 10),
          ...customTextField(
            tinggiController,
            "Tinggi",
            "Masukkan Tinggi",
          ),
          const SizedBox(height: 10),
          const Text(
            "Jenis Kelamin",
            textAlign: TextAlign.start,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
            ),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey,
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(
                8.0,
              ),
            ),
            child: DropdownButton<String>(
              isExpanded: true,
              value: selectedOption,
              underline: const SizedBox(),
              hint: const Text("Masukkan Jenis Kelamin"),
              onChanged: (String? newValue) {
                setState(() {
                  selectedOption = newValue;
                });
              },
              items: <String>[
                'Laki - Laki',
                'Perempuan',
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          const SizedBox(height: 20),
          InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const HasilKualifikasi(),
                ),
              );
            },
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 0, 215, 185),
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.all(10),
              child: const Text(
                "Submit",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> customTextField(
      TextEditingController controller, String title, String hint) {
    return [
      Text(
        title,
        textAlign: TextAlign.start,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
      ),
      TextField(
        controller: controller,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 15,
          ),
          hintText: hint,
          hintStyle: const TextStyle(
            fontWeight: FontWeight.w400,
          ),
          border: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.grey,
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(
              8.0,
            ),
          ),
        ),
      ),
    ];
  }
}
