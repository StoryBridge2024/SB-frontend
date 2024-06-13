import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:frontend/constants/const.dart';
import 'package:frontend/models/scene_model.dart';
import 'package:audioplayers/audioplayers.dart';

AudioCache audioPlayer = AudioCache(prefix: "audio.aac");

SceneModel? gSceneModel;

List<double> humanLocX = [100, 100, 100, 100, 100, 100, 100, 100, 80];
List<double> humanLocY = [100, 100, 100, 100, 100, 100, 100, 100, 180];
List<double> tigerLocX = [100, 100, 100, 100, 100, 100, 100, 100];
List<double> tigerLocY = [100, 100, 100, 100, 100, 100, 100, 100];
List<double> monkeyLocX = [100, 100, 100, 100, 100, 100, 100, 100];
List<double> monkeyLocY = [100, 100, 100, 100, 100, 100, 100, 100];
List<double> giraffeLocX = [100, 100, 100, 100, 100, 100, 100, 100];
List<double> giraffeLocY = [100, 100, 100, 100, 100, 100, 100, 100];
List<double> koalaLocX = [100, 100, 100, 100, 100, 100, 100, 100];
List<double> koalaLocY = [100, 100, 100, 100, 100, 100, 100, 100];
List<double> elephantLocX = [100, 100, 100, 100, 100, 100, 100, 100];
List<double> elephantLocY = [100, 100, 100, 100, 100, 100, 100, 100];
List<double> lionLocX = [100, 100, 100, 100, 100, 100, 100, 100];
List<double> lionLocY = [100, 100, 100, 100, 100, 100, 100, 100];
List<double> puppyLocX = [100, 100, 100, 100, 100, 100, 100, 100];
List<double> puppyLocY = [100, 100, 100, 100, 100, 100, 100, 100];

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
