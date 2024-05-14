import 'dart:convert';
import 'package:http/http.dart' as http;

getArticle(String title) async {
  final response = await http.get(
    Uri.parse(
      "https://firestore.googleapis.com/v1/projects/stunting-3484a/databases/(default)/documents/article/$title",
    ),
  );

  if (response.statusCode == 200) {
    final bodyResponse = jsonDecode(response.body)["fields"];
    return {
      "desc": bodyResponse["desc"]["stringValue"],
      "image": bodyResponse["image"]["stringValue"]
    };
  }
}
