import 'package:NourishApp/Model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeBar extends StatefulWidget {
  final List<Widget> mainChildren;
  const HomeBar({
    required this.mainChildren,
    super.key,
  });

  @override
  State<HomeBar> createState() => _HomeBarState();
}

class _HomeBarState extends State<HomeBar> {
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ListView(
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
                            Provider.of<User>(context).userData['name'].toString(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Image.asset(
                        "assets/profile.png",
                        width: 50,
                        height: 50,
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
          padding: const EdgeInsets.only(
            left: 30,
            right: 30,
            bottom: 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: widget.mainChildren,
          ),
        ),
      ],
    );
  }
}
