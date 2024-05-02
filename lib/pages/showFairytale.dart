import 'package:flutter/material.dart';
import 'package:frontend/mediapipe/pose_detector_view.dart';

class ShowFairytale extends StatelessWidget {
  const ShowFairytale({super.key});

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
                  color: Color.fromARGB(0xFF, 0x3B, 0x2F, 0xCA),
                ),
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                height: double.infinity,
                color: Color(0xFFFFFFFF),
                margin: EdgeInsets.all(25),
                child: Story(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Story extends StatefulWidget {
  const Story({super.key});

  @override
  State<Story> createState() => _StoryState();
}

class _StoryState extends State<Story> {
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
    Future.delayed(
      const Duration(milliseconds: 2000),
      () {
        if (index < 2) {
          setState(
            () {
              index += 1;
            },
          );
        }
      },
    );

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
                    child: PoseDetectorView(),
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
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
