import 'dart:convert';
import 'package:http/http.dart' as http;

Future<bool> registerCheck(
  String username,
  String password,
  String email,
) async {
  if (await usernameCheck(username)) {
    print("a");
    final response = await http.post(
      Uri.parse(
        "https://firestore.googleapis.com/v1/projects/stunting-3484a/databases/(default)/documents/user",
      ),
      body: jsonEncode({
        "fields": {
          "username": {"stringValue": username},
          "password": {"stringValue": password},
          "email": {"stringValue": email},
        }
      }),
    );

    if (response.statusCode == 200) {
      return true;
    }
    return false;
  } else {
    return false;
  }
}

Future<bool> usernameCheck(String username) async {
  final response = await http.get(
    Uri.parse(
      "https://firestore.googleapis.com/v1/projects/stunting-3484a/databases/(default)/documents/user",
    ),
  );

  if (response.statusCode == 200) {
    final bodyResponse = jsonDecode(response.body)["documents"];

    if (bodyResponse != null) {
      bool availableName = true;
      bodyResponse.map((data) {
        final fields = data["fields"];

        if (fields["username"]["stringValue"] == username) {
          availableName = false;
        }
      }).toList();

      return availableName;
    }
  }
  return false;
}
