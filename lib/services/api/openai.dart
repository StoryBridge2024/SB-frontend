import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart';
import '../../constants/prompt.dart';

class OpenAI {
  final String? apiKey = dotenv.env['OPENAI_APIKEY'];
  final String baseUrl = 'https://api.openai.com/v1/';

  Future<Response> createCompletion() async {
    final response = await post(
      Uri.parse('${baseUrl}chat/completions'),
      headers: {
        'Authorization': 'Bearer $apiKey',
        'Content-Type': 'application/json',
      },
      body: json.encode(textPrompt),
    );
    return response;
  }
}
