import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:frontend/constants/action_list.dart';
import 'package:frontend/models/script_model.dart';
import 'package:http/http.dart';
import '../../constants/prompt.dart';
import '../../models/image_model.dart';
import '../../models/scene_model.dart';

class OpenAI {
  final String? apiKey = dotenv.env['OPENAI_APIKEY'];

  OpenAI._privateConstructor();

  static final OpenAI _instance = OpenAI._privateConstructor();

  factory OpenAI() {
    return _instance;
  }

  Map<String, dynamic> deepCopy(Map<String, dynamic> source) {
    return json.decode(json.encode(source));
  }

  Future<bool> checkValidation(String b64_json) async {
    //compose prompt with url
    var visionPromptWithImage = deepCopy(VISION_PROMPT);
    visionPromptWithImage['messages']?[0]['content'][1]['image_url']['url'] =
        "data:image/jpeg;base64, $b64_json";

    //post request
    final response = await post(Uri.parse(baseVisionUrl),
        headers: {
          'Authorization': 'Bearer $apiKey',
          'Content-Type': 'application/json',
        },
        body: json.encode(visionPromptWithImage));
    print("checkValidation: ${response.body}");

    //parse response
    if (response.statusCode != 200) {
      throw Exception('Failed to load response');
    }
    var content =
        json.decode(response.body)["choices"][0]["message"]["content"];
    content = jsonDecode(content);
    if (content["human"] == "yes" || content["text"] == "yes") {
      return false;
    }
    return true;
  }

  Future<Map<String, dynamic>> createCompletion(String theme) async {
    //compose prompt with theme
    String prompt = "$MUTABLE_SCRIPT_PROMPT$theme.";
    var textPromptWithTheme = deepCopy(SCRIPT_PROMPT);
    textPromptWithTheme['messages']?[5]['content'] =
        prompt + textPromptWithTheme['messages']?[5]['content'];

    //post request
    final response = await post(
      Uri.parse(baseScriptUrl),
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
    Map<String, dynamic> content =
        json.decode(scriptResponse.choices[0]["message"]["content"]);
    return content;
  }

  Future<String> createImage(String theme) async {
    //compose prompt with theme
    String prompt = "$MUTABLE_IMAGE_PROMPT$theme.";
    var imagePromptWithTheme = deepCopy(IMAGE_PROMPT);
    imagePromptWithTheme['prompt'] = "${imagePromptWithTheme['prompt']}$prompt";

    //post request
    final response = await post(
      Uri.parse(baseImageUrl),
      headers: {
        'Authorization': 'Bearer $apiKey',
        'Content-Type': 'application/json',
      },
      body: json.encode(imagePromptWithTheme),
    );
    int count = 0;
    late ImageResponse imageResponse;
    do {
      try {
        imageResponse = ImageResponse.fromJson(json.decode(response.body));
        count = -1;
      } catch (e) {
        print("createImage: $e");
        print("createImage: ${json.decode(response.body)}");
      }
    } while (count != -1 && count++ < 3);
    return imageResponse.data[0]["b64_json"];
  }

  //i: 0-8을 1로 바꿈, 수정하자
  Future<SceneModel> createScene(String theme) async {
    DateTime st = DateTime.now();
    late Map<String, dynamic> content;
    int count = 0;
    do {
      try {
        content = await createCompletion(theme);
        (content["scene"] as List).map(
            (e) => ScriptModel.fromJson(e).actions_used_in_action_list.map((e) {
                  if (!ACTION_LIST.contains(e)) {
                    throw Exception("Invalid action: $e");
                  }
                }));
        count = -1;
      } catch (e) {
        print("createScene: $e");
      }
    } while (count != -1 && count++ < 3);

    List<Future<String>> imageFutures = [];
    for (int i = 0; i < 3; i++) {
      imageFutures
          .add(createImage(content["scene"][i]["description_of_illustration"]));
    }
    List<String> images = await Future.wait(imageFutures);
    DateTime et = DateTime.now();
    checkValidation(images[0]);
    Duration d = et.difference(st);
    print("createScene: $d초 걸림");
    return SceneModel(content: content, images: images);
  }
}
