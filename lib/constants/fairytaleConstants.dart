import 'package:flutter/cupertino.dart';

import 'package:frontend/models/scene_model.dart';

SceneModel? gSceneModel;

List<double> locX = [100, 100, 100, 100, 100, 100, 100, 100];
List<double> locY = [100, 100, 100, 100, 100, 100, 100, 100];

int characterTurn = 0;
int cameraTurn = 0;

var clr_index = ValueNotifier<int>(0);
