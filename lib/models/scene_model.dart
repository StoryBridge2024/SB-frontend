import 'package:frontend/models/script_model.dart';

class SceneModel {
  late final int number_of_total_character;
  late final List<ScriptModel> scriptModelList;
  late final List<String> b64_images;

  SceneModel({
    required Map<String, dynamic> content,
    required List<String> images,
  }) {
    number_of_total_character = content["number_of_total_character"];
    scriptModelList =
        (content["scene"] as List).map((e) => ScriptModel.fromJson(e)).toList();
    b64_images = images;
  }
}
