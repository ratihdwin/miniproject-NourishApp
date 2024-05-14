import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:NourishApp/Model/resep_model.dart';

Future<List> getResep() async {
  final response = await http.get(Uri.parse(
    "https://firestore.googleapis.com/v1/projects/stunting-3484a/databases/(default)/documents/resep",
  ));

  if (response.statusCode == 200) {
    List listResep = [];
    final bodyResponse = jsonDecode(response.body)["documents"];

    if (bodyResponse != null) {
      bodyResponse.map((data) {
        final fields = data["fields"];

        listResep.add(
          Resep(
            title: fields["title"]["stringValue"],
            type: fields["type"]["stringValue"],
            time: fields["time"]["stringValue"],
            image: fields["image"]["stringValue"],
            bahan: fields["bahan"]["arrayValue"]["values"].map((e) {
              return e["stringValue"];
            }).toList(),
            langkah: fields["langkah"]["arrayValue"]["values"].map((e) {
              return e["stringValue"];
            }).toList(),
          ),
        );
      }).toList();
      return listResep;
    }
  }

  return [];
}
