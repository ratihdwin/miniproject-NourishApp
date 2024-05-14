import 'dart:convert';

import 'package:NourishApp/env/constants/open_ai.dart';
import 'package:NourishApp/Model/gpt/open_ai.dart';
import 'package:NourishApp/Model/gpt/usege.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

class RecommendationService {
  static Future<GptData> getRecommendations({
  required String babyFoodType,
  required String babyAge,
}) async {
  late GptData gptData = GptData(
    id: "",
    object: "",
    created: 0,
    model: "",
    choices: [],
    usage: Usage(completionTokens: 0, promptTokens: 0, totalTokens: 0),
  );

  try {
    var url = Uri.parse('https://api.openai.com/v1/chat/completions');

    Map<String, String> headers = {
      'Content-Type': 'application/json;charset=UTF-8',
      'Charset': 'utf-8',
      'Authorization': 'Bearer $apiKey',
    };

    final formatAge = NumberFormat.decimalPattern('id_ID');
    String formattedAge = formatAge.format(int.parse(babyAge));

    final data = jsonEncode(
      {
        "model": "gpt-3.5-turbo",
        "messages": [
          {"role": "system", "content": "Anda adalah ahli makanan bayi."},
          {"role": "system", "content": "Tolong berikan saya rekomendasi makanan bayi yang cocok untuk bayi berusia $formattedAge bulan, dengan fokus pada $babyFoodType."},
        ],
        "max_tokens": 300,
      },
    );

    var response = await http.post(url, headers: headers, body: data);
    if (response.statusCode == 200) {
      gptData = gptDataFromJson(response.body);
    }
  } catch (e) {
    throw Exception('Terjadi kesalahan saat mengirim permintaan.');
  }

  return gptData;
}

}