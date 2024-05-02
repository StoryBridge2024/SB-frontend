import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:frontend/models/script_model.dart';
import 'package:http/http.dart';
import '../../constants/prompt.dart';
import '../../models/image_model.dart';
import '../../models/scene_model.dart';

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

  Future<Map<String,dynamic>> createCompletion(String theme) async {
    //compose prompt with theme
    String prompt = "$MUTABLE_PROMPT$theme ";
    var textPromptWithTheme = deepCopy(TEXT_PROMPT);
    textPromptWithTheme['messages']?[1]['content'] =
        prompt + textPromptWithTheme['messages']?[1]['content'];

    //post request
    final response = await post(
      Uri.parse('${baseScriptUrl}chat/completions'),
      headers: {
        'Authorization': 'Bearer $apiKey',
        'Content-Type': 'application/json',
      },
      body: json.encode(textPromptWithTheme),
    );

    //parse response
    if (response.statusCode != 200) {
      throw Exception('Failed to load response');
    }
    var responseBody = utf8.decode(response.bodyBytes);
    ScriptResponse scriptResponse =
        ScriptResponse.fromJson(json.decode(responseBody));
    Map<String,dynamic> content = json.decode(scriptResponse.choices[0]["message"]["content"]);
    print("createCompletion: $content");
    return content;
  }

  Future<String> createImage() async {
    //post request
    final response = await post(
      Uri.parse('${baseImageUrl}images/generations'),
      headers: {
        'Authorization': 'Bearer $apiKey',
        'Content-Type': 'application/json',
      },
      body: json.encode(IMAGE_PROMPT),
    );
    print("createImage: ${response.body}");
    ImageResponse imageResponse =
        ImageResponse.fromJson(json.decode(response.body));
    print("createImage");
    return imageResponse.data[0]["b64_json"];
  }

  //i: 0-8을 1로 바꿈, 수정하자
  Future<SceneModel> createScene(String theme) async {
    Map<String,dynamic> content = await createCompletion(theme);
    List<String> images = [];
    for (int i = 0; i < 1; i++) {
      images.add(await createImage());
    }
    print("createScene: $content, $images");
    return SceneModel(content: content, images: images);
  }
}
