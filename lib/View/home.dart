import 'package:NourishApp/Model/user_model.dart';
import 'package:NourishApp/View/about.dart';
import 'package:NourishApp/View/account.dart';
import 'package:NourishApp/View/menu_asi.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/widgets.dart';
import 'package:NourishApp/View/gizi_seimbang.dart';
import 'package:NourishApp/View/input_kualifikasi.dart';
import 'package:NourishApp/View/mengenal_stunting.dart';
import 'package:NourishApp/View/menu_mpasi.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _featureIndex = 0;

  final List<Map<String, dynamic>> _features = [
    {
      'title': 'Mengenal Stunting',
      'icon': 'https://cdn-icons-png.flaticon.com/128/7757/7757737.png'
    },
    {
      'title': 'MPASI',
      'icon': 'https://cdn-icons-png.flaticon.com/128/4891/4891390.png'
    },
    {
      'title': 'Menu Gizi Seimbang',
      'icon': 'https://cdn-icons-png.flaticon.com/128/4807/4807695.png'
    },
    {
      'title': 'ASI Eksklusif',
      'icon': 'https://cdn-icons-png.flaticon.com/128/4478/4478097.png'
    },
  ];

  final List<String> _articleTitles = [
    'Definisi Mengenai Stunting',
    'Definisi Mengenai MPASI',
    'Penjelasan Menu Gizi Seimbang',
    'Penjelasan ASI Eksklusif',
  ];

  final List<Map<String, dynamic>> _news = [
    {
      'image':
          'https://pict-a.sindonews.net/dyn/850/pena/news/2022/02/25/15/696403/perangi-stunting-pangkas-obesitas-vmm.jpeg',
      'account': 'Kompas.com',
      'tagline': 'Berita Stunting indonesia',
      'date': 'Sept 9, 2023',
    },
    {
      'image':
          'https://jatengprov.go.id/wp-content/uploads/2022/12/IMG-20221213-WA0124.jpg',
      'account': 'Jawapos.com',
      'tagline': 'Sosialisasi gizi nasional',
      'date': 'Feb 21, 2024',
    },
    {
      'image':
          'https://mantrijeronkec.jogjakota.go.id/assets/instansi/mantrijeronkec/article/20220617112457.jpg',
      'account': 'Lintasnews.com',
      'tagline': 'Sosialisasi MPASI anak usia 6 bulan',
      'date': 'Mar 3, 2024',
    },
    {
      'image':
          'https://cdn.antaranews.com/cache/1200x800/2022/11/15/20221115_095843.jpg',
      'account': 'beritanasional.id',
      'tagline': 'Sosialisasi asi esklusif untuk ibu muda',
      'date': 'Apr 10, 2024',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final TextEditingController searchController = TextEditingController();
    return Scaffold(
        body: ListView(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 150,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(
                top: -55,
                left: 0,
                right: 0,
                child: Image.asset(
                  "assets/bar.png",
                ),
              ),
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 50,
                  ),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Hello",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            Provider.of<User>(context)
                                .userData['name']
                                .toString(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const AccountPage(),
                            ),
                          );
                        },
                        child: Image.asset(
                          "assets/profile.png",
                          width: 50,
                          height: 50,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 70,
                right: 0,
                left: 0,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 50,
                  ),
                  child: TextField(
                    controller: searchController,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.search),
                      suffixIcon:
                          const Icon(Icons.format_list_bulleted_rounded),
                      contentPadding: const EdgeInsets.all(10),
                      hintText: "Apa itu stunting",
                      hintStyle: const TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Colors.black54,
                      ),
                      fillColor: const Color.fromARGB(255, 245, 245, 245),
                      filled: true,
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.grey,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const InputKualifikasi(),
                      ),
                    );
                  },
                  child: Image.asset(
                    'assets/home1.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 10.0),
                const Text(
                  'Kenali Stunting dan Gizi Anak',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10.0),
                CarouselSlider(
                  items: _features.map((feature) {
                    return InkWell(
                      onTap: () {
                        // Handle onTap event here
                        if (feature['title'] == 'Mengenal Stunting') {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const MengenalStunting()),
                          );
                        } else if (feature['title'] == 'MPASI') {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const MenuMPASI()),
                          );
                        } else if (feature['title'] == 'Menu Gizi Seimbang') {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const GiziSeimbang()),
                          );
                        } else if (feature['title'] == 'ASI Eksklusif') {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const MenuASI()),
                          );
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 3.0),
                        child: Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                color: Colors.teal.shade100,
                                shape: BoxShape.circle,
                              ),
                              child: Image.network(
                                feature['icon'],
                                width: 60,
                                height: 60,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              feature['title'],
                              style: const TextStyle(fontSize: 11.0),
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                  options: CarouselOptions(
                    height: 120.0,
                    viewportFraction: 0.4,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _featureIndex = index;
                      });
                    },
                  ),
                ),
                const SizedBox(height: 10.0),
                const Text(
                  'Artikel Kesehatan',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10.0),
                CarouselSlider(
                  items: _articleTitles.map((articleTitle) {
                    return Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: 50.0,
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: Colors.teal.shade100,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  FittedBox(
                                    child: Text(
                                      articleTitle,
                                      style: const TextStyle(
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  const SizedBox(height: 5.0),
                                  const Text(
                                    'Replace with article summary',
                                    style: TextStyle(fontSize: 14.0),
                                  ),
                                ],
                              ),
                              Image.network(
                                'https://cdn-icons-png.flaticon.com/256/8662/8662427.png',
                                width: 100,
                                height: 150.0,
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                  options: CarouselOptions(
                    height: 200.0,
                    viewportFraction: 1.0,
                  ),
                ),
                const SizedBox(height: 10.0),
                const Text(
                  'Berita Terbaru',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10.0),
                CarouselSlider(
                  items: _news.map((news) {
                    return Container(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Image.network(
                            news['image'],
                            width: double.infinity,
                            height: 150.0,
                            fit: BoxFit.cover,
                          ),
                          const SizedBox(height: 10.0),
                          Text(
                            news['account'],
                            style: const TextStyle(
                                fontSize: 16.0, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            news['tagline'],
                            style: const TextStyle(fontSize: 14.0),
                          ),
                          Text(
                            news['date'],
                            style: const TextStyle(
                                fontSize: 12.0, color: Colors.grey),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                  options: CarouselOptions(
                    height: 500.0,
                    viewportFraction: 0.9,
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    ));
  }
}
