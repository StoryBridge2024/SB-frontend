import 'dart:convert';

import 'package:flip_card/flip_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:frontend/constants/dummy_data.dart';
import 'package:frontend/constants/fairytaleConstants.dart';
import 'package:frontend/pages/homePage.dart';
import 'package:frontend/constants/const.dart';

bool _doTTSRunning = false;
bool _doMissionChecking = false;
bool _doStampRunning = false;
bool _doPageMovementRunning = false;
ValueNotifier<bool> doMissionOn = ValueNotifier(false);

bool _isPageMovementRunning = false;

ValueNotifier<bool> playButton = ValueNotifier(false);

void toggle(bool toggle) {
  if (_doPageMovementRunning && !_isPageMovementRunning) {
    _isPageMovementRunning = true;
    _doPageMovementRunning = false;
    doMissionOn.value = false;

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

class MakeBook extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MakeBookHomePage();
  }
}

class MakeBookHomePage extends StatelessWidget {
  _renderContentFront(context, int index, color) {
    return Card(
      elevation: 0.0,
      color: Color(0x00000000),
      child: FlipCard(
        controller: controllerF[index],
        direction: FlipDirection.HORIZONTAL,
        side: CardSide.FRONT,
        speed: 1000,
        onFlipDone: (status) {
          _isPageMovementRunning = false;
          if (clr_index.value != 0 || clr_index.value != 9) {
            _doTTSRunning = true;
          } else {
            _doPageMovementRunning = true;
          }
        },
        front: Container(
          child: Row(
            children: [
              Flexible(
                flex: 1,
                child: Container(),
              ),
              Flexible(
                flex: 1,
                child: Container(
                  decoration: BoxDecoration(
                    color: color,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.7),
                        blurRadius: 5.0,
                        spreadRadius: 0.0,
                        offset: const Offset(0, 7),
                      )
                    ],
                  ),
                  child: (index != 0)
                      ? Text(
                          (useDummy)
                              ? 'wowwow'
                              : gSceneModel!
                                  .scriptModelList[index].scene_contents,
                          style: TextStyle(
                            fontSize: 40,
                            fontFamily: 'DDO',
                          ),
                        )
                      : Container(),
                ),
              ),
            ],
          ),
        ),
        back: Container(),
      ),
    );
  }

  _renderContentBack(context, int index, color) {
    return Card(
      elevation: 0.0,
      color: Color(0x00000000),
      child: FlipCard(
        controller: controllerB[index],
        direction: FlipDirection.HORIZONTAL,
        side: CardSide.FRONT,
        speed: 1000,
        onFlipDone: (status) {
          _isPageMovementRunning = false;
          if (clr_index.value != 0 || clr_index.value != 9) {
            _doTTSRunning = true;
          } else {
            _doPageMovementRunning = true;
          }
        },
        front: Container(),
        back: Container(
          height: double.infinity,
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                flex: 1,
                child: Container(
                  decoration: BoxDecoration(
                    color: color,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.7),
                        blurRadius: 5.0,
                        spreadRadius: 0.0,
                        offset: const Offset(0, 7),
                      )
                    ],
                  ),
                  height: double.infinity,
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: (index != 8)
                      ? (useDummy)
                          ? Image.asset(
                              imgs[index],
                              height: 600,
                              width: 600,
                            )
                          : Image.memory(
                              base64Decode(
                                gSceneModel!.b64_images.elementAt(index),
                              ),
                              height: 600,
                              width: 600,
                              gaplessPlayback: true,
                            )
                      : Container(),
                ),
              ),
              Flexible(
                flex: 1,
                child: Container(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _renderQRFront(context, int index, color) {
    return Card(
      elevation: 0.0,
      color: Color(0x00000000),
      child: FlipCard(
        controller: controllerF[index],
        direction: FlipDirection.HORIZONTAL,
        side: CardSide.FRONT,
        speed: 1000,
        onFlipDone: (status) {
          _isPageMovementRunning = false;
          if (clr_index.value != 0 || clr_index.value != 9) {
            _doTTSRunning = true;
          } else {
            _doPageMovementRunning = true;
          }
        },
        front: Container(
          child: Row(
            children: [
              Flexible(
                flex: 1,
                child: Container(),
              ),
              Flexible(
                flex: 1,
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  alignment: Alignment.center,
                  color: color,
                  child: Text(
                    '캐릭터 배치 시작하기'
                    '화면을 눌러주세요',
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        back: Container(),
      ),
    );
  }

  FrontBookCoverOnStack(context, index, color) {
    return _renderQRFront(context, index, color);
  }

  FrontOnStack(context, index, color) {
    return _renderContentFront(context, index, color);
  }

  BackOnStack(context, index, color) {
    return _renderContentBack(context, index, color);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              child: Text('캐릭터 배치하기'),
            ),
          ),
          Expanded(
            flex: 10,
            child: Stack(
              children: <Widget>[
                FrontOnStack(context, 8, Color(0xFFFFFFFF)), // 8th page right
                FrontOnStack(context, 7, Color(0xFFFFFFFF)), // 7th page right
                FrontOnStack(context, 6, Color(0xFFFFFFFF)), // 6th page right
                FrontOnStack(context, 5, Color(0xFFFFFFFF)), // 5th page right
                FrontOnStack(context, 4, Color(0xFFFFFFFF)), // 4th page right
                FrontOnStack(context, 3, Color(0xFFFFFFFF)), // 3rd page right
                FrontOnStack(context, 2, Color(0xFFFFFFFF)), // 2nd page right
                FrontOnStack(context, 1, Color(0xFFFFFFFF)), // 1st page right
                FrontBookCoverOnStack(context, 0, Colors.white), // front cover
                BackOnStack(context, 0, Color(0xFFFFFFFF)), // 1st page left
                BackOnStack(context, 1, Color(0xFFFFFFFF)), // 2nd page left
                BackOnStack(context, 2, Color(0xFFFFFFFF)), // 3rd page left
                BackOnStack(context, 3, Color(0xFFFFFFFF)), // 4th page left
                BackOnStack(context, 4, Color(0xFFFFFFFF)), // 5th page left
                BackOnStack(context, 5, Color(0xFFFFFFFF)), // 6th page left
                BackOnStack(context, 6, Color(0xFFFFFFFF)), // 7th page left
                BackOnStack(context, 7, Color(0xFFFFFFFF)), // 8th page left
                pageFlip(),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(),
          ),
        ],
      ),
    );
  }

  Widget ShadowContainer() {
    return ValueListenableBuilder<int>(
      valueListenable: clr_index,
      builder: (context, value, _) {
        return Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(),
            ),
            Expanded(
              flex: 10,
              child: Row(
                children: [
                  Flexible(
                    flex: 1,
                    child: (clr_index.value != 0)
                        ? Container(
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.7),
                                  blurRadius: 5.0,
                                  spreadRadius: 0.0,
                                  offset: const Offset(0, 7),
                                )
                              ],
                            ),
                          )
                        : Container(),
                  ),
                  Flexible(
                    flex: 1,
                    child: (clr_index.value != 9)
                        ? Container(
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.7),
                                  blurRadius: 5.0,
                                  spreadRadius: 0.0,
                                  offset: const Offset(0, 7),
                                )
                              ],
                            ),
                          )
                        : Container(),
                  )
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(),
            ),
          ],
        );
      },
    );
  }

  Widget pageFlip() {
    return Column(
      children: [
        Flexible(
          flex: 1,
          child: Container(),
        ),
        Flexible(
          flex: 10,
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  height: double.infinity,
                  width: double.infinity,
                  child: FloatingActionButton(
                    elevation: 0,
                    hoverElevation: 0,
                    focusElevation: 0,
                    highlightElevation: 0,
                    focusColor: Color(0x00000000),
                    backgroundColor: Color(0x00000000),
                    onPressed: () {
                      _doTTSRunning = false;
                      _doMissionChecking = false;
                      _doStampRunning = false;
                      _doPageMovementRunning = true;

                      toggle(false);
                    },
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  height: double.infinity,
                  width: double.infinity,
                  child: FloatingActionButton(
                    elevation: 0,
                    hoverElevation: 0,
                    focusElevation: 0,
                    highlightElevation: 0,
                    focusColor: Color(0x00000000),
                    hoverColor: Color(0x00000000),
                    backgroundColor: Color(0x00000000),
                    onPressed: () {
                      _doTTSRunning = false;
                      _doMissionChecking = false;
                      _doStampRunning = false;
                      _doPageMovementRunning = true;

                      toggle(true);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
        Flexible(
          flex: 1,
          child: ValueListenableBuilder<int>(
            valueListenable: clr_index,
            builder: (context, value, _) {
              return Container(
                alignment: Alignment.centerRight,
                child: (clr_index.value == 9)
                    ? TextButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            Color.fromARGB(0x75, 0x91, 0xB6, 0xFF),
                          ),
                        ),
                        child: Text(
                          "첫 화면으로 가기",
                          style: TextStyle(fontSize: 25),
                        ),
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomePage(),
                            ),
                          );
                        },
                      )
                    : Container(),
              );
            },
          ),
        ),
      ],
    );
  }
}
