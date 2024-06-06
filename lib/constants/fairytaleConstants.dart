import 'package:flutter/cupertino.dart';
import 'package:frontend/models/scene_model.dart';
import 'package:audioplayers/audioplayers.dart';

AudioCache audioPlayer = AudioCache(prefix: "audio.aac");

SceneModel? gSceneModel;

List<double> locX1 = [100, 100, 100, 100, 100, 100, 100, 100, 100];
List<double> locY1 = [100, 100, 100, 100, 100, 100, 100, 100, 100];
List<double> locX2 = [100, 100, 100, 100, 100, 100, 100, 100];
List<double> locY2 = [100, 100, 100, 100, 100, 100, 100, 100];
List<double> locX3 = [100, 100, 100, 100, 100, 100, 100, 100];
List<double> locY3 = [100, 100, 100, 100, 100, 100, 100, 100];
List<double> locX4 = [100, 100, 100, 100, 100, 100, 100, 100];
List<double> locY4 = [100, 100, 100, 100, 100, 100, 100, 100];
List<double> locX5 = [100, 100, 100, 100, 100, 100, 100, 100];
List<double> locY5 = [100, 100, 100, 100, 100, 100, 100, 100];
List<double> locX6 = [100, 100, 100, 100, 100, 100, 100, 100];
List<double> locY6 = [100, 100, 100, 100, 100, 100, 100, 100];

int characterTurn = 0;
int cameraTurn = 0;
int cameraInverse = 0;

var clr_index = ValueNotifier<int>(0);
