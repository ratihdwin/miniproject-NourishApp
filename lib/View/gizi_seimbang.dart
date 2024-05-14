import 'package:flutter/material.dart';
import 'package:NourishApp/Service/berita_service.dart';
import 'package:NourishApp/Service/konsultasi_service.dart';
import 'package:NourishApp/Shared/home_bar.dart';
import 'package:NourishApp/Shared/konsultasi_card.dart';
import 'package:NourishApp/View/arikel.dart';

class GiziSeimbang extends StatefulWidget {
  const GiziSeimbang({super.key});

  @override
  State<GiziSeimbang> createState() => _GiziSeimbangState();
}

class _GiziSeimbangState extends State<GiziSeimbang> {
  List listKonsultasi = [];
  List listBerita = [];

  @override
  void initState() {
    super.initState();
    getAllData().then((_) {
      setState(() {});
    });
  }

  Future<void> getAllData() async {
    final List dataListKonsultasi = await getKonsultasi();
    listKonsultasi = dataListKonsultasi;
    final List dataListBerita = await getBerita();
    listBerita = dataListBerita;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomeBar(
        mainChildren: [
          Row(
            children: [
              Expanded(
                flex: 1,
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const ArtikelPage(
                        title: "Menu Makan Ibu Menyusui",
                      ),
                    ));
                  },
                  child: Image.asset("assets/gizi/menyusui.png"),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                flex: 1,
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const ArtikelPage(
                        title: "Menu Makan Ibu Hamil",
                      ),
                    ));
                  },
                  child: Image.asset("assets/gizi/hamil.png"),
                ),
              ),
            ],
          ),
          const Text(
            "Menu Gizi Seimbang",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const ArtikelPage(
                  title: "Menu Makan Anak",
                ),
              ));
            },
            child: Image.asset("assets/mengenai_stunting.png"),
          ),
          const SizedBox(height: 10),
          const Text(
            "Berita Kesehatan",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(children: listBerita.map((e) => newsCard(e)).toList()),
          ),
          const SizedBox(height: 10),
          const Text(
            "Konsultasi Dokter",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          ...listKonsultasi.map((e) => const KonsultasiCard()),
        ],
      ),
    );
  }

  Widget newsCard(e) {
    return Container(
      width: 225,
      height: 250,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 250, 245, 245),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 6,
            child: Image.network(
              e.image,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            flex: 4,
            child: Column(
              children: [
                Text(
                  e.title,
                  maxLines: 2,
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Image.asset(
                      "assets/profile.png",
                      width: 30,
                      height: 30,
                    ),
                    const SizedBox(width: 10),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          e.user,
                          style: const TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 1,
                        ),
                        Text(
                          e.date,
                          style: const TextStyle(
                            fontSize: 8,
                            fontWeight: FontWeight.w300,
                          ),
                          maxLines: 1,
                        )
                      ],
                    ),
                    const Spacer(),
                    const Icon(
                      Icons.share,
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
