import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:frontend/models/script_model.dart';
import 'package:http/http.dart';
import '../../constants/prompt.dart';

class OpenAI {
  final String? apiKey = dotenv.env['OPENAI_APIKEY'];
  final String baseUrl = 'https://api.openai.com/v1/';

  OpenAI._privateConstructor();

  static final OpenAI _instance = OpenAI._privateConstructor();

  factory OpenAI() {
    return _instance;
  }

  Future<ScriptModel> createCompletion() async {
    final response = await post(
      Uri.parse('${baseUrl}chat/completions'),
      headers: {
        'Authorization': 'Bearer $apiKey',
        'Content-Type': 'application/json',
      },
      body: json.encode(textPrompt),
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to load response');
    }
    ScriptModel scriptModel = ScriptModel.fromJson(json.decode(response.body));
    return scriptModel;
  }
}
