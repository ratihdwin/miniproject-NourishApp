import 'package:flutter/material.dart';
import 'package:NourishApp/Service/konsultasi_service.dart';
import 'package:NourishApp/Service/report_service.dart';
import 'package:NourishApp/Shared/home_bar.dart';
import 'package:NourishApp/Shared/konsultasi_card.dart';
import 'package:NourishApp/View/arikel.dart';
import 'package:NourishApp/View/resep_mpasi.dart';
import 'package:NourishApp/View/gpt_food.dart';

class MenuMPASI extends StatefulWidget {
  const MenuMPASI({super.key});

  @override
  State<MenuMPASI> createState() => _MenuMPASIState();
}

class _MenuMPASIState extends State<MenuMPASI> {
  List listKonsultasi = [];
  List listReport = [];

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
    final List dataListReport = await getReport();
    listReport = dataListReport;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomeBar(
        mainChildren: [
          const Text(
            "Menu MPASI",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const ArtikelPage(
                  title: "Mengenai MPASI",
                ),
              ));
            },
            child: Image.asset("assets/mpasi/mengenai.png"),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const ArtikelPage(
                        title: "Panduan MPASI",
                      ),
                    ));
                  },
                  child: Image.asset("assets/mpasi/panduan.png"),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                flex: 1,
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const ResepMPASI(),
                    ));
                  },
                  child: Image.asset("assets/mpasi/resep.png"),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                flex: 1,
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const GptFood(
                        title: "GPT BabyBites",
                      ),
                    ));
                  },
                  child: Image.asset("assets/mpasi/gpt.png"),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          const Text(
            "Latest Report",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          ...listReport.map((e) => reportCard(e)),
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

  Widget reportCard(e) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Colors.black,
        ),
      ),
      padding: const EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 70,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 49, 169, 194),
              borderRadius: BorderRadius.circular(
                16,
              ),
            ),
            child: Center(
              child: Image.asset(
                "assets/mpasi/report.png",
                width: 40,
                height: 40,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                e.title,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                ),
              ),
              Text(
                e.description,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                ),
              ),
            ],
          ),
          const Spacer(),
          const Icon(
            Icons.more_horiz,
            color: Colors.black,
          )
        ],
      ),
    );
  }
}
