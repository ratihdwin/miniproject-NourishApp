import 'dart:convert';
import 'package:http/http.dart' as http;

Future<bool> loginCheck(String username, String password) async {
  final response = await http.get(
    Uri.parse(
      "https://firestore.googleapis.com/v1/projects/stunting-3484a/databases/(default)/documents/user",
    ),
  );

  if (response.statusCode == 200) {
    final bodyResponse = jsonDecode(response.body)["documents"];

    if (bodyResponse != null) {
      bool correctAuth = false;
      bodyResponse.map((data) {
        final fields = data["fields"];

        if (fields["username"]["stringValue"] == username &&
            fields["password"]["stringValue"] == password) {
          correctAuth = true;
        }
      }).toList();

      return correctAuth;
    }
  }
  return false;
}
