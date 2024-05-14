// ignore_for_file: use_build_context_synchronously

import 'package:NourishApp/Service/recomendation_services.dart';
import 'package:NourishApp/View/gpt_result.dart';
import 'package:flutter/material.dart';

const List<String> jenisMakananBayi = <String>[
  'Buah-buahan',
  'Sayuran',
  'Biji-bijian',
];

class GptFood extends StatefulWidget {
  const GptFood({Key? key, required String title});

  @override
  State<GptFood> createState() => _GptFoodState();
}

class _GptFoodState extends State<GptFood> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _controller = TextEditingController();
  String nilaiJenisMakananBayi = jenisMakananBayi.first;
  bool isLoading = false;

  void _getRecommendations() async {
    setState(() {
      isLoading = true;
    });

    try {
      final result = await RecommendationService.getRecommendations(
        babyFoodType: nilaiJenisMakananBayi,
        babyAge: _controller.value.text,
      );

      if (mounted) {
        setState(() {
          isLoading = false;
        });

        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return ResultScreen(gptResponseData: result);
            },
          ),
        );
      }
    } catch (e) {
      const snackBar = SnackBar(
        content: Text('Gagal mengirim permintaan. Silakan coba lagi.'),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Rekomendasi Makanan Bayi",
        key: Key("rekomendasiMakananBayi"),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  'Pilih Jenis Makanan',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              DropdownButton<String>(
                value: nilaiJenisMakananBayi,
                onChanged: (String? value) {
                  setState(() {
                    nilaiJenisMakananBayi = value!;
                  });
                },
                items: jenisMakananBayi.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  'Masukkan Usia Bayi (bulan)',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              TextFormField(
                key: Key("usiaTextFromField"),
                keyboardType: TextInputType.number,
                controller: _controller,
                validator: (String? value) {
                  if (value == null || value.isEmpty || int.tryParse(value) == null) {
                    return 'Masukkan usia yang valid';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  hintText: 'Contoh: 6',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 50),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _getRecommendations();
                  }
                },
                child: Text('Dapatkan Rekomendasi'),
              ),
              SizedBox(height: 20),
              isLoading
                  ? Center(child: CircularProgressIndicator())
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }
}
