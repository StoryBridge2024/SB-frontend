import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:frontend/constants/const.dart';
import 'package:frontend/models/scene_model.dart';
import 'package:frontend/services/api/openai_api.dart';
import 'package:frontend/constants/animal_list.dart';
import '../constants/action_list.dart';
import '../constants/fairytaleConstants.dart';
import 'makingCharacter.dart';

class MakeFairytale extends StatelessWidget {
  final String text;

  MakeFairytale(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    final Future<SceneModel> sceneModel = OpenAI().createScene(text);

    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromARGB(0xFF, 0xC9, 0xEE, 0xFC),
        body: FutureBuilder(
          future: sceneModel,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              gSceneModel = snapshot.data as SceneModel;
              print("number of total character: ${gSceneModel!.number_of_total_character}");
              for(int i=0;i<NUMBER_OF_SCENE;i++){
                print("number of character: ${gSceneModel!.scriptModelList[i].number_of_character}");
                print("scene contents: ${gSceneModel!.scriptModelList[i].scene_contents}");
                print("description of illustration: ${gSceneModel!.scriptModelList[i].description_of_illustration}");
                print("action used in action list: ${gSceneModel!.scriptModelList[i].action_used_in_action_list}");
                print("animals from animal list: ${gSceneModel!.scriptModelList[i].animals_from_animal_list}");
                print("characters: ${gSceneModel!.scriptModelList[i].characters}");
              }
              print("b64 images: ${gSceneModel!.b64_images}");

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
                      Navigator.push(
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
                      '이야기를 만드는 중입니다',
                      style: TextStyle(
                        color: Color.fromARGB(0xFF, 0x3B, 0x2F, 0xCA),
                        fontSize: 80,
                      ),
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
        color: Color.fromARGB(0xFF, 0xB9, 0xEE, 0xFF),
        child: Column(
          children: [
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.fromLTRB(20, 20, 0, 0),
              child: Text(
                '동화 만들기',
                style: TextStyle(
                    fontSize: 60,
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

  Widget createPositionedAnimal({
    required String animalName,
    required String assetPath,
    required List<double> locX,
    required List<double> locY,
    required int index,
    required Function setStateCallback,
  }) {
    return Stack(
      children: [
        Positioned(
          left: locX.elementAt(index),
          top: locY.elementAt(index),
          child: animalName ==
                  gSceneModel!
                      .scriptModelList[index].animals_from_animal_list[0]
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
          child: Container(
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
          ),
        ),
      ],
    );
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
                  Positioned(
                    left: 0,
                    right: 0,
                    child: Image.memory(
                      base64Decode(gSceneModel!.b64_images.elementAt(index)),
                      height: 500,
                      width: 500,
                    ),
                  ),
                  Positioned(
                    left: locX1.elementAt(index),
                    top: locY1.elementAt(index),
                    child: Image.asset(
                      'assets/image/img.png',
                      height: 300,
                      width: 300,
                    ),
                  ),
                  Positioned(
                    left: locX1.elementAt(index),
                    top: locY1.elementAt(index),
                    child: Container(
                      width: 300,
                      height: 300,
                      color: Color(0x00FFFFFF),
                      child: GestureDetector(
                        onScaleUpdate: (touch) {
                          setState(
                            () {
                              locX1[index] += touch.focalPointDelta.dx;
                              locY1[index] += touch.focalPointDelta.dy;
                            },
                          );
                        },
                      ),
                    ),
                  ),
                  createPositionedAnimal(
                    animalName: "호랑이",
                    assetPath: 'assets/animal/tiger.png',
                    locX: locX2,
                    locY: locY2,
                    index: index,
                    setStateCallback: setState,
                  ),
                  createPositionedAnimal(
                    animalName: "원숭이",
                    assetPath: 'assets/animal/monkey.png',
                    locX: locX3,
                    locY: locY3,
                    index: index,
                    setStateCallback: setState,
                  ),
                  createPositionedAnimal(
                    animalName: "기린",
                    assetPath: 'assets/animal/giraffe.png',
                    locX: locX4,
                    locY: locY4,
                    index: index,
                    setStateCallback: setState,
                  ),
                  createPositionedAnimal(
                    animalName: "코알라",
                    assetPath: 'assets/animal/coala.png',
                    locX: locX5,
                    locY: locY5,
                    index: index,
                    setStateCallback: setState,
                  ),
                  createPositionedAnimal(
                    animalName: "코끼리",
                    assetPath: 'assets/animal/elephant.png',
                    locX: locX6,
                    locY: locY6,
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
                      padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
                      height: double.infinity,
                      width: double.infinity,
                      alignment: Alignment.center,
                      child: Text(
                        gSceneModel!.scriptModelList[index].scene_contents,
                        style: TextStyle(
                          fontSize: 30,
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
                              child: TextButton(
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                    Color.fromARGB(0x75, 0x91, 0xB6, 0xFF),
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
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => MakeCharacter(),
                                      ),
                                    );
                                  }
                                },
                                child: Text(
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
