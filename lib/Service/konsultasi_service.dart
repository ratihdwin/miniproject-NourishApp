import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:NourishApp/Model/konsultasi_model.dart';

Future<List> getKonsultasi() async {
  final response = await http.get(Uri.parse(
      "https://firestore.googleapis.com/v1/projects/stunting-3484a/databases/(default)/documents/konsultasi"));

  if (response.statusCode == 200) {
    List listKonsultasi = [];
    final bodyResponse = jsonDecode(response.body)["documents"];

    if (bodyResponse != null) {
      bodyResponse.map((data) {
        final fields = data["fields"];

        listKonsultasi.add(
          Konsultasi(
            date: fields["date"]["stringValue"],
            month: fields["month"]["stringValue"],
            time: fields["time"]["stringValue"],
            doctor: fields["doctor"]["stringValue"],
            question: fields["question"]["stringValue"],
          ),
        );
      }).toList();
      return listKonsultasi;
    }
  }

  return [];
}
