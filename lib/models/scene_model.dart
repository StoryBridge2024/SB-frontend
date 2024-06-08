import 'package:audioplayers/audioplayers.dart';
import 'package:frontend/models/script_model.dart';

class SceneModel {
  late final String primary_character;
  late final List<ScriptModel> scriptModelList;
  late final List<String> b64_images;
  late final List<String> audioSource;

  SceneModel({
    required Map<String, dynamic> content,
    required List<String> images,
    required this.audioSource,
  }) {
    scriptModelList =
        (content["scenes"] as List).map((e) => ScriptModel.fromJson(e)).toList();
    b64_images = images;
    primary_character = content["primary_character"];
  }
}
