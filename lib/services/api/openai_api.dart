import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:frontend/models/script_model.dart';
import 'package:http/http.dart';
import '../../constants/prompt.dart';

class OpenAI {
  final String? apiKey = dotenv.env['OPENAI_APIKEY'];
  final String baseScriptUrl = 'https://api.openai.com/v1/';
  final String baseImageUrl = 'https://api.openai.com/v1/';

  OpenAI._privateConstructor();

  static final OpenAI _instance = OpenAI._privateConstructor();

  factory OpenAI() {
    return _instance;
  }

  Map<String, dynamic> deepCopy(Map<String, dynamic> source) {
    return json.decode(json.encode(source));
  }

  Future<OriginalScriptModel> createCompletion(String theme) async {
    String prompt = "$mutablePrompt$theme ";
    var textPromptWithTheme = deepCopy(textPrompt);
    textPromptWithTheme['messages']?[1]['content'] =
        prompt + textPromptWithTheme['messages']?[1]['content'];

    final response = await post(
      Uri.parse('${baseScriptUrl}chat/completions'),
      headers: {
        'Authorization': 'Bearer $apiKey',
        'Content-Type': 'application/json',
      },
      body: json.encode(textPromptWithTheme),
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to load response');
    }
    var responseBody = utf8.decode(response.bodyBytes);
    OriginalScriptModel originalScriptModel =
        OriginalScriptModel.fromJson(json.decode(responseBody));
    return originalScriptModel;
  }
}
