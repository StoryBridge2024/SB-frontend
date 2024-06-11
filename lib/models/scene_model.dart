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
    scriptModelList = (content["scenes"] as List)
        .map((e) => ScriptModel.fromJson(e))
        .toList();
    b64_images = images;
    primary_character = content["primary_character"];
  }

  Map<String, dynamic> toJson() {
    return {
      "primary_character": primary_character,
      "scenes": scriptModelList.map((e) => e.toJson()).toList(),
      "b64_images": b64_images,
      "audioSource": audioSource,
    };
  }

  SceneModel.copy(SceneModel other)
      : primary_character = other.primary_character,
        scriptModelList = other.scriptModelList
            .map((script) => ScriptModel.fromJson(script.toJson()))
            .toList(),
        b64_images = List<String>.from(other.b64_images),
        audioSource = List<String>.from(other.audioSource);
}
