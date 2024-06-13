import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:frontend/constants/action_list.dart';
import 'package:frontend/constants/const.dart';
import 'package:frontend/models/script_model.dart';
import 'package:frontend/services/api/tts.dart';
import 'package:http/http.dart';
import 'package:frontend/constants/animal_list.dart';
import 'package:frontend/constants/prompt.dart';
import 'package:frontend/models/image_model.dart';
import 'package:frontend/models/scene_model.dart';
import 'package:frontend/services/db/database_manager/database_manager.dart';
import 'package:frontend/services/util.dart';
import 'package:frontend/constants/fairytaleConstants.dart';

class OpenAI {
  final String? apiKey = dotenv.env['OPENAI_APIKEY'];

  OpenAI._privateConstructor();

  static final OpenAI _instance = OpenAI._privateConstructor();

  factory OpenAI() {
    return _instance;
  }

  Future<void> checkValidation(String b64_json) async {
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

    //parse response
    if (response.statusCode != 200) {
      throw Exception('Failed to load CV response');
    }
    var content =
        json.decode(response.body)["choices"][0]["message"]["content"];
    content = jsonDecode(content);
    if (content["human"] == "yes" ||
        content["text"] == "yes" ||
        content["animal"] == "yes") {
      throw Exception('Invalid image');
    }
    return;
  }

  Future<Map<String, dynamic>> createCompletion(String theme) async {
    //set prompt
    var scriptPrompt = deepCopy(SCRIPT_PROMPT);

    //compose prompt with example responses
    List<int> randomSelect = [];
    for (int i = 0; i < RANDOM_SELECT_R; i++) {
      int randomInt = get_random_int(NUMBER_OF_EXAMPLE_PROMPT);
      while(randomSelect.contains(randomInt)) {
        randomInt = get_random_int(NUMBER_OF_EXAMPLE_PROMPT);
      }
      randomSelect.add(randomInt);
      scriptPrompt["messages"].add(
        deepCopy(EXAMPLE_REQUEST[randomInt]),
      );
      scriptPrompt["messages"].add(
        {"role": "system", "content": ""},
      );
      print(
          "randomInt: $randomInt theme: ${EXAMPLE_REQUEST[randomInt]["content"]}");
    }
    print("=============================================");
    for (int i = 0; i < RANDOM_SELECT_R; i++) {
      scriptPrompt["messages"][i * 2 + 1]["content"] =
          jsonEncode(deepCopy(EXAMPLE_RESPONSE[randomSelect[i]]));
      print("content: ${EXAMPLE_RESPONSE[randomSelect[i]]}");
    }

    //compose prompt with theme
    String prompt = "$MUTABLE_SCRIPT_PROMPT$theme.";
    var userPartPrompt = deepCopy(USER_PART_SCRIPT_PROMPT);
    userPartPrompt['content'] = prompt + userPartPrompt['content'];

    scriptPrompt["messages"].add(userPartPrompt);

    //post request
    final response = await post(
      Uri.parse(baseScriptUrl),
      headers: {
        'Authorization': 'Bearer $apiKey',
        'Content-Type': 'application/json',
      },
      body: json.encode(scriptPrompt),
    );

    //parse response
    if (response.statusCode != 200) {
      print('Status Code: ${response.statusCode}');
      print('Response Body: ${response.body}');
      throw Exception('Failed to load Chat response');
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
    int count = 0;
    late String b64_json;
    late ImageResponse imageResponse;
    late Response response;
    do {
      try {
        response = await post(
          Uri.parse(baseImageUrl),
          headers: {
            'Authorization': 'Bearer $apiKey',
            'Content-Type': 'application/json',
          },
          body: json.encode(imagePromptWithTheme),
        );
        imageResponse = ImageResponse.fromJson(json.decode(response.body));
        b64_json = imageResponse.data[0]["b64_json"];
        await checkValidation(b64_json);
        count = -1;
      } catch (e) {
        print("createImage: $e $count");
      }
    } while (count != -1 && ++count < LIMIT_OF_ITERATION);
    return b64_json;
  }

  Future<SceneModel> createScene(String theme) async {
    DateTime st = DateTime.now();
    late Map<String, dynamic> content;
    int count = 0;
    do {
      try {
        content = await createCompletion(theme);
        (content["scenes"] as List).forEach((e) {
          ScriptModel scriptModel = ScriptModel.fromJson(e);
          if (scriptModel.action_used_in_action_list != null) {
            if (!ACTION_LIST.contains(scriptModel.action_used_in_action_list)) {
              throw Exception(
                  "Invalid action: ${scriptModel.action_used_in_action_list}");
            }
          }
          scriptModel.animals_from_animal_list.forEach((animal) {
            if (!ANIMAL_LIST.contains(animal)) {
              throw Exception("Invalid animal: $animal");
            }
          });
        });
        count = -1;
      } catch (e) {
        print("createScene: $e $count");
      }
    } while (count != -1 && ++count < LIMIT_OF_ITERATION);

    print("createScene2");
    final List<Future<String>> imageFutures = [];
    final List<Future<Uint8List>> audioSources = [];
    for (int i = 0; i < NUMBER_OF_SCENE; i++) {
      imageFutures.add(
          createImage(content["scenes"][i]["description_of_illustration"]));
      audioSources
          .add(TTS().createSpeech(content["scenes"][i]["scene_contents"]));
    }

    print("createScene3");
    List<String> images = await Future.wait(imageFutures);
    List<Uint8List> audios = await Future.wait(audioSources);
    DateTime et = DateTime.now();
    Duration d = et.difference(st);
    print("createScene: $d초 걸림");
    SceneModel sceneModel = SceneModel(
        theme: theme, content: content, images: images, audioSource: audios);

    //insert into database
    //================================================================================================
    Map<String, dynamic> map = sceneModel.toJson();
    String str = jsonEncode(map);
    await database
        .into(database.fairytailModel)
        .insert(FairytailModelCompanion.insert(
          sceneModel: str,
          image: "aaa",
          humanLocX: "aaa",
          humanLocY: "aaa",
          tigerLocX: "aaa",
          tigerLocY: "aaa",
          monkeyLocX: "aaa",
          monkeyLocY: "aaa",
          giraffeLocX: "aaa",
          giraffeLocY: "aaa",
          koalaLocX: "aaa",
          koalaLocY: "aaa",
          elephantLocX: "aaa",
          elephantLocY: "aaa",
          lionLocX: "aaa",
          lionLocY: "aaa",
          puppyLocX: "aaa",
          puppyLocY: "aaa",
        ));
    //================================================================================================

    //select from database
    //================================================================================================
    List<FairytailModelData> list =
        await database.select(database.fairytailModel).get();
    print("list: $list");
    print("list[0]: ${list[0]}");
    print("list[0].sceneModel: ${list[0].sceneModel}");
    //================================================================================================
    return sceneModel;
  }
}
