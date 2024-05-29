import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:frontend/constants/const.dart';
import 'package:frontend/models/scene_model.dart';

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

List<FlipCardController> controllerF =
    List.generate(10, (_) => FlipCardController());

List<FlipCardController> controllerB =
    List.generate(10, (_) => FlipCardController());

bool isTemp1Running = false;
bool isTemp2Running = false;

void toggle(bool toggle) {
  print(isTemp1Running);
  print(isTemp2Running);

  if (toggle && clr_index.value != NUMBER_OF_SCENE + 1) {
    if (!isTemp2Running && !isTemp1Running) {
      isTemp1Running = true;
      temp1(clr_index.value);
      clr_index.value++;
    }
  } else if (!toggle && clr_index.value != 0) {
    if (!isTemp1Running && !isTemp2Running) {
      isTemp2Running = true;
      clr_index.value--;
      temp2(clr_index.value);
    }
  }

  print(clr_index.value);
}

void temp1(int index) {
  controllerF[index].toggleCard();
  controllerB[index].toggleCard();
}

void temp2(int index) {
  controllerF[index].toggleCard();
  controllerB[index].toggleCard();
}

List<Widget> pages = List<Widget>.filled(8, Container());
