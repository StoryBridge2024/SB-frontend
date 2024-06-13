import 'dart:io';
import 'dart:typed_data';

import 'package:frontend/models/script_model.dart';

class SceneModel {
  late final String theme;
  late final String primary_character;
  late final List<ScriptModel> scriptModelList;
  late final List<String> b64_images;
  late final List<Uint8List> audioSource;

  SceneModel({
    required this.theme,
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

  SceneModel.full({
    required this.theme,
    required this.primary_character,
    required this.scriptModelList,
    required this.b64_images,
    required this.audioSource,
  }) {}

  Map<String, dynamic> toJson() {
    return {
      "theme": theme,
      "primary_character": primary_character,
      "scenes": scriptModelList.map((e) => e.toJson()).toList(),
      "b64_images": b64_images,
      "audioSource": audioSource,
    };
  }

  static SceneModel fromJson(Map<String, dynamic> json) {
    List<ScriptModel> scriptModelList = [];
    var sceneList = json['scenes'] as List;
    for (int i = 0; i < sceneList.length; i++) {
      var sceneMap = sceneList[i] as Map<String, dynamic>;
      scriptModelList.add(ScriptModel.fromJson(sceneMap));
    }
    List<String> b64ImagesList =
        (json['b64_images'] as List).map((e) => e.toString()).toList();
    List<Uint8List> audioSourceList = [];
    if (json['audioSource'] != null) {
      var audioList = json['audioSource'] as List;
      audioSourceList =
          audioList.map((e) => Uint8List.fromList(e.cast<int>())).toList();
    }

    print(json['scenes']);
    SceneModel sceneModel = SceneModel.full(
      theme: json['theme'],
      primary_character: json['primary_character'],
      scriptModelList: scriptModelList,
      b64_images: b64ImagesList,
      audioSource: audioSourceList,
    );
    return sceneModel;
  }
}
