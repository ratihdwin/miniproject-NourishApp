import 'package:flutter/material.dart';
import 'package:NourishApp/Service/artikel_service.dart';

class ArtikelPage extends StatefulWidget {
  final String title;
  const ArtikelPage({required this.title, super.key});

  @override
  State<ArtikelPage> createState() => _ArtikelPageState();
}

class _ArtikelPageState extends State<ArtikelPage> {
  bool isLoading = true;
  late String imageLink;
  late String articleDesc;

  @override
  void initState() {
    super.initState();
    getData().then((_) {
      setState(() {
        isLoading = false;
      });
    });
  }

  Future<void> getData() async {
    final articleData = await getArticle(widget.title);

    imageLink = articleData["image"];
    articleDesc = articleData["desc"];
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const SizedBox()
        : Scaffold(
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: ListView(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 325,
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              imageLink,
                              width: double.infinity,
                              height: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned(
                            top: 10,
                            left: 10,
                            child: InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Container(
                                padding: const EdgeInsets.all(6),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: const Icon(
                                  Icons.arrow_back,
                                  size: 26,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      widget.title,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      articleDesc,
                      textAlign: TextAlign.justify,
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
