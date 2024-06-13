import 'dart:convert';
import 'dart:typed_data';

import 'package:frontend/models/scene_model.dart';

class DBmodel {
  late final SceneModel gSceneModel;

  late final Uint8List image;

  late final List<double> humanLocX;
  late final List<double> humanLocY;
  late final List<double> tigerLocX;
  late final List<double> tigerLocY;
  late final List<double> monkeyLocX;
  late final List<double> monkeyLocY;
  late final List<double> giraffeLocX;
  late final List<double> giraffeLocY;
  late final List<double> koalaLocX;
  late final List<double> koalaLocY;
  late final List<double> elephantLocX;
  late final List<double> elephantLocY;
  late final List<double> lionLocX;
  late final List<double> lionLocY;
  late final List<double> puppyLocX;
  late final List<double> puppyLocY;
}
