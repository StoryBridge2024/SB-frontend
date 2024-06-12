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

  Map<String, dynamic> toJson() {
    return {
      "theme": theme,
      "primary_character": primary_character,
      "scenes": scriptModelList.map((e) => e.toJson()).toList(),
      "b64_images": b64_images,
      "audioSource": audioSource,
    };
  }

  SceneModel.fromJson(Map<String, dynamic> json)
      : primary_character = json['primary_character'],
        scriptModelList = (json['scenes'] as List)
            .map((e) => ScriptModel.fromJson(e))
            .toList(),
        b64_images = List<String>.from(json['b64_images']),
        audioSource = (json['audioSource'] as List<Uint8List>);
}
