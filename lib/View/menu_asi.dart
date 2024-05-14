import 'package:NourishApp/Shared/home_bar.dart';
import 'package:NourishApp/View/arikel.dart';
import 'package:flutter/material.dart';

class MenuASI extends StatefulWidget {
  const MenuASI({super.key});

  @override
  State<MenuASI> createState() => _MenuASIState();
}

class _MenuASIState extends State<MenuASI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomeBar(
        mainChildren: [
          const Text(
            "Menu ASI Ekslusif",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const ArtikelPage(
                          title: "Mengenal ASI",
                        ),
                      ),
                    );
                  },
                  child: Image.asset("assets/mengenal_asi.png"),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                flex: 1,
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const ArtikelPage(
                          title: "Memberi ASI",
                        ),
                      ),
                    );
                  },
                  child: Image.asset("assets/memberi_asi.png"),
                ),
              )
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
          reportCard(),
          const SizedBox(height: 20),
          const Text(
            "Mengenai Stunting",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          Image.asset("assets/mengenai_stunting.png")
        ],
      ),
    );
  }

  Widget reportCard() {
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
          const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Mengenai ASI Ekslusif",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                ),
              ),
              Text(
                "5 Files",
                style: TextStyle(
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
