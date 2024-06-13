import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:frontend/constants/const.dart';
import 'package:frontend/constants/dummy_data.dart';
import 'package:frontend/models/scene_model.dart';
import 'package:frontend/services/api/openai_api.dart';

import '../constants/fairytaleConstants.dart';
import 'makingCharacter.dart';

class MakeFairytale extends StatelessWidget {
  final String text;

  MakeFairytale(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    if (useDummy) {
      return PlacingCharacter();
    }

    final Future<SceneModel> sceneModel = OpenAI().createScene(text);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color.fromARGB(0xFF, 0xD1, 0xEB, 0xFF),
        body: FutureBuilder(
          future: sceneModel,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              gSceneModel = snapshot.data as SceneModel;
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      '이야기가 완성되었어요!',
                      style: TextStyle(
                        color: Color.fromARGB(0xFF, 0x13, 0x13, 0x13),
                        fontSize: 80,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Text(
                    '삽화와 이야기를 보고, 캐릭터를 적절한 곳에 배치해주세요!',
                    style: TextStyle(fontSize: 50),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextButton(
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all(
                        EdgeInsets.all(40),
                      ),
                      backgroundColor: MaterialStateProperty.all(
                        Color.fromARGB(0x75, 0x91, 0xB6, 0xFF),
                      ),
                    ),
                    child: Text(
                      '배치하기',
                      style: TextStyle(
                        fontSize: 50,
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PlacingCharacter(),
                        ),
                      );
                    },
                  ),
                ],
              );
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            } else {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      '어떤 이야기가 나올까요? 같이 상상해봐요!',
                      style: TextStyle(
                        color: Color.fromARGB(0xFF, 0x3B, 0x2F, 0xCA),
                        fontSize: 65,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      '동화 주제: $text',
                      style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    CircularProgressIndicator(
                      color: Color.fromARGB(0xFF, 0xFF, 0xFF, 0xFF),
                      strokeWidth: 10,
                    ),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}

class PlacingCharacter extends StatefulWidget {
  const PlacingCharacter({super.key});

  @override
  State<PlacingCharacter> createState() => _PlacingCharacterState();
}

class _PlacingCharacterState extends State<PlacingCharacter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color.fromARGB(0xFF, 0xD1, 0xEB, 0xFF),
        child: Column(
          children: [
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.fromLTRB(20, 20, 0, 0),
              child: Text(
                '동화 만들기',
                style: TextStyle(
                    fontSize: 60,
                    fontWeight: FontWeight.w600,
                    color: Color.fromARGB(0xFF, 0x13, 0x13, 0x13)),
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                height: double.infinity,
                color: Color(0xFFFFFFFF),
                margin: EdgeInsets.all(25),
                child: TmpFairytale(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TmpFairytale extends StatefulWidget {
  const TmpFairytale({super.key});

  @override
  State<TmpFairytale> createState() => _TmpFairytaleState();
}

class _TmpFairytaleState extends State<TmpFairytale> {
  int index = 0;

  List<Widget> createPositionedAnimal({
    required String animalName,
    required String assetPath,
    required List<double> locX,
    required List<double> locY,
    required int index,
    required Function setStateCallback,
  }) {
    if (useDummy) {
      return [
        Positioned(
          left: locX.elementAt(index),
          top: locY.elementAt(index),
          child: animals[index].contains(animalName)
              ? Image.asset(
                  assetPath,
                  height: 150,
                  width: 150,
                )
              : Container(),
        ),
        Positioned(
          left: locX.elementAt(index),
          top: locY.elementAt(index),
          child: animals[index].contains(animalName)
              ? Container(
                  width: 150,
                  height: 150,
                  color: Color(0x00FFFFFF),
                  child: GestureDetector(
                    onScaleUpdate: (touch) {
                      setStateCallback(() {
                        locX[index] += touch.focalPointDelta.dx;
                        locY[index] += touch.focalPointDelta.dy;
                      });
                    },
                  ),
                )
              : Container(),
        ),
      ];
    }

    if (gSceneModel == null ||
        gSceneModel!.scriptModelList.length <= index ||
        gSceneModel!.scriptModelList[index].animals_from_animal_list.isEmpty) {
      return [
        Container(),
      ]; // 조건에 맞지 않으면 빈 컨테이너 반환
    }
    return [
      Positioned(
        left: locX.elementAt(index),
        top: locY.elementAt(index),
        child: gSceneModel!.scriptModelList[index].animals_from_animal_list
                .contains(animalName)
            ? Image.asset(
                assetPath,
                height: 150,
                width: 150,
              )
            : Container(),
      ),
      Positioned(
        left: locX.elementAt(index),
        top: locY.elementAt(index),
        child: gSceneModel!.scriptModelList[index].animals_from_animal_list
                .contains(animalName)
            ? Container(
                width: 150,
                height: 150,
                color: Color(0x00FFFFFF),
                child: GestureDetector(
                  onScaleUpdate: (touch) {
                    setStateCallback(() {
                      locX[index] += touch.focalPointDelta.dx;
                      locY[index] += touch.focalPointDelta.dy;
                    });
                  },
                ),
              )
            : Container(),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child: Container(
              color: Colors.white,
              child: Stack(
                children: [
                  Center(
                    child: (useDummy)
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
                          ),
                  ),
                  Positioned(
                    left: humanLocX.elementAt(index),
                    top: humanLocY.elementAt(index),
                    child: Image.asset(
                      'assets/image/img.png',
                      height: 300,
                      width: 300,
                    ),
                  ),
                  Positioned(
                    left: humanLocX.elementAt(index),
                    top: humanLocY.elementAt(index),
                    child: Container(
                      width: 300,
                      height: 300,
                      color: Color(0x00FFFFFF),
                      child: GestureDetector(
                        onScaleUpdate: (touch) {
                          setState(
                            () {
                              humanLocX[index] += touch.focalPointDelta.dx;
                              humanLocY[index] += touch.focalPointDelta.dy;
                            },
                          );
                        },
                      ),
                    ),
                  ),
                  ...createPositionedAnimal(
                    animalName: "호랑이",
                    assetPath: 'assets/animal/tiger.png',
                    locX: tigerLocX,
                    locY: tigerLocY,
                    index: index,
                    setStateCallback: setState,
                  ),
                  ...createPositionedAnimal(
                    animalName: "원숭이",
                    assetPath: 'assets/animal/monkey.png',
                    locX: monkeyLocX,
                    locY: monkeyLocY,
                    index: index,
                    setStateCallback: setState,
                  ),
                  ...createPositionedAnimal(
                    animalName: "기린",
                    assetPath: 'assets/animal/giraffe.png',
                    locX: giraffeLocX,
                    locY: giraffeLocY,
                    index: index,
                    setStateCallback: setState,
                  ),
                  ...createPositionedAnimal(
                    animalName: "코알라",
                    assetPath: 'assets/animal/koala.png',
                    locX: koalaLocX,
                    locY: koalaLocY,
                    index: index,
                    setStateCallback: setState,
                  ),
                  ...createPositionedAnimal(
                    animalName: "코끼리",
                    assetPath: 'assets/animal/elephant.png',
                    locX: elephantLocX,
                    locY: elephantLocY,
                    index: index,
                    setStateCallback: setState,
                  ),
                  ...createPositionedAnimal(
                    animalName: "사자",
                    assetPath: 'assets/animal/lion.png',
                    locX: lionLocX,
                    locY: lionLocY,
                    index: index,
                    setStateCallback: setState,
                  ),
                  ...createPositionedAnimal(
                    animalName: "강아지",
                    assetPath: 'assets/animal/puppy.png',
                    locX: puppyLocX,
                    locY: puppyLocY,
                    index: index,
                    setStateCallback: setState,
                  ),
                ],
              ),
            ),
          ),
          Flexible(
            child: Container(
              width: double.infinity,
              height: double.infinity,
              child: Column(
                children: [
                  Flexible(
                    flex: 3,
                    child: Container(
                      padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                      height: double.infinity,
                      width: double.infinity,
                      alignment: Alignment.center,
                      child: (useDummy)
                          ? Text(
                              texts[index],
                              style: TextStyle(
                                fontSize: 35,
                                fontFamily: 'DDO',
                              ),
                            )
                          : Text(
                              gSceneModel!
                                  .scriptModelList[index].scene_contents,
                              style: TextStyle(
                                fontSize: 35,
                                fontFamily: 'DDO',
                              ),
                            ),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Container(
                      height: double.infinity,
                      width: double.infinity,
                      child: Row(
                        children: [
                          Flexible(
                            child: Container(
                              padding: EdgeInsets.all(30),
                              height: double.infinity,
                              width: double.infinity,
                              child: (index == 0)
                                  ? Container()
                                  : TextButton(
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                          Color.fromARGB(
                                              0x75, 0x91, 0xB6, 0xFF),
                                        ),
                                      ),
                                      onPressed: () {
                                        if (index > 0) {
                                          setState(
                                            () {
                                              index -= 1;
                                            },
                                          );
                                        }
                                      },
                                      child: Text(
                                        '이전',
                                        style: TextStyle(fontSize: 30),
                                      ),
                                    ),
                            ),
                          ),
                          Flexible(
                            child: Container(
                              padding: EdgeInsets.all(30),
                              height: double.infinity,
                              width: double.infinity,
                              child: TextButton(
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                    Color.fromARGB(0x75, 0x91, 0xB6, 0xFF),
                                  ),
                                ),
                                onPressed: () {
                                  if (index < NUMBER_OF_SCENE - 1) {
                                    setState(
                                      () {
                                        index += 1;
                                      },
                                    );
                                  } else if (index == NUMBER_OF_SCENE - 1) {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => MakeCharacter(),
                                      ),
                                    );
                                  }
                                },
                                child: (index == 7)
                                    ? Text(
                                        '배치하기 종료',
                                        style: TextStyle(fontSize: 30),
                                      )
                                    : Text(
                                        '다음',
                                        style: TextStyle(fontSize: 30),
                                      ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
