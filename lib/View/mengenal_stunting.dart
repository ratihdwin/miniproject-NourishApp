import 'package:flutter/material.dart';
import 'package:NourishApp/Service/konsultasi_service.dart';
import 'package:NourishApp/Shared/home_bar.dart';
import 'package:NourishApp/Shared/konsultasi_card.dart';
import 'package:NourishApp/View/arikel.dart';

class MengenalStunting extends StatefulWidget {
  const MengenalStunting({super.key});

  @override
  State<MengenalStunting> createState() => MengenalStuntingState();
}

class MengenalStuntingState extends State<MengenalStunting> {
  List listKonsultasi = [];

  @override
  void initState() {
    super.initState();
    getKonsultasiData().then((_) {
      setState(() {});
    });
  }

  Future<void> getKonsultasiData() async {
    final List dataListKonsultasi = await getKonsultasi();
    listKonsultasi = dataListKonsultasi;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomeBar(
        mainChildren: [
          const Text(
            "Mengenal Stunting",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          Row(
            children: [
              Column(
                children: [
                  cardMenu(
                    "Definisi Stunting",
                    "definisi",
                    () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const ArtikelPage(
                          title: "Definisi Stunting",
                        ),
                      ));
                    },
                  ),
                  cardMenu(
                    "Pengobatan",
                    "pengobatan",
                    () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const ArtikelPage(
                          title: "Pengobatan Stunting",
                        ),
                      ));
                    },
                  ),
                ],
              ),
              const Spacer(),
              Column(
                children: [
                  cardMenu(
                    "Ciri - Ciri Stunting",
                    "ciri",
                    () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const ArtikelPage(
                          title: "Ciri - Ciri Stunting",
                        ),
                      ));
                    },
                  ),
                  cardMenu(
                    "Pencegahan",
                    "pencegahan",
                    () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const ArtikelPage(
                          title: "Pencegahan Stunting",
                        ),
                      ));
                    },
                  ),
                ],
              ),
              const Spacer(),
              Column(
                children: [
                  cardMenu(
                    "Penyebab Stunting",
                    "penyebab",
                    () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const ArtikelPage(
                          title: "Penyebab Stunting",
                        ),
                      ));
                    },
                  ),
                  cardMenu(
                    "Konsultasi",
                    "konsultasi",
                    () {},
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
          const Text(
            "Upcoming Appointments",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          Image.asset("assets/mengenai_stunting.png"),
          const SizedBox(height: 20),
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

  Widget cardMenu(
    String title,
    String imageName,
    void Function() onTapFunction,
  ) {
    return InkWell(
      onTap: onTapFunction,
      child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Column(
          children: [
            Image.asset(
              "assets/stunting/$imageName.png",
              width: 70,
              height: 70,
            ),
            FittedBox(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
