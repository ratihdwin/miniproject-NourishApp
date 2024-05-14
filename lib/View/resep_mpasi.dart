import 'package:flutter/material.dart';
import 'package:NourishApp/Service/resep_service.dart';
import 'package:NourishApp/View/lanjutan_resep.dart';

class ResepMPASI extends StatefulWidget {
  const ResepMPASI({super.key});

  @override
  State<ResepMPASI> createState() => _ResepMPASIState();
}

class _ResepMPASIState extends State<ResepMPASI> {
  List resepList = [];

  int currentIndex = 0;
  final List<String> menuList = [
    "Breakfast",
    "Lunch",
    "Dinner",
    "Snack",
    "Cheat",
  ];

  @override
  void initState() {
    super.initState();
    getAllData().then((_) {
      setState(() {});
    });
  }

  Future<void> getAllData() async {
    final List dataListResep = await getResep();
    resepList = dataListResep;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: ListView(
            children: [
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.close,
                      color: Colors.black,
                      size: 32,
                    ),
                  ),
                  const Spacer(),
                  const Text(
                    "Resep MPASI",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 24,
                    ),
                  ),
                  const Spacer(),
                  const Icon(
                    Icons.close,
                    color: Colors.white,
                    size: 32,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: menuList.map((e) {
                    int index = menuList.indexOf(e);
                    return InkWell(
                      onTap: () {
                        setState(() {
                          currentIndex = index;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: currentIndex == index
                              ? const Color.fromARGB(255, 0, 215, 185)
                              : Colors.white,
                        ),
                        child: Text(
                          e,
                          style: TextStyle(
                            fontSize: 18,
                            color: currentIndex == index
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(height: 20),
              ...resepList
                  .where((e) => e.type == menuList[currentIndex])
                  .map((e) {
                return resepCard(e);
              }),
            ],
          ),
        ),
      ),
    );
  }

  Widget resepCard(e) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => LanjutanResep(
              dataResep: e,
            ),
          ),
        );
      },
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 225,
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                e.image,
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                height: 75,
                width: MediaQuery.of(context).size.width - 60,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 250, 250, 250),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          e.title,
                          maxLines: 1,
                          style: const TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        const Spacer(),
                        const Icon(Icons.watch_later_outlined),
                        Text(e.time)
                      ],
                    ),
                    FittedBox(
                      child: Text(
                        "${e.bahan[0]} | ${e.bahan[1]} | etc",
                        maxLines: 1,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              top: 10,
              right: 10,
              child: Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: Colors.white60,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(
                  Icons.bookmark_border,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
