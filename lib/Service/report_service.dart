import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:NourishApp/Model/report_model.dart';

Future<List> getReport() async {
  final response = await http.get(Uri.parse(
      "https://firestore.googleapis.com/v1/projects/stunting-3484a/databases/(default)/documents/report"));

  if (response.statusCode == 200) {
    List listReport = [];
    final bodyResponse = jsonDecode(response.body)["documents"];

    if (bodyResponse != null) {
      bodyResponse.map((data) {
        final fields = data["fields"];

        listReport.add(Report(
          title: fields["title"]["stringValue"],
          description: fields["desc"]["stringValue"],
        ));
      }).toList();
      return listReport;
    }
  }

  return [];
}
