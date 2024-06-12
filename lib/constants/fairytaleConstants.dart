import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:frontend/constants/const.dart';
import 'package:frontend/models/scene_model.dart';
import 'package:audioplayers/audioplayers.dart';

AudioCache audioPlayer = AudioCache(prefix: "audio.aac");

SceneModel? gSceneModel;

List<double> locX1 = [100, 100, 100, 100, 100, 100, 100, 100, 80];
List<double> locY1 = [100, 100, 100, 100, 100, 100, 100, 100, 180];
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
List<double> locX7 = [100, 100, 100, 100, 100, 100, 100, 100];
List<double> locY7 = [100, 100, 100, 100, 100, 100, 100, 100];
List<double> locX8 = [100, 100, 100, 100, 100, 100, 100, 100];
List<double> locY8 = [100, 100, 100, 100, 100, 100, 100, 100];

int characterTurn = 0;
int cameraTurn = 0;
int cameraInverse = 0;
ValueNotifier<bool> missionclear = ValueNotifier(false);

var clr_index = ValueNotifier<int>(0);

List<FlipCardController> controllerF =
    List.generate(10, (_) => FlipCardController());

List<FlipCardController> controllerB =
    List.generate(10, (_) => FlipCardController());

bool doTTSRunning = false;
bool doMissionChecking = false;
bool doStampRunning = false;
bool doPageMovementRunning = false;

bool isPageMovementRunning = false;

ValueNotifier<bool> playButton = ValueNotifier(false);

void toggle(bool toggle) {
  if (doPageMovementRunning && !isPageMovementRunning) {
    isPageMovementRunning = true;
    doPageMovementRunning = false;

    AudioPlayer().play(AssetSource('audio/pageTurn.mp3'));
    if (toggle && clr_index.value != NUMBER_OF_SCENE + 1) {
      controllerF[clr_index.value].toggleCard();
      controllerB[clr_index.value].toggleCard();
      clr_index.value++;
    } else if (!toggle && clr_index.value != 0) {
      clr_index.value--;
      controllerF[clr_index.value].toggleCard();
      controllerB[clr_index.value].toggleCard();
    }
  }
}

List<Widget> pages = List<Widget>.filled(8, Container());
