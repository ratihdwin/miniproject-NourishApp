import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_nusanourish/features/stunting/stunting_page.dart'; // Import halaman StuntingView
import 'package:flutter_nusanourish/features/mpasi/mpasi_page.dart';
import 'package:flutter_nusanourish/features/gizi/gizi_page.dart';
import 'package:flutter_nusanourish/features/asi/asi_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _featureIndex = 0;

  final List<Map<String, dynamic>> _features = [
    {'title': 'Mengenal Stunting', 'icon': 'https://cdn-icons-png.flaticon.com/128/7757/7757737.png'},
    {'title': 'MPASI', 'icon': 'https://cdn-icons-png.flaticon.com/128/4891/4891390.png'},
    {'title': 'Menu Gizi Seimbang', 'icon': 'https://cdn-icons-png.flaticon.com/128/4807/4807695.png'},
    {'title': 'ASI Eksklusif', 'icon': 'https://cdn-icons-png.flaticon.com/128/4478/4478097.png'},
  ];

  final List<String> _articleTitles = [
    'Definisi Mengenai Stunting',
    'Definisi Mengenai MPASI',
    'Penjelasan Menu Gizi Seimbang',
    'Penjelasan ASI Eksklusif',
  ];

  final List<Map<String, dynamic>> _news = [
    {
      'image': 'https://pict-a.sindonews.net/dyn/850/pena/news/2022/02/25/15/696403/perangi-stunting-pangkas-obesitas-vmm.jpeg',
      'account': 'Kompas.com',
      'tagline': 'Berita Stunting indonesia',
      'date': 'Sept 9, 2023',
    },
    {
      'image': 'https://jatengprov.go.id/wp-content/uploads/2022/12/IMG-20221213-WA0124.jpg',
      'account': 'Jawapos.com',
      'tagline': 'Sosialisasi gizi nasional',
      'date': 'Feb 21, 2024',
    },
    {
      'image': 'https://mantrijeronkec.jogjakota.go.id/assets/instansi/mantrijeronkec/article/20220617112457.jpg',
      'account': 'Lintasnews.com',
      'tagline': 'Sosialisasi MPASI anak usia 6 bulan',
      'date': 'Mar 3, 2024',
    },
    {
      'image': 'https://cdn.antaranews.com/cache/1200x800/2022/11/15/20221115_095843.jpg',
      'account': 'beritanasional.id',
      'tagline': 'Sosialisasi asi esklusif untuk ibu muda',
      'date': 'Apr 10, 2024',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomePage'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 200,
              child: Image.asset(
                'images/home1.jpg',
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              'Kenali Stunting dan Gizi Anak',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.0),
            CarouselSlider(
              items: _features.map((feature) {
                return InkWell(
                  onTap: () {
                    // Handle onTap event here
                    if (feature['title'] == 'Mengenal Stunting') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => StuntingPage()),
                      );
                    } else if (feature['title'] == 'MPASI') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MpasiPage()),
                      );
                    } else if (feature['title'] == 'Menu Gizi Seimbang') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => GiziPage()),
                      );
                    } else if (feature['title'] == 'ASI Eksklusif') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AsiPage()),
                      );
                    }
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 3.0),
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(10.0),
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
                        SizedBox(height: 8),
                        Text(feature['title'], style: TextStyle(fontSize: 11.0)),
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
            SizedBox(height: 10.0),
            Text(
              'Artikel Kesehatan',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.0),
            CarouselSlider(
              items: _articleTitles.map((articleTitle) {
                return Container(
                  width: 450.0,
                  height: 50.0,
                  padding: EdgeInsets.all(16.0),
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
                              Text(
                                articleTitle,
                                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 5.0),
                              Text(
                                'Replace with article summary',
                                style: TextStyle(fontSize: 14.0),
                              ),
                            ],
                          ),
                          Image.network(
                            'https://cdn-icons-png.flaticon.com/256/8662/8662427.png',
                            width: 180.0,
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
            SizedBox(height: 10.0),
            Text(
              'Berita Terbaru',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.0),
            CarouselSlider(
              items: _news.map((news) {
                return Container(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Image.network(
                        news['image'],
                        width: double.infinity,
                        height: 150.0,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        news['account'],
                        style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        news['tagline'],
                        style: TextStyle(fontSize: 14.0),
                      ),
                      Text(
                        news['date'],
                        style: TextStyle(fontSize: 12.0, color: Colors.grey),
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
    );
  }
}
