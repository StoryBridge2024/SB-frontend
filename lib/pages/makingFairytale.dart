import 'package:flutter/material.dart';
import 'package:frontend/services/api/openai_api.dart';

import 'makingCharacter.dart';
import '../models/script_model.dart';

class MakeFairytale extends StatelessWidget {
  final String text;

  MakeFairytale(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    final Future<OriginalScriptModel> scriptModel =
        OpenAI().createCompletion(text);
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromARGB(0xFF, 0xB9, 0xEE, 0xFF),
        body: FutureBuilder(
          future: scriptModel,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data?.choices == null) {
                return Text('데이터가 없습니다.');
              }
              return ListView(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Text(
                          '이야기가 완성되었어요!',
                          style: TextStyle(
                            color: Color.fromARGB(0xFF, 0x3B, 0x2F, 0xCA),
                            fontSize: 80,
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
                      Text((snapshot.data?.choices[0])["message"]["content"]),
                    ],
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
                      style: TextStyle(fontSize: 50),
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
                    color: Color.fromARGB(0xFF, 0x3B, 0x2F, 0xCA)),
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
  List<String> l = [
    '첫번째 장면에 대한 이야기입니다.',
    '두번째 장면에 대한 이야기입니다.',
    '세번째 장면에 대한 이야기입니다.'
  ];
  List<String> img = [
    'assets/image/img_1.png',
    'assets/image/img_2.png',
    'assets/image/img_3.png'
  ];

  //이 값을 어떻게 저장해서 어떻게 나중에 쓸지 잘 모르겠음
  List<double> locX = [100, 100, 100];
  List<double> locY = [100, 100, 100];

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
                    child: Image.asset(
                      img.elementAt(index),
                      height: 500,
                      width: 500,
                    ),
                  ),
                  Positioned(
                    left: locX.elementAt(index),
                    top: locY.elementAt(index),
                    child: Image.asset(
                      'assets/image/img.png',
                      height: 300,
                      width: 300,
                    ),
                  ),
                  Positioned(
                    left: locX.elementAt(index),
                    top: locY.elementAt(index),
                    child: Container(
                      width: 300,
                      height: 300,
                      color: Color(0x00FFFFFF),
                      child: GestureDetector(
                        onScaleUpdate: (touch) {
                          setState(
                            () {
                              locX[index] += touch.focalPointDelta.dx;
                              locY[index] += touch.focalPointDelta.dy;
                            },
                          );
                        },
                      ),
                    ),
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
                      height: double.infinity,
                      width: double.infinity,
                      alignment: Alignment.center,
                      child: Text(
                        l.elementAt(index),
                        style: TextStyle(fontSize: 40),
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
                                  if (index < 2) {
                                    setState(
                                      () {
                                        index += 1;
                                      },
                                    );
                                  } else if (index == 2) {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const MakeCharacter(),
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
