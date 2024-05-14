import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:NourishApp/Model/berita_model.dart';

Future<List> getBerita() async {
  final response = await http.get(Uri.parse(
    "https://firestore.googleapis.com/v1/projects/stunting-3484a/databases/(default)/documents/berita",
  ));

  if (response.statusCode == 200) {
    List listBerita = [];
    final bodyResponse = jsonDecode(response.body)["documents"];

    if (bodyResponse != null) {
      bodyResponse.map((data) {
        final fields = data["fields"];

        listBerita.add(
          Berita(
            title: fields["title"]["stringValue"],
            image: fields["image"]["stringValue"],
            user: fields["user"]["stringValue"],
            date: fields["date"]["stringValue"],
          ),
        );
      }).toList();
      return listBerita;
    }
  }

  return [];
}
